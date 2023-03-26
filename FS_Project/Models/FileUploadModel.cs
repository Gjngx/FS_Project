using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace FS_Project.Models
{
    public class FileUploadModel
    {
            [DataType(DataType.Upload)]
            [Display(Name = "Upload File")]
            [Required(ErrorMessage = "Vui lòng chọn ảnh! ")]
            public string file { get; set; }

    }
}