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
        public TacGia ChiTietTacGia(int id)
        {
            return db.TacGias.Find(id);
        }
    }
}