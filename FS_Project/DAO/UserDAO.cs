using FS_Project.Context;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace FS_Project.DAO
{
    public class UserDAO
    {
        private DbModel db = null;

        public UserDAO()
        {
            db = new DbModel();
        }

        public bool CheckUserName(string userName)
        {
            return db.Users.Count((User x) => x.UserName == userName) > 0;
        }

        public bool CheckEmail(string email)
        {
            return db.Users.Count((User x) => x.Email == email) > 0;
        }
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }

        public User ViewDetail(int id)
        {
            return db.Users.Find(id);
        }
        //Đăng Nhập
        public int Login(string userName, string passWord)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.TrangThai == false)
                {
                    return -1;
                }
                else
                {
                    if (result.PassWords == passWord)
                        return 1;
                    else
                        return -2;
                }
            }
        }
        // Insert, update, delete
        public long Insert(User user)
        {
            db.Configuration.ValidateOnSaveEnabled = false;
            db.Users.Add(user);
            db.SaveChanges();
            return user.id_User;
        }
        public bool Update(string username, string passold, string newpass)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbModel"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_Update_Pass";
                cmd.Parameters.Add("@User", SqlDbType.NVarChar).Value = username;
                cmd.Parameters.Add("@OldPass", SqlDbType.NVarChar).Value = passold;
                cmd.Parameters.Add("@NewPass", SqlDbType.NVarChar).Value = newpass;
                cmd.Connection = conn;
                conn.Open();
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                dr.Read();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }



        //view
        public List<User> getAll()
        {
            var list = db.Users.ToList();
            return list;
        }

    }
}