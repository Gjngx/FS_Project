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
        [RegularExpression(@"^[a-z0-9_-]{3,16}$", ErrorMessage = "Ten bat dau bang chu cai thuong(a-z), hoac so (0-9), do dai 3-16 ky tu ")]
        public string UserName { set; get; }

        [Required(ErrorMessage = "Vui long nhap mat khau")]
        [RegularExpression(@"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$", ErrorMessage = "Mat khau toi thieu 8 ky tu, it nhat mot chu va mot so")]
        public string PassWords { set; get; }
    }
}