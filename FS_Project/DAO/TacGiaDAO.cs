using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class TacGiaDAO
    {
        DbModel db = new DbModel();


        public int? GetIdByName(string name)
        {
            return db.TacGias.SingleOrDefault(x => x.TenTacGia == name).id_TacGia;
        }

        public bool ktratacgia(string name)
        {
            return db.TacGias.Count(x => x.TenTacGia == name) > 0;
        }

        public TacGia ChiTietTacGia(int id)
        {
            return db.TacGias.Find(id);
        }

        public List<TacGia> GetTacGia()
        {
            var list = db.Database.SqlQuery<TacGia>("GetTacGia").ToList();
            return list;
        }
        public int InsertTacGia(string tentacgia, string tieude)
        {
            object[] data =
            {
                new SqlParameter("@TenTacGia",tentacgia),
                new SqlParameter("@TieuDe",tieude)
            };
            int res = db.Database.ExecuteSqlCommand("InsertTacGia @TenTacGia,@TieuDe", data);
            return res;
        }

        public bool UpdateTacGia(int id, TacGia tg)
        {
            try
            {
                var tacgias = db.TacGias.Find(id);
                tacgias.TenTacGia = tg.TenTacGia;
                tacgias.TieuDe = tg.TieuDe;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public bool DeleteTacGia(int id)
        {
            try
            {
                var tldel = db.TacGias.Find(id);
                db.TacGias.Remove(tldel);
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