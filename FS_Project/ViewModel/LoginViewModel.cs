using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FS_Project.ViewModel
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Vui long nhap tai khoan")]
        public string UserName { set; get; }

        [Required(ErrorMessage = "Vui long nhap mat khau")]
        public string PassWords { set; get; }
    }
}