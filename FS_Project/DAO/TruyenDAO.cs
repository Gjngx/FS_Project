using FS_Project.Context;
using FS_Project.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FS_Project.DAO
{
    public class TruyenDAO
    {
        DbModel db = new DbModel();


        public bool UpdateTruyen( int id,Truyen t)
        {
            try
            {
                var truyen = db.Truyens.Find(id);
                truyen.id_TacGia = t.id_TacGia;
                truyen.id_TheLoai = t.id_TheLoai;
                truyen.id_TrangThai = t.id_TrangThai;
                truyen.TenTruyen = t.TenTruyen;
                truyen.TieuDe = t.TieuDe ;
                truyen.AnhTruyen = t.AnhTruyen;
                truyen.GioiThieu = t.GioiThieu;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Truyen ChiTietTruyen(int id)
        {
            return db.Truyens.Find(id);
        }

        public int InsertTruyen(int? idtacgia, int? idtheloai, int? idtrangthai, string tentruyen, string tieude, string anhtruyen, string gioithieu)
        {
            object[] data =
            {
                new SqlParameter("@IdTacGia", idtacgia),
                new SqlParameter("@IdTheLoai", idtheloai),
                new SqlParameter("@IdTrangThai", idtrangthai),
                new SqlParameter("@tentruyen", tentruyen),
                new SqlParameter("@tieude", tieude),
                new SqlParameter("@anhtruyen", anhtruyen),
                new SqlParameter("@gioithieu", gioithieu)
            };
            int res = db.Database.ExecuteSqlCommand("InsertTruyen @IdTacGia, @IdTheLoai, @IdTrangThai, @tentruyen, @tieude, @anhtruyen, @gioithieu", data);
            return res;
        }

        public List<ChuongTruyen> GetChuongTruyenById(long? id_story)
        {
            return db.ChuongTruyens.Where(x => x.id_Truyen == id_story).OrderBy(x => x.SoChuong).ToList();
        }

        public List<ViewTruyen> GetTruyen()
        {
            var model = from a in db.Truyens
                        join b in db.TacGias
                        on a.id_TacGia equals b.id_TacGia
                        join c in db.TheLoais
                        on a.id_TheLoai equals c.id_TheLoai
                        join d in db.TrangThais
                        on a.id_TrangThai equals d.id_TrangThai
                        where a.id_Truyen >= 0
                        select new ViewTruyen()
                        {
                            ID = a.id_Truyen,
                            tentruyen = a.TenTruyen,
                            tentacgia = b.TenTacGia,
                            tentheloai = c.TenTheLoai,
                            tomtat = a.GioiThieu,
                            trangthai = d.TrangThai1,
                            anhtruyen = a.AnhTruyen,
                            tieude = a.TieuDe
                        };
            return model.ToList();
        }

        public List<Truyen> DSTruyenTheoTacGia(int id)
        {
            return db.Truyens.Where(x => x.id_TacGia == id).ToList();
        }

        public List<Truyen> DSTruyenTheoTheLoai(int id)
        {
            return db.Truyens.Where(x => x.id_TheLoai == id).ToList();
        }

        public int? xuatchuongcuoi(long? id)
        {
            return db.ChuongTruyens.Where(x => x.id_Truyen == id).Max(x => x.SoChuong);
        }

        public int nhaychuong(int? idTruyen, int? soChuong)
        {
            var idChuong = from chuong in db.ChuongTruyens
                           where chuong.id_Truyen == idTruyen
                           where chuong.SoChuong == soChuong
                           select chuong.id_Chuong;
            int id = idChuong.First();
            return id;
        }

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
                idTheLoai = truyen.id_TheLoai,
                idTacGia = truyen.id_TacGia,
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
        public List<Truyen> truyenmoi()
        {
            return db.Truyens.OrderByDescending(t => t.NgayDang).ToList();
        }
        public List<Truyen> truyentheosoluong(int count)
        {
            return db.Truyens.OrderByDescending(t => t.NgayDang).Take(count).ToList();
        }
        public List<Truyen> DSTruyenNoiBat(int count)
        {
            return db.Truyens.OrderByDescending(a => a.LuotXem).Take(count).ToList();
        }

    }
}