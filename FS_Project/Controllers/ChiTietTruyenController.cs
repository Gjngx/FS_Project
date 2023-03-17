using FS_Project.DAO;
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
        public ActionResult Index(long? id)
        {
            var truyen = new TruyenDAO().XemChiTietTruyen(id);
            return View(truyen);
        }
    }
}