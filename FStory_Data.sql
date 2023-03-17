CREATE DATABASE FSData_Project
GO 
USE FSData_Project
GO 
CREATE TABLE Admins(
	id_Admin INT PRIMARY KEY,
	UserName VARCHAR(50),
	PassWords VARCHAR(50),
	TrangThai BIT
	)
CREATE TABLE Users(
	id_User INT PRIMARY KEY,
	HoTen NVARCHAR(150),
	GioiTinh NVARCHAR(50),
	NgaySinh DATE,
	SDT NVARCHAR(13),
	Email NVARCHAR(250),
	UserName VARCHAR(50),
	PassWords VARCHAR(50),
	TrangThai BIT,
	VIP SMALLINT
)
CREATE TABLE TacGia(
	id_TacGia INT PRIMARY KEY,
	TenTacGia NVARCHAR(150),
	TieuDe VARCHAR(150),
	)
CREATE TABLE TrangThai(
	id_TrangThai INT PRIMARY KEY,
	TrangThai VARCHAR(150),
	)
CREATE TABLE TheLoai(
	id_TheLoai INT PRIMARY KEY,
	TenTheLoai NVARCHAR(150),
	TieuDe VARCHAR(150)
)
CREATE TABLE Truyen(
	id_Truyen INT PRIMARY KEY,
	id_TacGia INT,
	id_TheLoai INT, 
	id_TrangThai INT, 
	TenTruyen NVARCHAR(255),
	TieuDe VARCHAR(150),
	AnhTruyen NVARCHAR(255),	
	GioiThieu NTEXT,		
	LuotXem INT,	
	NgayDang DATETIME,
	FOREIGN KEY(id_TacGia) REFERENCES dbo.TacGia(id_TacGia),
	FOREIGN KEY(id_TheLoai) REFERENCES dbo.TheLoai(id_TheLoai),
	FOREIGN KEY(id_TrangThai) REFERENCES dbo.TrangThai(id_TrangThai)
)
CREATE TABLE ChuongTruyen(
	id_Chuong INT PRIMARY KEY,
	TenChuong NVARCHAR(255),
	tieuDe VARCHAR(150),
	NoiDungChu NTEXT,
	NoiDungAudio VARCHAR(250),
	id_Truyen INT, 
	FOREIGN KEY(id_Truyen) REFERENCES dbo.Truyen(id_Truyen)
	)
CREATE TABLE TheoDoi(
	id_TheoDoi INT PRIMARY KEY,
	id_Truyen INT,
	id_User INT,
	FOREIGN KEY(id_Truyen) REFERENCES dbo.Truyen(id_Truyen),
	FOREIGN KEY(id_User) REFERENCES dbo.Users(id_User)
)

