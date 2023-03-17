using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FS_Project.Models
{
    public class ViewTruyen
    {
        public long ID { set; get; }
        public string tentruyen { set; get; }
        public string tieude { set; get; }
        public string anhtruyen { set; get; }
        public string tomtat { set; get; }
        public string tentacgia { set; get; }
        public string tentheloai { set; get; }
        public string trangthai { set; get; }
        public long? luotxem { set; get; }
    }
}