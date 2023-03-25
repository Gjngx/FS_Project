using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class TrangThaiDAO
    {

        DbModel db = new DbModel();

        public int? GetIdByName(string name)
        {
            return db.TrangThais.SingleOrDefault(x => x.TrangThai1 == name).id_TrangThai;
        }
    }
}