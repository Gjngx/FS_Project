using FS_Project.Common;
using FS_Project.DAO;
using FS_Project.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: admin/Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var check = new AdminDAO();
                var result = check.Login(model.UserName, model.PassWords);
                if (result == 1)
                {
                    var admin = check.GetById(model.UserName);
                    var adminSession = new AdminLogin();
                    adminSession.UserName = admin.UserName;
                    adminSession.AdminID = admin.id_Admin;
                    Session.Add(Constants.ADMIN_SESSION, adminSession);
                    return RedirectToAction("Index", "admin");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
            }
            return View("Index");

        }
    }
}