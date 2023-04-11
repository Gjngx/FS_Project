using FS_Project.Context;
using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class TacGiaController : BaseController
    {
        // GET: admin/TacGia
        public ActionResult Index()
        {
            var model = new TacGiaDAO().GetTacGia();
            return View(model);
        }

        public ActionResult ThemTacGia(TacGia tacgias)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new TacGiaDAO();
                    int res = model.InsertTacGia(tacgias.TenTacGia, tacgias.TieuDe);
                    if (res > 0)
                        return RedirectToAction("Index");
                    else
                    {
                        ModelState.AddModelError("", "Thêm mới thất bại!");
                    }
                }
                return View(tacgias);
            }
            catch
            {
                return View();

            }
        }

        [HttpGet]
        public ActionResult CapNhatTacGia(int id)
        {
            var tacgias = new TacGiaDAO().ChiTietTacGia(id);
            return View(tacgias);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatTacGia(int id, TacGia tacgias)
        {
            if (ModelState.IsValid)
            {
                var kqua = new TacGiaDAO().UpdateTacGia(id, tacgias);
                if (kqua)
                {
                    return RedirectToAction("Index", "TacGia");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thất bại!");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        public ActionResult XoaTacGia(int id)
        {
            new TacGiaDAO().DeleteTacGia(id);
            return RedirectToAction("Index", "TacGia");
        }
    }

}