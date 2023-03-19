namespace FS_Project.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TheoDoi")]
    public partial class TheoDoi
    {
        [Key]
        public int id_TheoDoi { get; set; }

        public int? id_Truyen { get; set; }

        public int? id_User { get; set; }

        public virtual Truyen Truyen { get; set; }

        public virtual User User { get; set; }
    }
}
