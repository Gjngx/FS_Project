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
        public bool Update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.id_User);
                user.HoTen = entity.HoTen;
                user.Email = entity.Email;
                user.GioiTinh = entity.GioiTinh;
                user.UserName = entity.UserName;
                user.PassWords = entity.PassWords;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }
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