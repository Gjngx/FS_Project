using FS_Project.Context;
using FS_Project.DAO;
using FS_Project.Models;
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
        DbModel db = new DbModel();

        public ActionResult Index()
        {
            var model = new TruyenDAO().GetTruyen();
            return View(model);
        }

        [HttpGet]
        public ActionResult ThemTruyen()
        {
            List<TacGia> tacGias = db.TacGias.ToList();
            List<TheLoai> theLoais  = db.TheLoais.ToList();
            List<TrangThai> trangThais = db.TrangThais.ToList();
            SelectList listtacgia = new SelectList(tacGias, "id_TacGia", "TenTacGia");
            SelectList listtheloai = new SelectList(theLoais, "id_TheLoai", "TenTheLoai");
            SelectList listtrangthai = new SelectList(trangThais, "id_TrangThai", "TrangThai1");
            ViewBag.dstacgia = listtacgia;
            ViewBag.dstheloai = listtheloai;
            ViewBag.dstrangthai = listtrangthai;
            return View();
        }
        [HttpPost]
        public ActionResult ThemTruyen(Truyen model)
        {
            return View("ThemTruyen");
        }

        public ActionResult ChuongTruyen(int id)
        {
            List<ChuongTruyen> model = new List<ChuongTruyen>();
            model = new TruyenDAO().GetChuongTruyenById(id);
            return View(model);
        }
    }
}