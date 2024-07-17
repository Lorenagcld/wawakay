using loginwawaky.DataModel;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace loginwawaky.Controllers
{
    public class DeberesController : Controller
    {
		private loginEntities db = new loginEntities();

		// GET: Deberes
		public ActionResult Index()
		{
			var deberes = db.Deberes.Include(d => d.Matriculas).ToList();
			return View(deberes);
		}

		// GET: Deberes/Create

		public ActionResult Create()
		{
			ViewBag.Matriculas = new SelectList(db.Matriculas.Include(m => m.Alumnos).ToList(), "idMatricula", "Alumnos.NombresAlumno");
			var model = new AlumnoNotasViewModel
			{
				MateriasNotas = db.Materias.Select(m => new MateriaNotaViewModel
				{
					idMateria = m.idMateria,
					NombreMateria = m.NombreMateria
				}).ToList()
			};
			return View(model);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create(AlumnoNotasViewModel model)
		{
			if (ModelState.IsValid)
			{
				foreach (var materiaNota in model.MateriasNotas)
				{
					if (materiaNota.Parcial1.HasValue)
					{
						db.Deberes.Add(new Deberes
						{
							idMatricula = model.idMatricula,
							idMateria = materiaNota.idMateria,
							Parcial = 1,
							Calificacion = materiaNota.Parcial1.Value
						});
					}

					if (materiaNota.Parcial2.HasValue)
					{
						db.Deberes.Add(new Deberes
						{
							idMatricula = model.idMatricula,
							idMateria = materiaNota.idMateria,
							Parcial = 2,
							Calificacion = materiaNota.Parcial2.Value
						});
					}

					if (materiaNota.Parcial3.HasValue)
					{
						db.Deberes.Add(new Deberes
						{
							idMatricula = model.idMatricula,
							idMateria = materiaNota.idMateria,
							Parcial = 3,
							Calificacion = materiaNota.Parcial3.Value
						});
					}
				}

				db.SaveChanges();
				return RedirectToAction("Detalle", new { idMatricula = model.idMatricula });
			}

			ViewBag.Matriculas = new SelectList(db.Matriculas.Include(m => m.Alumnos).ToList(), "idMatricula", "Alumnos.NombresAlumno", model.idMatricula);
			ViewBag.Materias = db.Materias.ToList();
			return View(model);
		}


		// GET: Notas/Detalle/5
		public ActionResult Detalle(int idMatricula)
		{
			// Obtener información del alumno
			var alumno = db.Matriculas
				.Include(m => m.Alumnos)
				.Include(m => m.Cursos)
				.FirstOrDefault(m => m.idMatricula == idMatricula);

			if (alumno == null)
			{
				return HttpNotFound();
			}

			// Obtener los deberes del alumno y hacer la agrupación en memoria
			var deberes = db.Deberes
				.Include(d => d.Materias) // Asegúrate de incluir Materias
				.Where(d => d.idMatricula == idMatricula)
				.ToList() // Traer los datos a memoria
				.GroupBy(d => new { d.idMateria, d.Materias.NombreMateria })
				.Select(g => new
				{
					g.Key.idMateria,
					g.Key.NombreMateria,
					Parcial1 = g.Where(d => d.Parcial == 1).Average(d => (decimal?)d.Calificacion) ?? 0,
					Parcial2 = g.Where(d => d.Parcial == 2).Average(d => (decimal?)d.Calificacion) ?? 0,
					Parcial3 = g.Where(d => d.Parcial == 3).Average(d => (decimal?)d.Calificacion) ?? 0,
					PromedioFinal = g.Average(d => (decimal?)d.Calificacion) ?? 0
				})
				.ToList();

			// Pasar los datos a la vista
			ViewBag.Alumno = alumno;
			ViewBag.Deberes = deberes;

			return View();
		}


		// GET: Deberes/Edit/5
		public ActionResult Edit(int id)
		{
			var deber = db.Deberes.Find(id);
			if (deber == null)
			{
				return HttpNotFound();
			}
			ViewBag.Matriculas = new SelectList(db.Matriculas, "idMatricula", "idMatricula", deber.idMatricula);
			return View(deber);
		}

		// POST: Deberes/Edit/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(Deberes deber)
		{
			if (ModelState.IsValid)
			{
				db.Entry(deber).State = EntityState.Modified;
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			ViewBag.Matriculas = new SelectList(db.Matriculas, "idMatricula", "idMatricula", deber.idMatricula);
			return View(deber);
		}

		// GET: Deberes/Delete/5
		public ActionResult Delete(int id)
		{
			var deber = db.Deberes.Find(id);
			if (deber == null)
			{
				return HttpNotFound();
			}
			return View(deber);
		}

		// POST: Deberes/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(int id)
		{
			var deber = db.Deberes.Find(id);
			db.Deberes.Remove(deber);
			db.SaveChanges();
			return RedirectToAction("Index");
		}

		// GET: Deberes/Detail
		


		// Generar PDF
		public ActionResult GenerarPDF(int idMatricula)
		{
			var alumno = db.Matriculas.Include("Alumnos").Include("Cursos").FirstOrDefault(m => m.idMatricula == idMatricula);
			var deberes = db.Deberes.Where(d => d.idMatricula == idMatricula).ToList();

			// Generar PDF con Rotativa
			return new ActionAsPdf("Detail", new { idMatricula = idMatricula })
			{
				FileName = $"Notas_{alumno.Alumnos.NombresAlumno}.pdf"
			};
		}
	}
}