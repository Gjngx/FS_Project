namespace FS_Project.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Truyen")]
    public partial class Truyen
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Truyen()
        {
            ChuongTruyens = new HashSet<ChuongTruyen>();
            TheoDois = new HashSet<TheoDoi>();
        }

        [Key]
        public int id_Truyen { get; set; }

        public int? id_TacGia { get; set; }

        public int? id_TheLoai { get; set; }

        public int? id_TrangThai { get; set; }

        [StringLength(255)]
        public string TenTruyen { get; set; }

        [StringLength(150)]
        public string TieuDe { get; set; }

        [StringLength(255)]
        public string AnhTruyen { get; set; }

        [Column(TypeName = "ntext")]
        public string GioiThieu { get; set; }

        public int? LuotXem { get; set; }

        public DateTime? NgayDang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChuongTruyen> ChuongTruyens { get; set; }

        public virtual TacGia TacGia { get; set; }

        public virtual TheLoai TheLoai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TheoDoi> TheoDois { get; set; }

        public virtual TrangThai TrangThai { get; set; }
    }
}
