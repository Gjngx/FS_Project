using FS_Project.Context;
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
        DbModel db = new DbModel();

        public ActionResult Index(string timkiemstring)
        {
            var truyen = from t in db.Truyens select t;
            if (!String.IsNullOrEmpty(timkiemstring))
            {
                truyen = truyen.Where(s => s.TenTruyen.Contains(timkiemstring));
            }
            return View(truyen);
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