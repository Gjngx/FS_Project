using FS_Project.Context;
using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace FS_Project.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu

        public ActionResult Index(int ? page)
        {
            var dao = new TruyenDAO();
            int pagesize = 20;
            int pagenum = (page ?? 1);
            var truyenmoi = dao.truyenmoi();
            ViewBag.truyennoibat = dao.DSTruyenNoiBat(5);
            ViewBag.DSTheLoai = new TheLoaiDAO().DSTheLoai();
            return View(truyenmoi.ToPagedList(pagenum, pagesize));
        }
        
    }
}