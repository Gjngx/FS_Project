namespace FS_Project.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChuongTruyen")]
    public partial class ChuongTruyen
    {
        [Key]
        public int id_Chuong { get; set; }

        [StringLength(255)]
        public string TenChuong { get; set; }

        [StringLength(150)]
        public string tieuDe { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDungChu { get; set; }

        [StringLength(250)]
        public string NoiDungAudio { get; set; }

        public int? SoChuong { get; set; }

        public int? id_Truyen { get; set; }

        public virtual Truyen Truyen { get; set; }
    }
}
