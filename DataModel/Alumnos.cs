//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace loginwawaky.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Alumnos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Alumnos()
        {
            this.Asistencias = new HashSet<Asistencias>();
            this.Matriculas = new HashSet<Matriculas>();
        }
    
        public int idAlumnos { get; set; }
        public string CédulaAlumno { get; set; }
        public string NombresAlumno { get; set; }
        public Nullable<System.DateTime> FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public Nullable<System.DateTime> fechaRegistroA { get; set; }
        public Nullable<bool> estadoA { get; set; }
        public Nullable<int> idRepresentante { get; set; }
    
        public virtual Representante Representante { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Asistencias> Asistencias { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Matriculas> Matriculas { get; set; }
    }
}
