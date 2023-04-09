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
        [Key, Column(Order = 1)]
        public int id_User { get; set; }

        [Required(ErrorMessage = "Vui long nhap {0}")]
        [StringLength(30, MinimumLength = 6)]
        [Display(Name = "Ho ten")]

        public string HoTen { get; set; }
        public string GioiTinh { get; set; }

        [StringLength(250)]
        [EmailAddress(ErrorMessage = "Vui long nhap dung dinh dang Email")]
        [Required(ErrorMessage = "Vui long nhap {0}")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Vui long nhap {0}")]
        [Display(Name = "Tai khoan")]
        [StringLength(30, MinimumLength = 6)]
        [RegularExpression(@"^[a-z0-9_-]{3,16}$", ErrorMessage = "Ten tai khoan bat dau bang chu cai thuong(a-z), hoac so (0-9), do dai 3-16 ky tu ")]
        public string UserName { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Vui long nhap {0}")]
        [Display(Name = "Mat khau")]
        [RegularExpression(@"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$", ErrorMessage = "Mat khau toi thieu 8 ky tu, it nhat mot chu va mot so")]
        public string PassWords { get; set; }

        [NotMapped]
        [Required(ErrorMessage = "Vui long nhap {0}")]
        [Display(Name = "Mat khau xac nhan")]
        [System.ComponentModel.DataAnnotations.Compare("PassWords")]
        public string ConfirmPassWords { get; set; }
        public bool TrangThai { get; set; }
        public short? VIP { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TheoDoi> TheoDois { get; set; }

    }
}
