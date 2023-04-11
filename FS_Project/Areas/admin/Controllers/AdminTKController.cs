using FS_Project.Context;
using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class AdminTKController : BaseController
    {
        // GET: admin/AdminTK
        public ActionResult Index()
        {
            var model = new AdminDAO().GetTKADMIN();
            return View(model);
        }

        [HttpGet]
        public ActionResult ThemTKAdmin()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemTKAdmin(Admin ad)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new AdminDAO();
                    int res = model.InsertAdmin(ad.UserName, ad.PassWords, ad.TrangThai);
                    if (res > 0)
                        return RedirectToAction("Index");
                    else
                    {
                        ModelState.AddModelError("", "Thêm mới thất bại!");
                    }
                }
                return View(ad);
            }
            catch
            {
                return View();

            }
        }

        [HttpDelete]
        public ActionResult XoaTKAdmin(int id)
        {
            new AdminDAO().DeleteTKAdmin(id);
            return RedirectToAction("Index", "AdminTK");
        }
    }
}