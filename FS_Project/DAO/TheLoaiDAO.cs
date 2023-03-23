using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class TheLoaiDAO
    {
        DbModel db = new DbModel();

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


    }
    
}