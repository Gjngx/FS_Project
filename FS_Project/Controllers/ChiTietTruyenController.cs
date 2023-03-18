﻿using FS_Project.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Controllers
{
    public class ChiTietTruyenController : Controller
    {
        // GET: ChiTietTruyen
        public ActionResult Index(long? id_Truyen)
        {
            var truyen = new TruyenDAO().XemChiTietTruyen(id_Truyen);
            ViewBag.chuongtruyen = new TruyenDAO().xuatchuong(id_Truyen);
            ViewBag.chuongtruyenmoi = new TruyenDAO().xuatchuongmoi(id_Truyen, 3);
            return View(truyen);
        }

        public ActionResult DocTruyen (int id_chuong)
        {
            var model = new TruyenDAO().xemchuong(id_chuong);
            ViewBag.Truyen = new TruyenDAO().XemChiTietTruyen(model.id_Truyen);
            ViewBag.Chuongtruyen = new TruyenDAO().xuatchuong(model.id_Truyen);
            return View(model);
        }
    }
}