using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Controllers
{
    public class TimKiemController : Controller
    {
        // GET: TimKiem
        public ActionResult Index()
        {
            ViewBag.truyenmoi = new TruyenDAO().truyentheosoluong(10);
            return View();
        }

        public ActionResult timtacgia() 
        {
            ViewBag.truyenmoi = new TruyenDAO().truyentheosoluong(10);
            return View();
        }

        public ActionResult timtheloai()
        {
            ViewBag.truyenmoi = new TruyenDAO().truyentheosoluong(10);
            return View();
        }
    }
}