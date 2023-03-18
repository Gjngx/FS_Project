using FS_Project.Context;
using FS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class TruyenDAO
    {
        FSData_ProjectEntities db = new FSData_ProjectEntities();


        public ChuongTruyen xemchuong(int id)
        {
            return db.ChuongTruyens.Find(id);
        }

        public List<ChuongTruyen> xuatchuongmoi(long? id, int count)
        {
            return db.ChuongTruyens.Where(x => x.id_Truyen == id).OrderByDescending(x => x.SoChuong).Take(count).ToList();
        }
        public List<ChuongTruyen> xuatchuong(long? id)
        {
            return db.ChuongTruyens.Where(x => x.id_Truyen == id).OrderBy(x => x.SoChuong).ToList();
        }
        public ViewTruyen XemChiTietTruyen(long? id)
        {
            var truyen = db.Truyens.Find(id);

            var Detail = new ViewTruyen()
            {
                ID = truyen.id_Truyen,
                tentruyen = truyen.TenTruyen,
                tieude = truyen.TieuDe,
                tentacgia = truyen.TacGia.TenTacGia,
                tentheloai = truyen.TheLoai.TenTheLoai,
                anhtruyen = truyen.AnhTruyen,
                tomtat = truyen.GioiThieu,
                trangthai = truyen.TrangThai.TrangThai1,
                luotxem = truyen.LuotXem,
            };
            return Detail;
        }
        public List<Truyen> truyenmoi(int count)
        {
            return db.Truyens.OrderByDescending(t => t.NgayDang).Take(count).ToList();
        }
        public List<Truyen> DSTruyenNoiBat(int count)
        {
            return db.Truyens.OrderByDescending(a => a.LuotXem).Take(count).ToList();
        }

    }
}