using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace loginwawaky.DataModel
{
	public class DetalleAlumnoViewModel
	{
		public Matriculas Alumno { get; set; }
		public IEnumerable<dynamic> Deberes { get; set; }
	}

}