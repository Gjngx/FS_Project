namespace FS_Project.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            TheoDois = new HashSet<TheoDoi>();
        }

        [Key]
        public int id_User { get; set; }

        [StringLength(150)]
        public string HoTen { get; set; }

        [StringLength(50)]
        public string GioiTinh { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgaySinh { get; set; }

        [StringLength(13)]
        public string SDT { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(50)]
        public string PassWords { get; set; }

        public bool? TrangThai { get; set; }

        public short? VIP { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TheoDoi> TheoDois { get; set; }
    }
}
