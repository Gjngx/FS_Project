using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class TacGiaController : Controller
    {
        // GET: admin/TacGia
        public ActionResult Index()
        {
            var model = new TacGiaDAO().GetTacGia();
            return View(model);
        }
    }
}