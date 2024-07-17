using loginwawaky.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using loginwawaky.Models;
using System.Data.Entity;

namespace loginwawaky.Controllers
{
	public class AsistenciasController : Controller
	{
		private loginEntities db = new loginEntities();

		public ActionResult Index(int? cursoId)
		{
			// Cargar solo los cursos activos (estadoC == true)
			var cursos = db.Cursos.Where(c => c.estadoC == true).ToList();
			ViewBag.Cursos = new SelectList(cursos, "idCurso", "Paralelo");

			var asistencias = db.Asistencias.Include(a => a.Alumnos).AsQueryable(); // Usar AsQueryable para facilitar el filtrado

			if (cursoId.HasValue)
			{
				// Filtrar las asistencias basadas en la matrícula de los alumnos para el curso seleccionado
				asistencias = asistencias.Where(a => a.Alumnos.Matriculas.Any(m => m.idCurso == cursoId));
			}

			return View(asistencias.ToList());
		}

		// GET: Asistencias/Create
		public ActionResult Create()
		{
			// Cargar solo los cursos activos (estadoC == true) para el dropdown
			ViewBag.Cursos = db.Cursos.Where(c => c.estadoC == true).ToList();
			return View();
		}

		// POST: Asistencias/Create
		[HttpPost]
		public ActionResult Create(int idCurso)
		{
			// Cargar nuevamente solo los cursos activos
			ViewBag.Cursos = db.Cursos.Where(c => c.estadoC == true).ToList();

			// Obtener los alumnos matriculados en el curso seleccionado
			var alumnos = db.Matriculas
				.Where(m => m.idCurso == idCurso)
				.Select(m => m.Alumnos)
				.Where(a => a.estadoA == true) // Filtrar solo los alumnos activos
				.ToList();

			return View("RegistrarAsistencia", alumnos); // Pasar los alumnos a la vista de registrar asistencia
		}


		// POST: Asistencias/Registrar
		[HttpPost]
		public ActionResult Registrar(List<int> asistencias, DateTime fecha)
		{
			foreach (var idAlumno in asistencias)
			{
				var asistencia = new Asistencias
				{
					idAlumno = idAlumno,
					fecha = fecha,
					estado = true // Marcamos como presente
				};
				db.Asistencias.Add(asistencia);
			}

			db.SaveChanges(); // Guardar todas las asistencias
			return RedirectToAction("Index"); // Redirigir a la lista de asistencias
		}

		// GET: Asistencias/AlumnosPorCurso
		public JsonResult AlumnosPorCurso(int idCurso)
		{
			var alumnos = db.Matriculas
				.Where(m => m.idCurso == idCurso)
				.Select(m => new
				{
					m.Alumnos.idAlumnos,
					m.Alumnos.NombresAlumno
				}).ToList();

			return Json(alumnos, JsonRequestBehavior.AllowGet);
		}
		[HttpPost]
		public ActionResult Guardar(List<Asistencias> asistencias)
		{
			foreach (var asistencia in asistencias)
			{
				asistencia.fecha = DateTime.Now; // Guardar la fecha y hora
				db.Asistencias.Add(asistencia); // Agregar a la base de datos
			}
			db.SaveChanges(); // Guardar cambios
			return RedirectToAction("Index"); // Redirigir a la lista de asistencias
		}
	}
}