//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FS_Project.Context
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChuongTruyen
    {
        public int id_Chuong { get; set; }
        public string TenChuong { get; set; }
        public string tieuDe { get; set; }
        public string NoiDungChu { get; set; }
        public string NoiDungAudio { get; set; }
        public Nullable<int> id_Truyen { get; set; }
    
        public virtual Truyen Truyen { get; set; }
    }
}
