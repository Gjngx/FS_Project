using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Controllers
{
    public class TheLoaiController : Controller
    {
        // GET: TheLoai
        public ActionResult Index(int id)
        {
            var model = new TruyenDAO().DSTruyenTheoTheLoai(id);
            ViewBag.TheLoai = new TheLoaiDAO().ChiTietTheLoai(id);
            return View(model);
        }
    }
}