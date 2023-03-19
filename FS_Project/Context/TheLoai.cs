namespace FS_Project.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TheLoai")]
    public partial class TheLoai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TheLoai()
        {
            Truyens = new HashSet<Truyen>();
        }

        [Key]
        public int id_TheLoai { get; set; }

        [StringLength(150)]
        public string TenTheLoai { get; set; }

        [StringLength(150)]
        public string TieuDe { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Truyen> Truyens { get; set; }
    }
}
