using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace loginwawaky.DataModel
{
	public class AlumnoNotasViewModel
	{
		public int idMatricula { get; set; }
		public string AlumnoNombre { get; set; }
		public List<MateriaNotaViewModel> MateriasNotas { get; set; }

		public AlumnoNotasViewModel()
		{
			MateriasNotas = new List<MateriaNotaViewModel>();
		}
	}

	public class MateriaNotaViewModel
	{
		public int idMateria { get; set; }
		public string NombreMateria { get; set; }
		public decimal? Parcial1 { get; set; }
		public decimal? Parcial2 { get; set; }
		public decimal? Parcial3 { get; set; }
	}

}