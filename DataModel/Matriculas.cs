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
    
    public partial class Matriculas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Matriculas()
        {
            this.Deberes = new HashSet<Deberes>();
        }
    
        public int idMatricula { get; set; }
        public Nullable<int> idAlumno { get; set; }
        public Nullable<int> idCurso { get; set; }
        public Nullable<System.DateTime> fechaRegistroMt { get; set; }
        public Nullable<bool> estadoMt { get; set; }
    
        public virtual Alumnos Alumnos { get; set; }
        public virtual Cursos Cursos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Deberes> Deberes { get; set; }
    }
}
