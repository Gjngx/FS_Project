using FS_Project.Common;
using FS_Project.Context;
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

                    return RedirectToAction("Index", "ManageAccount");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật user không thành công");
                }
            }
            return View("Index");
        }
    }
}