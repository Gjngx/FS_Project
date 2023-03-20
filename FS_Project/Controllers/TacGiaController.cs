using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Controllers
{
    public class TacGiaController : Controller
    {
        // GET: TacGia
        public ActionResult Index(int id)
        {
            var model = new TruyenDAO().DSTruyenTheoTacGia(id);
            ViewBag.TacGia = new TacGiaDAO().ChiTietTacGia(id);
            return View(model);
        }
    }
}