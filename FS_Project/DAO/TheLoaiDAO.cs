using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class TheLoaiDAO
    {
        DbModel db = new DbModel();

        public int? GetIdByName(string name)
        {
            return db.TheLoais.SingleOrDefault(x => x.TenTheLoai == name).id_TheLoai;
        }

        public bool Ktratheloai(string name)
        {
            return db.TheLoais.Count(x => x.TenTheLoai == name) > 0;
        }

        public TheLoai ChiTietTheLoai(int id)
        {
            return db.TheLoais.Find(id);
        }

        public List<TheLoai> DSTheLoai()
        {
            return db.TheLoais.OrderBy(x => x.id_TheLoai).ToList();
        }
        public List<TheLoai> GetTheLoai()
        {
            var list = db.Database.SqlQuery<TheLoai>("GetTheLoai").ToList();
            return list;
        }

        public int InsertTheLoai(string tentheloai,string tieude)
        {
            object[] data =
            {
                new SqlParameter("@TenTheLoai",tentheloai),
                new SqlParameter("@TieuDe",tieude)
            };
            int res = db.Database.ExecuteSqlCommand("InsertTheLoai @TenTheLoai,@TieuDe", data);
            return res;
        }

        public bool UpdateTheLoai(int id, TheLoai tl)
        {
            try
            {
                var theloais = db.TheLoais.Find(id);
                theloais.TenTheLoai = tl.TenTheLoai;
                theloais.TieuDe=tl.TieuDe;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteTheLoai(int id)
        {
            try
            {
                var tldel = db.TheLoais.Find(id);
                db.TheLoais.Remove(tldel);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
    
}