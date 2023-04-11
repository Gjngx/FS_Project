using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class AdminDAO
    {
        DbModel db = new DbModel();
        public List<Admin> GetTKADMIN()
        {
            var list = db.Database.SqlQuery<Admin>("GetAdmin").ToList();
            return list;
        }
        public Admin GetById(string userName)
        {
            return db.Admins.SingleOrDefault(x => x.UserName == userName);
        }
        public int Login(string UserName, string PassWord)
        {
            var result = db.Admins.SingleOrDefault(x => x.UserName == UserName);
            if (result == null)
            {
                return 0;
            }
            else if (result.TrangThai == false)
            {
                return -1;
            }
            else
            {
                if (result.PassWords == PassWord)
                {
                    return 1;
                }
                else
                {
                    return -2;
                }
            }
        }
        public int InsertAdmin(string username, string pass, bool? trangthai )
        {
            object[] data =
            {
                new SqlParameter("@UserName", username),
                new SqlParameter("@PassWord", pass),
                new SqlParameter("@TrangThai", trangthai),
            };
            int res = db.Database.ExecuteSqlCommand("InsertAdmin @UserName, @PassWord, @TrangThai", data);
            return res;
        }
        public bool DeleteTKAdmin(int id)
        {
            try
            {
                var addel = db.Admins.Find(id);
                db.Admins.Remove(addel);
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