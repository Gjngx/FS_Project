using FS_Project.Context;
using System;
using System.Collections.Generic;
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
    }
}