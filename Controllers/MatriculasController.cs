using loginwawaky.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Rotativa;

namespace loginwawaky.Controllers
{
    public class MatriculasController : Controller
    {
		private loginEntities db = new loginEntities();

		// GET: Matricula
		public ActionResult Index()
		{
			var matriculas = db.Matriculas.Include("Alumnos").Include("Cursos").ToList();
			return View(matriculas);
		}

		// GET: Matricula/Create
		public ActionResult Create()
		{
			ViewBag.idAlumno = new SelectList(db.Alumnos.Where(a => a.estadoA == true), "idAlumnos", "NombresAlumno");
			ViewBag.idCurso = new SelectList(db.Cursos.Where(c => c.estadoC == true), "idCurso", "Paralelo");
			ViewBag.Materias = db.Materias.Where(m => m.estadoM == true).ToList();
			return View();
		}

		// POST: Matricula/Create
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create(Matriculas matricula)
		{
			if (ModelState.IsValid)
			{
				matricula.fechaRegistroMt = DateTime.Now;
				db.Matriculas.Add(matricula);
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			ViewBag.idAlumno = new SelectList(db.Alumnos.Where(a => a.estadoA == true), "idAlumnos", "NombresAlumno", matricula.idAlumno);
			ViewBag.idCurso = new SelectList(db.Cursos.Where(c => c.estadoC == true), "idCurso", "Paralelo", matricula.idCurso);
			ViewBag.Materias = db.Materias.Where(m => m.estadoM == true).ToList();
			return View(matricula);
		}

		// GET: Matricula/Edit/5
		public ActionResult Edit(int id)
		{
			var matricula = db.Matriculas.Find(id);
			if (matricula == null)
			{
				return HttpNotFound();
			}

			ViewBag.idAlumno = new SelectList(db.Alumnos.Where(a => a.estadoA == true), "idAlumnos", "NombresAlumno", matricula.idAlumno);
			ViewBag.idCurso = new SelectList(db.Cursos.Where(c => c.estadoC == true), "idCurso", "Paralelo", matricula.idCurso);
			ViewBag.Materias = db.Materias.Where(m => m.estadoM == true).ToList();
			return View(matricula);
		}

		// POST: Matricula/Edit/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(Matriculas matricula)
		{
			if (ModelState.IsValid)
			{
				db.Entry(matricula).State = System.Data.Entity.EntityState.Modified;
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			ViewBag.idAlumno = new SelectList(db.Alumnos.Where(a => a.estadoA == true), "idAlumnos", "NombresAlumno", matricula.idAlumno);
			ViewBag.idCurso = new SelectList(db.Cursos.Where(c => c.estadoC == true), "idCurso", "Paralelo", matricula.idCurso);
			ViewBag.Materias = db.Materias.Where(m => m.estadoM == true).ToList();
			return View(matricula);
		}

		// GET: Matricula/Delete/5
		public ActionResult Delete(int id)
		{
			var matricula = db.Matriculas.Find(id);
			if (matricula == null)
			{
				return HttpNotFound();
			}
			return View(matricula);
		}

		// POST: Matricula/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(int id)
		{
			var matricula = db.Matriculas.Find(id);
			db.Matriculas.Remove(matricula);
			db.SaveChanges();
			return RedirectToAction("Index");
		}

		// GET: Matricula/Detail/5
		public ActionResult Detail(int id)
		{
			var matricula = db.Matriculas
		.Include("Alumnos")
		.Include("Cursos")
		.FirstOrDefault(m => m.idMatricula == id);

			if (matricula == null)
			{
				return HttpNotFound();
			}

			ViewBag.Materias = db.Materias.ToList(); // Carga todas las materias
			return View(matricula);
		}

		// GET: Matricula/GenerarPDF/5
		public ActionResult GenerarPDF(int id)
		{
			var matricula = db.Matriculas.Include("Alumnos").Include("Cursos").FirstOrDefault(m => m.idMatricula == id);
			if (matricula == null)
			{
				return HttpNotFound();
			}

			var materias = db.Materias.ToList();

			return new ActionAsPdf("GenerarPDF", new { id = matricula.idMatricula })
			{
				FileName = $"Matrícula_{matricula.Alumnos.NombresAlumno}.pdf"
			};
		}
		

	}
}
