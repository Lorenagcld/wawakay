using loginwawaky.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace loginwawaky.Controllers
{
    public class MateriasController : Controller
    {
		private loginEntities db = new loginEntities();

		// GET: Docentes
		public ActionResult Index()
		{
			return View(db.Materias.ToList());
		}
	}
}