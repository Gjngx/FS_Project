﻿using FS_Project.Context;
using FS_Project.DAO;
using FS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class TruyenController : BaseController
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
        [ValidateAntiForgeryToken]
        public ActionResult ThemTruyen(Truyen truyens)
        {
            try
            {
                if(ModelState.IsValid)
                {
                    var model = new TruyenDAO();
                    int res = model.InsertTruyen(truyens.id_TacGia, truyens.id_TheLoai, truyens.id_TrangThai, truyens.TenTruyen, truyens.TieuDe, truyens.AnhTruyen, truyens.GioiThieu);
                    if (res > 0)
                        return RedirectToAction("Index");
                    else
                    {
                        ModelState.AddModelError("", "Thêm mới thất bại!");
                    }
                }
                return View(truyens);
            }
            catch
            {
                return View();

            }
        }
        [HttpGet]
        public ActionResult CapNhatTruyen(int id)
        {
            var truyens = new TruyenDAO().ChiTietTruyen(id);
            List<TacGia> tacGias = db.TacGias.ToList();
            List<TheLoai> theLoais = db.TheLoais.ToList();
            List<TrangThai> trangThais = db.TrangThais.ToList();
            SelectList listtacgia = new SelectList(tacGias, "id_TacGia", "TenTacGia");
            SelectList listtheloai = new SelectList(theLoais, "id_TheLoai", "TenTheLoai");
            SelectList listtrangthai = new SelectList(trangThais, "id_TrangThai", "TrangThai1");
            ViewBag.dstacgia = listtacgia;
            ViewBag.dstheloai = listtheloai;
            ViewBag.dstrangthai = listtrangthai;
            return View(truyens);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatTruyen(int id , Truyen truyen)
        {
            if (ModelState.IsValid)
            {
                var kqua = new TruyenDAO().UpdateTruyen(id,truyen);
                if(kqua)
                {
                    return RedirectToAction("Index", "Truyen");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thất bại!");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        public ActionResult XoaTruyen(int id)
        {
            new TruyenDAO().DeleteTruyen(id);
            return RedirectToAction("Index", "Truyen");
        }

        public ActionResult ChuongTruyen(int id)
        {
            List<ChuongTruyen> model = new List<ChuongTruyen>();
            model = new TruyenDAO().GetChuongTruyenById(id);
            return View(model);
        }
        [HttpGet]
        public ActionResult ThemChuong()
        {
            List<Truyen> truyens = db.Truyens.ToList();
            SelectList listtruyens = new SelectList(truyens, "id_Truyen", "TenTruyen");
            ViewBag.dsTruyen = listtruyens;
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemChuong(ChuongTruyen CTruyens)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new TruyenDAO();
                    int res = model.InsertChuong(CTruyens.id_Truyen, CTruyens.TenChuong, CTruyens.tieuDe, CTruyens.SoChuong, CTruyens.NoiDungChu);
                    if (res > 0)
                        return RedirectToAction("Index");
                    else
                    {
                        ModelState.AddModelError("", "Thêm mới thất bại!");
                    }
                }
                return View(CTruyens);
            }
            catch
            {
                return View();

            }
        }
        public ActionResult CapNhatChuong(int id)
        {
            var CTruyens = new TruyenDAO().xemchuong(id);
            List<Truyen> truyens = db.Truyens.ToList();
            SelectList listtruyens = new SelectList(truyens, "id_Truyen", "TenTruyen");
            ViewBag.dsTruyen = listtruyens;
            return View(CTruyens);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatChuong(int id, ChuongTruyen CTruyen)
        {
            if (ModelState.IsValid)
            {
                var kqua = new TruyenDAO().UpdateChuongTruyen(id, CTruyen);
                if (kqua)
                {
                    return RedirectToAction("Index", "Truyen");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thất bại!");
                }
            }
            return View("Index");
        }
        [HttpDelete]
        public ActionResult XoaChuong(int id)
        {
            new TruyenDAO().DeleteChuong(id);
            return RedirectToAction("Index", "Truyen");
        }
    }
}