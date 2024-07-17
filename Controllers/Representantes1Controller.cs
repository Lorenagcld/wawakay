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
    public class Representantes1Controller : Controller
    {
        private loginEntities db = new loginEntities();

        // GET: Representantes1
        public ActionResult Index()
        {
            return View(db.Representante.ToList());
        }

        // GET: Representantes1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Representante representante = db.Representante.Find(id);
            if (representante == null)
            {
                return HttpNotFound();
            }
            return View(representante);
        }

        // GET: Representantes1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Representantes1/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
		public ActionResult Create(Representante representante)
		{
			if (ModelState.IsValid)
			{
				representante.fechaRegistroR = DateTime.Now; // Establece la fecha de registro
				db.Representante.Add(representante);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			return View(representante);
		}

		// GET: Representantes1/Edit/5
		public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Representante representante = db.Representante.Find(id);
            if (representante == null)
            {
                return HttpNotFound();
            }
            return View(representante);
        }

        // POST: Representantes1/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
		public ActionResult Edit(Representante representante)
		{
			if (ModelState.IsValid)
			{
				db.Entry(representante).State = EntityState.Modified;
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			return View(representante);
		}

		// GET: Representantes1/Delete/5
		public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Representante representante = db.Representante.Find(id);
            if (representante == null)
            {
                return HttpNotFound();
            }
            return View(representante);
        }

        // POST: Representantes1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Representante representante = db.Representante.Find(id);
            db.Representante.Remove(representante);
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
