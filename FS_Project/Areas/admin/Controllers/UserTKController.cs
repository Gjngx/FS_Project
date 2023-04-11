using FS_Project.Common;
using FS_Project.Context;
using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class UserTKController : BaseController
    {
        // GET: admin/UserTK
        public ActionResult Index()
        {
            var model = new UserDAO().getAll();
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(User user)
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
                        return RedirectToAction("Index", "UserTK");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng kí thất bại");
                    }
                }
            }
            return View("Create");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var user = new UserDAO().ViewDetail(id);
            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User user)
        {
            if (ModelState.IsValid)
            {
                var result = new UserDAO().Update(user);

                if (result)
                {

                    return RedirectToAction("Index", "UserTK");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật user không thành công");
                }
            }
            return View("Index");
        }

        public ActionResult Delete(int id)
        {
            new UserDAO().Delete(id);
            return RedirectToAction("Index","UserTK");
        }
    }
}