using FS_Project.Context;
using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace FS_Project.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu

        public ActionResult Index(int ? page)
        {
            var dao = new TruyenDAO();
            if(page == null) page = 1;
            ViewBag.truyenmoi = dao.truyenmoi();
            ViewBag.truyennoibat = dao.DSTruyenNoiBat(5);
            ViewBag.DSTheLoai = new TheLoaiDAO().DSTheLoai();
            return View();
        }
        
    }
}