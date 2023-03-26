using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FS_Project.Areas.admin.Controllers
{
    public class FileUploadController : Controller
    {
        // GET: admin/FileUpload
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UploadFiles(HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                try
                {


                    if (file != null)
                    {
                        string path = Path.Combine(Server.MapPath("~/images/imgTruyen"), Path.GetFileName(file.FileName));
                        file.SaveAs(path);

                    }
                    ViewBag.FileStatus = "Upload ảnh truyện thành công.";
                }
                catch (Exception)
                {

                    ViewBag.FileStatus = "Upload ảnh truyên thất bại";
                }

            }
            return View("Index");
        }
    }
}