INSERT INTO Admins VALUES (1, 'admin','admin',1) 
INSERT INTO TheLoai VALUES (1, 'Trọng sinh', 'TrongSinh') 
INSERT INTO TheLoai VALUES (2, 'Hài hước', 'HaiHuoc') 
INSERT INTO TheLoai VALUES (3, 'Lịch sử', 'LichSu') 
INSERT INTO TacGia VALUES (1, 'Nguyễn Văn A', 'NguyenVanA') 
INSERT INTO TacGia VALUES (2, 'Nguyễn Văn B', 'NguyenVanB') 
INSERT INTO TacGia VALUES (3, 'Nguyễn Văn C', 'NguyenVanC') 
INSERT INTO TrangThai VALUES (1, 'Hoàng Thành') 
INSERT INTO TrangThai VALUES (2, 'Đang cập Nhật') 
INSERT INTO Truyen VALUES (1, 2, 3, 1, N'Hồn Đế Vũ Thần', 'HoDeVuThan1', 'hondevuthan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 12000, GETDATE())
INSERT INTO Truyen VALUES (2, 2, 3, 1, N'Thôn Thần Chí Tôn', 'ThonThanChiTon1', 'thonthanchiton.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 3000, GETDATE())
INSERT INTO Truyen VALUES (3, 2, 3, 1, N'Dị Giới Vô Địch Hệ Thống', 'DiGioiVoDichHeThong1', 'digioivodichhethong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 4000, GETDATE())
INSERT INTO Truyen VALUES (5, 2, 3, 1, N'Trọng Sinh Chi Tối Cường Kiếm Thần', 'HoDeVuThan1', 'trongsinhchitoicuong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 12319, GETDATE())
INSERT INTO Truyen VALUES (4, 2, 3, 1, N'Cổ Chân Nhân', 'HoDeVuThan1', 'cochannhan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 12838, GETDATE())
INSERT INTO Truyen VALUES (6, 2, 3, 1, N'Hồn Đế Vũ Thần', 'HoDeVuThan1', 'hondevuthan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 123, GETDATE())
INSERT INTO Truyen VALUES (7, 2, 3, 1, N'Thôn Thần Chí Tôn', 'HoDeVuThan1', 'thonthanchiton.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1234, GETDATE())
INSERT INTO Truyen VALUES (8, 2, 3, 1, N'Dị Giới Vô Địch Hệ Thống', 'HoDeVuThan1', 'digioivodichhethong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1236, GETDATE())
INSERT INTO Truyen VALUES (9, 2, 3, 1, N'Trọng Sinh Chi Tối Cường Kiếm Thần', 'HoDeVuThan1', 'trongsinhchitoicuong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1231, GETDATE())
INSERT INTO Truyen VALUES (10, 2, 3, 1, N'Cổ Chân Nhân', 'HoDeVuThan1', 'cochannhan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1238, GETDATE())
INSERT INTO Truyen VALUES (11, 2, 3, 1, N'Hồn Đế Vũ Thần', 'HoDeVuThan1', 'hondevuthan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 123, GETDATE())
INSERT INTO Truyen VALUES (12, 2, 3, 1, N'Thôn Thần Chí Tôn', 'HoDeVuThan1', 'thonthanchiton.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1234, GETDATE())
INSERT INTO Truyen VALUES (13, 2, 3, 1, N'Dị Giới Vô Địch Hệ Thống', 'HoDeVuThan1', 'digioivodichhethong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1236, GETDATE())
INSERT INTO Truyen VALUES (15, 2, 3, 1, N'Trọng Sinh Chi Tối Cường Kiếm Thần', 'HoDeVuThan1', 'trongsinhchitoicuong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1231, GETDATE())
INSERT INTO Truyen VALUES (14, 2, 3, 1, N'Cổ Chân Nhân', 'HoDeVuThan1', 'cochannhan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1238, GETDATE())
INSERT INTO Truyen VALUES (16, 2, 3, 1, N'Hồn Đế Vũ Thần', 'HoDeVuThan1', 'hondevuthan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 123, GETDATE())
INSERT INTO Truyen VALUES (17, 2, 3, 1, N'Thôn Thần Chí Tôn', 'HoDeVuThan1', 'thonthanchiton.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1234, GETDATE())
INSERT INTO Truyen VALUES (18, 2, 3, 1, N'Dị Giới Vô Địch Hệ Thống', 'HoDeVuThan1', 'digioivodichhethong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1236, GETDATE())
INSERT INTO Truyen VALUES (19, 2, 3, 1, N'Trọng Sinh Chi Tối Cường Kiếm Thần', 'HoDeVuThan1', 'trongsinhchitoicuong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1231, GETDATE())
INSERT INTO Truyen VALUES (20, 2, 3, 1, N'Cổ Chân Nhân', 'HoDeVuThan1', 'cochannhan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1238, GETDATE())
INSERT INTO Truyen VALUES (21, 2, 3, 1, N'Hồn Đế Vũ Thần', 'HoDeVuThan1', 'hondevuthan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 123, GETDATE())
INSERT INTO Truyen VALUES (22, 2, 3, 1, N'Thôn Thần Chí Tôn', 'HoDeVuThan1', 'thonthanchiton.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1234, GETDATE())
INSERT INTO Truyen VALUES (23, 2, 3, 1, N'Dị Giới Vô Địch Hệ Thống', 'HoDeVuThan1', 'digioivodichhethong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1236, GETDATE())
INSERT INTO Truyen VALUES (25, 2, 3, 1, N'Trọng Sinh Chi Tối Cường Kiếm Thần', 'HoDeVuThan1', 'trongsinhchitoicuong.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1231, GETDATE())
INSERT INTO Truyen VALUES (24, 2, 3, 1, N'Cổ Chân Nhân', 'HoDeVuThan1', 'cochannhan.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 1238, GETDATE())
