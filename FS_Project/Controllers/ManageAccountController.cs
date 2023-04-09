using FS_Project.Common;
using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Controllers
{
    public class ManageAccountController : Controller
    {
        // GET: ManageAccount
        public ActionResult Index(int id)
        {
            var model = new UserDAO().ViewDetail(id);
            return View(model);
        }

        //HttpGet
        public ActionResult Change_Password(int id)
        {
            var model = new UserDAO().ViewDetail(id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Change_Password(string UserName, string PassOld, string PassNew)
        {
            if (ModelState.IsValid)
            {
                var encryptedoldpass = Encrypt_MD5.GetMD5(PassOld);
                var encryptednewPas = Encrypt_MD5.GetMD5(PassNew);
                PassOld = encryptedoldpass;
                PassNew = encryptednewPas;
                var check = new UserDAO();
                var result = check.Update(UserName, PassOld, PassNew);
                if (result == true)
                {
                    ModelState.AddModelError("", "Đổi mật khẩu thành công.");
                    return View("Change_Password");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật user không thành công");
                }
            }
            return View("Change_Password");
        }
    }
}