using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using loginwawaky.DataModel;

namespace loginwawaky.Controllers
{
    public class AlumnosController : Controller
    {
        private loginEntities db = new loginEntities();

        // GET: Alumnos
        public ActionResult Index()
        {
            var alumnos = db.Alumnos.Include(a => a.Representante);
            return View(alumnos.ToList());
        }

        // GET: Alumnos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnos alumnos = db.Alumnos.Find(id);
            if (alumnos == null)
            {
                return HttpNotFound();
            }
            return View(alumnos);
        }

        // GET: Alumnos/Create
        public ActionResult Create()
        {
            ViewBag.idRepresentante = new SelectList(db.Representante, "idRepresentante", "Nombres");
            return View();
        }

        // POST: Alumnos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
		public ActionResult Create(Alumnos alumno)
		{
			if (ModelState.IsValid)
			{
				alumno.fechaRegistroA = DateTime.Now; // Establece la fecha de registro
				db.Alumnos.Add(alumno);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			ViewBag.idRepresentante = new SelectList(db.Representante, "idRepresentante", "Nombres", alumno.idRepresentante);
			return View(alumno);
		}

		// GET: Alumnos/Edit/5
		public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnos alumnos = db.Alumnos.Find(id);
            if (alumnos == null)
            {
                return HttpNotFound();
            }
            ViewBag.idRepresentante = new SelectList(db.Representante, "idRepresentante", "Nombres", alumnos.idRepresentante);
            return View(alumnos);
        }

        // POST: Alumnos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
		public ActionResult Edit(Alumnos alumno)
		{
			if (ModelState.IsValid)
			{
				db.Entry(alumno).State = EntityState.Modified;
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			ViewBag.idRepresentante = new SelectList(db.Representante, "idRepresentante", "Nombres", alumno.idRepresentante);
			return View(alumno);
		}

		// GET: Alumnos/Delete/5
		public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnos alumnos = db.Alumnos.Find(id);
            if (alumnos == null)
            {
                return HttpNotFound();
            }
            return View(alumnos);
        }

        // POST: Alumnos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Alumnos alumnos = db.Alumnos.Find(id);
            db.Alumnos.Remove(alumnos);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
		


	}
}
