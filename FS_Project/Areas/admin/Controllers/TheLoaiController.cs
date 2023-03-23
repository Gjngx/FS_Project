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
    public class TheLoaiController : Controller
    {
        DbModel db = new DbModel();
        // GET: admin/TheLoai
        public ActionResult Index()
        {
            var model = new TheLoaiDAO().GetTheLoai();
            return View(model);
        }
    }
}