using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class TheLoaiDAO
    {
        FSData_ProjectEntities db = new FSData_ProjectEntities();
        public List<TheLoai> DSTheLoai()
        {
            return db.TheLoais.OrderBy(x => x.id_TheLoai).ToList();
        }
    }
    
}