using FS_Project.Context;
using FS_Project.DAO;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class TheLoaiController : BaseController
    {
        DbModel db = new DbModel();
        // GET: admin/TheLoai
        public ActionResult Index()
        {
            var model = new TheLoaiDAO().GetTheLoai();
            return View(model);
        }
        
        public ActionResult ThemTheLoai(TheLoai theloais)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new TheLoaiDAO();
                    int res = model.InsertTheLoai(theloais.TenTheLoai, theloais.TieuDe);
                    if (res > 0)
                        return RedirectToAction("Index");
                    else
                    {
                        ModelState.AddModelError("", "Thêm mới thất bại!");
                    }
                }
                return View(theloais);
            }
            catch
            {
                return View();

            }

        }

        [HttpGet]
        public ActionResult CapNhatTheLoai(int id)
        {
            var theloais = new TheLoaiDAO().ChiTietTheLoai(id);               
            return View(theloais);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatTheLoai(int id, TheLoai theloais)
        {
            if (ModelState.IsValid)
            {
                var kqua = new TheLoaiDAO().UpdateTheLoai(id,theloais);
                if (kqua)
                {
                    return RedirectToAction("Index", "TheLoai");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thất bại!");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        public ActionResult XoaTheLoai(int id)
        {
            new TheLoaiDAO().DeleteTheLoai(id);
            return RedirectToAction("Index", "TheLoai");
        }
    }
}