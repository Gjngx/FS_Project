using FS_Project.Common;
using FS_Project.Context;
using FS_Project.DAO;
using FS_Project.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
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
                var check = new UserDAO();
                var result = check.Login(model.UserName, Encrypt_MD5.GetMD5(model.PassWords));
                if (result == 1)
                {
                    var user = check.GetById(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.ID = user.id_User;
                    Session.Add(Constants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "TrangChu");
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
        public ActionResult Logout()
        {
            Session[Constants.USER_SESSION] = null;
            return Redirect("/");
        }

        //GET: Register
        public ActionResult Register()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        public ActionResult Register(User user)
        {
            if (ModelState.IsValid)
            {
                var check = new UserDAO();

                var encryptedMd5Pas = Encrypt_MD5.GetMD5(user.PassWords);
                user.PassWords = encryptedMd5Pas;
                if (check.CheckUserName(user.UserName))
                {
                    ModelState.AddModelError("", "Tài khoản đã tồn tại");
                }
                else if (check.CheckEmail(user.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else if (user.UserName == null)
                {
                    ModelState.AddModelError("", "Vui lòng nhập tài khoản.");
                }
                else if (user.PassWords == null)
                {
                    ModelState.AddModelError("", "Vui lòng nhập mật khẩu.");
                }
                else if (user.TrangThai == false)
                {
                    ModelState.AddModelError("", "Bạn chưa đồng ý với các điều khoản");
                }
                else
                {
                    var usernew = new User();
                    usernew.HoTen = user.HoTen;
                    usernew.GioiTinh = user.GioiTinh;
                    usernew.Email = user.Email;
                    usernew.UserName = user.UserName;
                    usernew.PassWords = user.PassWords;
                    usernew.TrangThai = true;
                    long id = check.Insert(usernew);
                    if (id > 0)
                    {
                        return RedirectToAction("Index", "Account");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng kí thất bại");
                    }
                }
            }
            return View("Register");
        }

    }
}