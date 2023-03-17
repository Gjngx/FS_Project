using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FS_Project.Models
{
    public class Truyen_TacGia
    {
        public List<Truyen> truyens { get; set; }
        public List<TacGia> TacGias { get; set;}
    }
}