using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace FS_Project.Context
{
    public partial class DbModel : DbContext
    {
        public DbModel()
            : base("name=DbModel")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<ChuongTruyen> ChuongTruyens { get; set; }
        public virtual DbSet<TacGia> TacGias { get; set; }
        public virtual DbSet<TheLoai> TheLoais { get; set; }
        public virtual DbSet<TheoDoi> TheoDois { get; set; }
        public virtual DbSet<TrangThai> TrangThais { get; set; }
        public virtual DbSet<Truyen> Truyens { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.PassWords)
                .IsUnicode(false);

            modelBuilder.Entity<ChuongTruyen>()
                .Property(e => e.tieuDe)
                .IsUnicode(false);

            modelBuilder.Entity<ChuongTruyen>()
                .Property(e => e.NoiDungAudio)
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .Property(e => e.TieuDe)
                .IsUnicode(false);

            modelBuilder.Entity<TheLoai>()
                .Property(e => e.TieuDe)
                .IsUnicode(false);

            modelBuilder.Entity<Truyen>()
                .Property(e => e.TieuDe)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.PassWords)
                .IsUnicode(false);
        }
    }
}
