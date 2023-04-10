using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class UserTKController : Controller
    {
        // GET: admin/UserTK
        public ActionResult Index()
        {
            var model = new UserDAO().getAll();
            return View(model);
        }
    }
}