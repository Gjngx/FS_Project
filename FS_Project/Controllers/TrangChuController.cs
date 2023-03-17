using FS_Project.Context;
using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu

        public ActionResult Index()
        {
            var dao = new TruyenDAO();
            ViewBag.truyenmoi = dao.truyenmoi(20);
            ViewBag.truyennoibat = dao.DSTruyenNoiBat(5);
            return View();
        }
        
    }
}