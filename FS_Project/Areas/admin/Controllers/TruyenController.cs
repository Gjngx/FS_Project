using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class TruyenController : Controller
    {
        // GET: admin/Truyen
        public ActionResult Index()
        {
            var model = new TruyenDAO().GetTruyen();
            return View();
        }
    }
}