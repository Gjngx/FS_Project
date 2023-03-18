CREATE DATABASE FSData_Project
GO 
USE FSData_Project
GO 
CREATE TABLE Admins(
	id_Admin INT PRIMARY KEY IDENTITY(1,1),
	UserName VARCHAR(50),
	PassWords VARCHAR(50),
	TrangThai BIT
	)
CREATE TABLE Users(
	id_User INT PRIMARY KEY IDENTITY(1,1),
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
	id_TacGia INT PRIMARY KEY IDENTITY(1,1),
	TenTacGia NVARCHAR(150),
	TieuDe VARCHAR(150),
	)
CREATE TABLE TrangThai(
	id_TrangThai INT PRIMARY KEY,
	TrangThai NVARCHAR(150),
	)
CREATE TABLE TheLoai(
	id_TheLoai INT PRIMARY KEY IDENTITY(1,1),
	TenTheLoai NVARCHAR(150),
	TieuDe VARCHAR(150)
)
CREATE TABLE Truyen(
	id_Truyen INT PRIMARY KEY IDENTITY(1,1),
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
	id_Chuong INT PRIMARY KEY IDENTITY(1,1),
	TenChuong NVARCHAR(255),
	tieuDe VARCHAR(150),
	NoiDungChu NTEXT,
	NoiDungAudio VARCHAR(250),
	SoChuong INT,
	id_Truyen INT, 
	FOREIGN KEY(id_Truyen) REFERENCES dbo.Truyen(id_Truyen)
	)
CREATE TABLE TheoDoi(
	id_TheoDoi INT PRIMARY KEY IDENTITY(1,1),
	id_Truyen INT,
	id_User INT,
	FOREIGN KEY(id_Truyen) REFERENCES dbo.Truyen(id_Truyen),
	FOREIGN KEY(id_User) REFERENCES dbo.Users(id_User)
)

--Admins

INSERT INTO Admins VALUES ('admin','admin',1) 

--Users

INSERT INTO Users VALUES (N'Đặng Nhật Giang', N'Nam', '2002/10/26', '0378687955', 'giangdang2k2@gmail.com', 'user', 'user', 1, 1)

--Thể Loại

INSERT INTO TheLoai VALUES (N'Huyền Ảo', 'huyen-ao' ) 
INSERT INTO TheLoai VALUES (N'Hài Hước', 'hai-huoc') 
INSERT INTO TheLoai VALUES (N'Huyền Huyễn', 'huyen-huyen') 
INSERT INTO TheLoai VALUES (N'Lịch Sử', 'lich-su' ) 
INSERT INTO TheLoai VALUES (N'Hệ Thống', 'he-thong') 
INSERT INTO TheLoai VALUES (N'Dị Năng', 'di-nang') 
INSERT INTO TheLoai VALUES (N'Trinh Thám', 'trinh-tham' ) 
INSERT INTO TheLoai VALUES (N'Cổ Đại', 'co-dai') 
INSERT INTO TheLoai VALUES (N'Kiếm Hiệp', 'kiem-hiep') 

--Tác Giả

INSERT INTO TacGia VALUES (N'Tiểu Tiểu Bát', 'tieu-tieu-bat') 
INSERT INTO TacGia VALUES (N'Hồ Đồ Tiếu Tiếu', 'ho-do-tieu-tieu') 
INSERT INTO TacGia VALUES (N'Thập Nguyệt Lưu Niên', 'thap-nguyet-luu-nien') 
INSERT INTO TacGia VALUES (N'Mạc Hỏa Tiểu Mạt', 'mac-hoa-tieu-mat') 
INSERT INTO TacGia VALUES (N'Hỏa Tiểu Huyên', 'hoa-tieu-huyen') 
INSERT INTO TacGia VALUES (N'Vân Ngoại Thiên Đô', 'van-ngoai-thien-do') 

--Trạng Thái

INSERT INTO TrangThai VALUES (1, N'Hoàn Thành') 
INSERT INTO TrangThai VALUES (2, N'Đang Cập Nhật') 

--Truyen

INSERT INTO Truyen VALUES (1, 7, 1, N'Hồn Đế Vũ Thần', 'hon-de-vu-than', 'hon-de-vu-than.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 12000, '2021-12-03 20:33:11.260')
INSERT INTO Truyen VALUES (6, 2, 2, N'Thôn Thần Chí Tôn', 'thon-than-chi-ton', 'thon-than-chi-ton.jpg', N'Thượng cổ thời kỳ, thần ma chúa tể thế giới, lưu lại vô số truyền thừa! Thiếu niên Tần Trầm, lấy được Thôn Thần Ngộ Đạo Quyết, thôn phệ thần ma truyền thừa, lĩnh ngộ vạn thiên đạo pháp, thành tựu đệ nhất chí tôn! Ta Thôn Thần nhất tộc lúc trở về, chính là cái này vạn thiên thế giới, rung động ngày!', 3000, '2021-12-03 20:33:33.827')
INSERT INTO Truyen VALUES (4, 3, 2, N'Dị Giới Vô Địch Hệ Thống', 'di-gioi-vo-dich-he-thong', 'di-gioi-vo-dich-he-thong.jpg', N'Tu luyện kỳ hiệu giết người giết quái đẳng cấp bão táp! Rút thưởng công năng Thần kỹ Thần binh cầm tới mềm tay! Phó chức hệ thống Thần đan Thánh phù nhẹ nhõm luyện chế .Trạch nam Thần Thân mang theo vô địch hệ thống vượt qua mà đến, đánh quái bạo bí tịch, giết người làm rơi đồ, tay trái Hàng Long 128 chưởng, tay phải chư thiên Càn Khôn Đại Na Di, uy áp Tam Giới, cuối cùng trở thành vô địch Chí Tôn!', 4000, '2021-12-03 20:33:38.873')
INSERT INTO Truyen VALUES (5, 6, 1, N'Trọng Sinh Chi Tối Cường Kiếm Thần', 'trong-sinh-chi-toi-cuong-kiem-than', 'trong-sinh-chi-toi-cuong-kiem-than.jpg', N'Thạch Phong trọng sinh mang theo trí nhớ mười năm từng chơi game, bắt đầu làm lại từ đầu. Mở ra Studio Game của mình, mở ra một cuộc sống mới. Kỹ xảo kiếm tiền! Công lược đánh phó bản! Nhiệm vụ truyền kỳ! Xuất sứ trang bị! Kỹ xảo chiến đấu mà người khác không biết! Bí mật mà ngay cả Phong Trắc Giả cũng không biết, hắn đều biết.', 12319, '2021-12-03 20:33:41.890')
INSERT INTO Truyen VALUES (3, 4, 2, N'Cổ Chân Nhân', 'co-chan-nhan', 'co-chan-nhan.jpg', N'Người là vạn vật chi linh, Cổ là thiên địa chân tinh Tam quan bất chính, ma đầu tái sinh. Chuyện về một người xuyên qua không ngừng sống lại. Một thế giới kì lạ của người nuôi Cổ, dùng Cổ, luyện Cổ. Xuân Thu Thiền, Nguyệt Quang Cổ, Tửu Trùng, Nhất Khí Kim Quang Trùng, Thanh Ti Cổ, Hi Vọng Cổ...... Một tuyệt thế ma đầu thỏa chí tung hoành!', 12838, '2021-12-30 11:11:47.663')

INSERT INTO Truyen VALUES (5, 8, 1, N'Bán Tiên', 'ban-tien', 'ban-tien.jpg', N'Kẻ hèn này bất tài, tuổi vừa mới mười chín, từ nhỏ liền là một gã đạo sĩ, trên có sư huynh hơn mười vị trí, dưới duy hơn nhỏ nhất, tục xưng quan môn đệ tử. Sư môn nghèo quá, các sư huynh khó nhịn kham khổ, may mắn Chưởng môn sư tôn rộng rãi, mặc cho các sư huynh giải thể mà đi.', 12080, '2021-12-30 11:18:21.920')
INSERT INTO Truyen VALUES (2, 1, 1, N'Giang Sơn Mỹ Sắc', 'giang-son-my-sac', 'giang-son-my-sac.jpg', N'Thịnh thế Đường triều có thể nói là điểm sáng chói nhất trong lịch sử trung hoa, bởi xét về khía cạnh lãnh thổ lẫn văn hóa, đế chế này có phần nổi bật hơn cả nhà Hán khi ảnh hưởng và móng vuốt của nó lan tràn khắp cả thế giới. Không những vậy, Đường Thái Tông Lý Thế Dân còn được công nhận là một trong những đại đế thế giới đầy quyền lực nhất. Chính vì ánh sáng quang huy của triều đại này quá rực rỡ, mơ hồ che đựng hết thảy diễn biến lịch sử thời đại xung quanh nó khiến người khác lãng quên đi nhà Tùy, một triều đại đoản mệnh nhưng nếu so sánh về ý nghĩa lịch sử với nhà Đường chỉ có hơn không kém.', 30090, '2021-12-30 11:19:31.313')
INSERT INTO Truyen VALUES (4, 8, 2, N'Đế Yến', 'de-yen', 'de-yen.jpg', N'Tu luyện kỳ hiệu giết người giết quái đẳng cấp bão táp! Rút thưởng công năng Thần kỹ Thần binh cầm tới mềm tay! Phó chức hệ thống Thần đan Thánh phù nhẹ nhõm luyện chế .Trạch nam Thần Thân mang theo vô địch hệ thống vượt qua mà đến, đánh quái bạo bí tịch, giết người làm rơi đồ, tay trái Hàng Long 128 chưởng, tay phải chư thiên Càn Khôn Đại Na Di, uy áp Tam Giới, cuối cùng trở thành vô địch Chí Tôn!', 4700, '2021-12-30 11:22:51.990')
INSERT INTO Truyen VALUES (6, 5, 1, N'Nghịch Thiên Tà Thần', 'nghich-thien-ta-than', 'nghich-thien-ta-than.jpg', N'Chưởng Thiên Độc chi châu, thừa Tà Thần chi huyết, tu nghịch thiên chi lực. Nhất đại Tà Thần, quân lâm thiên hạ!', 12329, '2021-12-30 11:24:41.293')
INSERT INTO Truyen VALUES (1, 9, 2, N'Khắp Chốn Giang Hồ Đều Là Thổ Hào', 'khap-chon-giang-ho-deu-la-tho-hao', 'khap-chon-giang-ho-deu-la-tho-hao.jpg', N'Kiếp trước Thẩm Thiên Lăng là một ảnh đế vô cùng nổi tiếng, nay lại được người ta sắp đặt cho một vị hôn thê không giống ai, không giống ai bởi vì hắn được sắp đặt gả cho một ông chồng. Vừa nghe thấy tin này Thẩm Thiên Lăng giống như bị sét đánh trúng đầu! Vì sao vị hôn thê của hắn lại là một gã đàn ông chứ? Dù sao không phải một em gái đáng yêu e thẹn dáng người mảnh mai, thì một bà chị già tóc quăn bưởi to đều được mà.', 12838, '2021-12-30 11:11:47.663')

INSERT INTO Truyen VALUES (1, 7, 1, N'Huyến Vực Mê Đồ', 'huyet-vuc-me-do', 'huyet-vuc-me-do.jpg', N'Nội dung truyện xoay quanh đề tài mỗi một kẻ yêu nghiệt đều hy vọng có thể kiếm được một trung khuyển công, Sera đương nhiên không ngoại lệ. Vì thế cậu hứng thú bừng bừng, siêng năng, chịu thương chịu khó triển khai nhiệm vụ câu dẫn vĩ đại. Mặt than? Lạnh nhạt? Né tránh? Không thành vấn đề. Chuốc rượu, cởi sạch, lăn lên giường! Sau đó… Ê ê, anh rốt cuộc có làm được không? Tôi sẽ đau a!', 12000, '2021-11-03 20:33:11.260')
INSERT INTO Truyen VALUES (6, 2, 2, N'Trường Cấp Ba Sơn Hải', 'truong-cap-ba-son-hai', 'truong-cap-ba-son-hai.jpg', N'Trường cấp ba Sơn Hải bên trong ngoại trừ những học sinh phổ thông bình thường, còn có một quần ( sơn hải kinh)* bên trong là những tiểu yêu quái, bọn họ ngụy trang thành dáng dấp của con người. Mỗi ngày nghiêm túc học tập, tích cực chuẩn bị chiến tranh đi thi đại học. Lâm Cạnh là học sinh mới, tại ngày khai giảng thứ nhất, liền bị người đứng thứ nhất từ dưới lên trên của lớp – Quý Tinh Lăng hiểu lầm thành tiểu yêu quái mình phải bảo vệ, bởi vậy dẫn đến một loạt sự cố. Bất quá Quý Tinh Lăng rất nhanh liền phát hiện, bạn cùng bàn mới của mình không hề yên tĩnh, khi thi đấu lại còn —— vừa hiếu thắng lại vừa có sức chiến đấu, còn có tính khiết phích, kỹ năng độc miệng: MAX.', 3050, '2021-12-06 20:37:33.827')
INSERT INTO Truyen VALUES (4, 3, 2, N'Nhất Kiếm Sương Hàn', 'nhat-kiem-suong-han', 'nhat-kiem-suong-han.jpg', N'Tiêu vương Quý Yên Nhiên là một người tao nhã thanh thoát, lại còn có võ công cao cường. Bao nhiều người ngưỡng mộ đều tự suy đoán rằng, một vị hoàng tộc cao quý, phong lưu như Tiêu vương, ý trung nhân chắc chắn cũng sẽ là một người tài tình, có thể lên được phòng khách, xuống được phòng bếp, tinh thông mọi thứ, như vậy mới có thể cầm sắt hoà minh cùng vương gia.', 4060, '2021-12-03 20:31:38.873')
INSERT INTO Truyen VALUES (5, 6, 1, N'Lui Ra Để Trẩm Đến', 'lui-ra-de-tram-den', 'lui-ra-de-tram-den.jpg', N'Thẩm Đường tỉnh lại trên đường đi đày, phát hiện thế giới này rất phản khoa học. Thần thạch trên trời rơi xuống, trăm quốc tương tranh. Văn ngưng Văn tâm, xuất khẩu thành thật. Võ tụ Võ đảm, phá núi đoạn biển. Tiểu bạch kiểm cô cho là, một câu "Hoành thương thúc ngựa", một giây sau mũ giáp phụ thân, trường thương trong tay, một người thành quân, thiên quân vạn mã khả năng gϊếŧ thất tiến thất xuất!', 16319, '2021-12-04 20:33:41.890')
INSERT INTO Truyen VALUES (3, 4, 2, N'Đô Thị Thần Nhân', 'do-thi-than-nhan', 'do-thi-than-nhan.jpg', N'Chàng trai xui xẻo Lưu Vũ Phi, bước qua mười bảy cái xuân xanh, vừa thi rớt, lại vừa bị bạn gái đá, trong lúc đau khổ được cha mẹ cho tiền đi du lịch khuây khỏa thoải mái tâm tình. Không hiểu sao hắn lại hứng thú chọn điểm đến Côn Lôn, vùng đất thần thoại với những truyền thuyết về các vị thần tiên. Người ta kể rằng đó là một truyền thuyết từ hàng vạn năm trước Tây Vương Mẫu đã tu luyện ở Dao Trì, địa danh nổi tiếng nhất Côn Lôn và đã đắc đạo, phi thăng thần giới.', 13838, '2021-12-30 09:11:47.663')

INSERT INTO Truyen VALUES (5, 8, 1, N'Kiều Thế Như Vân', 'kieu-the-nhu-van', 'kieu-the-nhu-van.jpg', N'Hắn - Thẩm Ngao - một kẻ trời ban cho thiên phú làm giả đồ cổ, đồ hắn làm ra khiến mọi người không thể phân biệt được đâu là thật đâu là giả, khiến thị trường đồ cổ quốc tế điên đảo, náo loạn. Trong một lần chạy trốn cảnh sát, hắn sảy chân ngã xuống vách núi khiến bản thân mình xuyên không về thời Tống làm một nhân tài sống trong phủ Quốc Công.', 17880, '2022-12-30 11:18:21.920')
INSERT INTO Truyen VALUES (2, 1, 1, N'Hoa Sơn Tiên Môn', 'hoa-son-tien-mon', 'hoa-son-tien-mon.jpg', N'Lục Nguyên, một đệ tử bình thường của Bắc Phong Hoa Sơn Tiên Môn, vốn cho rằng mình có thể nhàn rỗi bình yên cả đời nhưng vì sư phó thọ nguyên không nhiều, đủ loại khiêu chiến ập đến hắn không thể không liều một phen. Trong lúc vô tình, hắn đã lĩnh ngộ kiếm ý trong kiếm, về sau luyện thành Chung Cực Kiếm ý, hóa thành Vân Long thập hình.', 34290, '2022-12-30 11:19:31.313')
INSERT INTO Truyen VALUES (4, 8, 2, N'Truy Tiềm Kí Ức', 'truy-tim-ky-uc', 'truy-tim-ky-uc.jpg', N'Câu chuyện đầy màu sắc với bút tích bay bổng cùng những nhân vật kiệt xuất, giấc mơ là sự phản chiếu thế giới hiện thực. Giấc mơ là sự lưu đầy của tiềm thức. Nhưng nếu cô từng yêu tha thiết một người, từng vì anh mà đau đớn khôn cùng, vậy thì tại sao những năm qua, cô lại chẳng nhớ gì đến anh? Tại sao cô lại quên sạch mọi ký ức về anh.', 47980, '2020-12-30 11:22:51.990')
INSERT INTO Truyen VALUES (6, 5, 1, N'Luật Ngầm', 'luat-ngam', 'luat-ngam.jpg', N'Một câu chuyện kể về cuộc đời của nữ chính, không ai biết cô ai là, trong mọi câu chuyện cô đều xưng là tôi, cô bí ẩn giống như cuộc đời của cô vậy. Câu chuyện được mở đầu bằng những mảng kí ức của nữ chính về gia đình và những người thân...Tất cả lại chỉ bao phủ bởi sương mù. Điều đó đã thôi thúc cô đi tìm hiểu mọi thứ. Chân tướng sự thật ra sao? Cha cô là ai? Là người mà cô vẫn hay nhìn thấy...', 19929, '2022-12-30 11:24:41.293')
INSERT INTO Truyen VALUES (1, 9, 2, N'Đại Quốc Tặc', 'dai-quoc-tac', 'dai-quoc-tac.jpg', N'Đang trong sự truy giết của đám hắc bang, lại nổi máu anh hùng ra tay giết bọn cướp của hiếp đáp phụ nữ ngay trên địa bàn của chúng, mười mấy khẩu súng vây quanh… Chết chắc! Linh hồn Giang Long còn đang vất vưởng lang thang đến phát bực thì bỗng nhiên bị gọi dậy, nhưng… trong một thân thể khác, ở một thời đại khác!', 12908, '2021-10-30 11:11:47.663')

INSERT INTO Truyen VALUES (1, 7, 1, N'Mộng Hồng Trần', 'mong-hong-tran', 'mong-hong-tran.jpg', N'Nam chính tên là Việt Hoàng vốn còn đang đi học chỉ mới 17 tuổi, rất mê những bộ truyện manga và Light Novel,cứ hay ảo tưởng mình được xuyên vào đó và trở thành bá chủ thế giới. Mọi chuyện vẫn diễn ra bình thường cho tới khi hắn đi du lịch cùng bạn bè....', 15430, '2022-10-03 20:33:11.260')
INSERT INTO Truyen VALUES (6, 2, 2, N'Đào Mộ Bút Ký', 'dao-mo-but-ky', 'dao-mo-but-ky.jpg', N'Truyện biết cách tạo nên sức hút từ việc xây dựng cá tính và hoàn cảnh của từng nhân vật, các cuộc phiêu lưu đầy nguy hiểm, những tình thế hiểm nghèo và sức mạnh bí ẩn của những thế lực huyền bí...Năm mươi năm trước, một nhóm kẻ trộm mộ trên Trường Sa đào được một bộ sách lụa Chiến quốc, trên quyển sách đã hư hỏng có ghi chép lại vị trí một khu mộ cổ Chiến quốc rất kì lạ, nhưng những kẻ trộm này lại gặp phải chuyện kì quái trong lòng đất, hầu như toàn bộ đều chết sạch. Năm mươi năm sau, cháu trai của một trong số những kẻ trộm mộ đó phát hiện bí mật này từ ghi chép để lại của ông nội cậu. Cậu cùng một nhóm trộm mộ cao thủ tiến vào tìm bảo vật. Nhưng không ai ngờ, cổ mộ này lại có nhiều chuyện nhiều chuyện quái dị như vậy: Thất tinh nghi quan, Thanh nhãn hồ thi, Cửu đầu xà bách…', 32340, '2023-02-06 20:37:33.827')
INSERT INTO Truyen VALUES (4, 3, 2, N'Thiên Hạ Vô Song', 'thien-ha-vo-song', 'thien-ha-vo-song.jpg', N'Thiên Hạ Vô Song là một truyện Dị Giới tiêu biểu. Truyện dẫn dắt bạn vào một vùng không gian hoang vu, huyền bí, nơi bị đồn đãi là một vùng đất đã bị nguyền rủa. Nhưng, có thật là thế không? Đây là truyện dị giới độc đáo có thiên ma, binh pháp, có những yếu tố ảo tưởng nhưng được tác giả Nhâm Oán thể hiện rất sống động không làm cho người đọc cảm thấy hư ảo quá mực, cách miêu tả cảnh vật cũng như con người và những sự kiện rất mới, đa dạng. Nhưng đối với Mạnh Hàn mà nói, thế giới này thực cũng không đáng sợ như người ta nói lắm, cũng không quá mức phức tạp vì đây là nơi hắn cùng với mấy tình nhân đánh mạt chược mà thôi. Nhưng liệu có phải quá đơn giản như hắn nói không hay thực sự là có điều gì đó bí ẩn? Đọc truyện và khám phá nhé!', 42160, '2019-12-03 20:31:38.873')
INSERT INTO Truyen VALUES (5, 6, 1, N'Nguyên Long', 'nguyen-long', 'nguyen-long.jpg', N'Một thế giới khác hẳn địa cầu. Thế giới của nguyên hồn, nơi linh hồn tu luyện và vươn lên đỉnh cao. Một thế giới thần kì và đầy yếu tố huyền huyễn. Nơi đây có các tôn môn lừng lẫy kiêu ngạo, những gia tộc ẩn cư lâu đời. Nơi đây, chỉ tôn sùng kẻ mạnh, chỉ cần ngươi có thực lực, ngươi có quyền lên tiếng. Cao thủ như mây, nắm đấm ai to hơn thì có tiếng nói có trọng lượng hơn. Vương Thắng, một lính đặc chủng tài ba, một xạ thủ siêu cấp. trong một lần thi hành nhiệm vụ đã vô tình xuyên qua đến thế giới này. Nhận được nguyên hồn cá chép không trọn vẹn cùng một cô vợ hờ. Đối với thế giới này, con cá chép nhỏ đó không hề được coi trọng. Liệu Vương Thắng có thể bỏ ngoài tai những lời xỉ nhục để vững bước hiên ngang không? Đứng trên đỉnh cao, tuyên bố với những kẻ cười nhạo, cho bọn chúng biết, thế nào là cá chép hóa rồng.', 16219, '2022-12-04 20:33:41.890')
INSERT INTO Truyen VALUES (3, 4, 2, N'Lê Hấp Đường Phèn', 'le-hap-duong-phen', 'le-hap-duong-phen.jpg', N'Truyện Lê Hấp Đường Phèn là tựa truyện hay, đặc sắc và thú vị thuộc thể loại ngôn tình. Một câu chuyện tình yêu nhẹ nhàng, trong sáng và đáng yêu của hai cô cậu học trò. Bạn cùng bàn của cô tên là Lê Ngữ Băng, một cậu bé vô cùng đáng ghét. Tại sao cô lại ghét cậu ấy? Bởi vì ông nội hứa với cô, nếu kết quả thi của cô xếp thứ nhất lớp thì ông sẽ đưa cô đi Disneyland chơi.', 13818, '2023-01-30 09:11:47.663')

--Chương Truyện

INSERT INTO ChuongTruyen VALUES(N'Chương 1', 'chuong-1', N'<p>Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.</p>
<p>&quot;A, ta không chết?&quot; Đây là hắn ý niệm đầu tiên.</p>
<p>Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ
lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.</p>
<p>Đây là một cái ưu tú sát thủ bản năng phản ứng.</p>
<p>Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.</p>
<p>Ta làm sao sẽ như thế yếu ớt?</p>
<p>Tiêu Dật, người Hoa, thiên tài võ học.</p>
<p>Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.</p>
<p>Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa
chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào
thực chiến ý nghĩa lúc</p>
<p>Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng
lập nên 300 thắng liên tiếp kỳ tích ghi chép.</p>
<p>Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có
thể tại nắm đấm của hắn xuống chống nổi mười chiêu.</p>
<p>''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm
kỵ cùng hoảng sợ.</p>
<p>Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận
vua không ngai.</p>
<p>Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.</p>
<p>Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy
thù lao.</p>
<p>Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một
phần ranh giới cuối cùng cùng trách nhiệm.</p>
<p>Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.</p>
<p>Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực
cùng nhân vật.</p>
<p>Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.</p>
<p>Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao
giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc</p>
<p>Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ
nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội
thành viên không một may mắn thoát khỏi.</p>
<p>Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung
danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.</p>
<p>Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự
định lẻn vào Hoa Hạ trộm mật lúc</p>
<p>Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám
sát.</p>
<p>Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công
cùng nhau chết oan chết uổng về sau</p>
<p>Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường
đại của hắn cùng tàn nhẫn.</p>
<p>Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại
nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước
vào Hoa Hạ nửa bước.</p>
<p>Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.</p>
<p>Người muốn giết hắn, nhiều vô số kể.</p>
<p>Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến
dọa người, cao cư bảng danh sách đệ nhất.</p>
<p>Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp
cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không
người dám nhắc tới lên cái này nhiệm vụ.</p>
<p>Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.</p>
<p>Treo thưởng không treo, nhưng không người dám tiếp.</p>
<p>Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.</p>
<p>Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học,
lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật
văn hoá.</p>
<p>Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.</p>
<p>Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.</p>
<p>Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.</p>
<p>Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh
giết, đem di vật văn hoá thu hồi.</p>
<p>Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.</p>
<p>Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.</p>
<p>Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh
anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều
đứng đầu sát thủ</p>
<p>Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.</p>
<p>Một cái nhắm vào mình âm mưu.</p>
<p>Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi
ra.</p>
<p>Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.</p>
<p>Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay
là trúng kế.</p>
<p>Nhưng, Tiêu Dật không có sợ.</p>
<p>Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng
vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.</p>
<p>Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.</p>
<p>Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá
bên trong.</p>
<p>Dị biến đột nhiên phát sinh.</p>
<p>Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.</p>
<p>Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi
tới.</p>
<p>Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.</p>
<p>Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.</p>
<p>Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.</p>
<p>Vì chính là phòng ngừa ngoài ý muốn.</p>
<p>Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.</p>
<p>Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.</p>
<p>Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình
chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.</p>
<p>&quot;Ha ha ha ha &quot;</p>
<p>Tiêu Dật không khỏi cất tiếng cười to.</p>
<p>Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn
cùng, đủ vốn.</p>
<p>&quot;Ách, đau quá.&quot; Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô
cùng suy yếu cảm giác.</p>
<p>&quot;Không đúng, ta không chết.&quot; Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.</p>
<p>Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!</p>
<p>Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu</p>
<p>&quot;Cmn, lão tử vậy mà xuyên qua!&quot;</p>
<p>Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.</p>
<p>Giờ phút này vẫn là không nhịn được văng tục.</p>
<p>Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị
thế giới.</p>
<p>Có chút cùng loại với Địa Cầu cổ đại.</p>
<p>Thế giới này, cường giả vi tôn, võ giả hoành hành.</p>
<p>Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.</p>
<p>Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một
cái vừa mới chết đi con em gia tộc trên người.</p>
<p>Xảo là, gia tộc này con em cũng gọi Tiêu Dật.</p>
<p>Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia,
đương đại gia chủ con độc nhất.</p>
<p>Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí
ẩn.</p>
<p>Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.</p>
<p>Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa
người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ
nhục, cả ngày chịu đến ức hiếp.</p>
<p>Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.</p>
<p>&quot;Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!&quot; Tiêu Dật bĩu
môi.</p>
<p>Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được</p>
<p>Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.</p>
<p>Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.</p>
<p>Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn,
ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.</p>
<p>Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.</p>
<p>Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ
Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.</p>
<p>Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn
đã sớm cùng mình vị hôn thê có tư tình.</p>
<p>Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ
giả, càng là Ngũ trưởng lão chi tử.</p>
<p>Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn,
cũng đem hắn đẩy xuống vách núi.</p>
<p>Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không
thể nói, mắt không thể trợn.</p>
<p>Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra
tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.</p>
<p>Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi
trên người hắn.</p>
<p>&quot;Thật ác độc nữ tử, thật là ác độc biểu ca.&quot; Tiêu Dật nhíu mày, trong mắt đều
là băng lãnh.</p>
<p>&quot;Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn
bộ chôn cùng, ngươi nhưng chết được như vậy uất ức.&quot; Tiêu Dật thở dài.</p>
<p>&quot;Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù
này, ta liền giúp ngươi báo.&quot;</p>
<p>Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái
trùng hợp, dù là người này đã chết.</p>
<p>Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.</p>
<p>Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.</p>
<p>Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.</p>
<p>Võ hồn lại phân rất nhiều loại.</p>
<p>Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn,
rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây,
mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.</p>
<p>Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.</p>
<p>Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả
Võ hồn.</p>
<p>Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.</p>
<p>Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.</p>
<p>Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao,
heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.</p>
<p>Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là
Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân
Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ
cũng thiêu đốt hầu như không còn.</p>
<p>Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.</p>
<p>Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến
đấu mạnh yếu.</p>
<p>Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên
phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.</p>
<p>&quot;Võ giả, Võ hồn.&quot; Tiêu Dật khóe miệng nhếch ra một đạo ý cười, &quot;Có ý tứ, mặc
dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc.&quot;</p>
<p>Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại,
thậm chí là trợn mắt há hốc mồm.</p>
<p>Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.</p>
<p>Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.</p>
<p>Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác
ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.</p>
<p>Xích giai Võ hồn, Khống Hỏa Thú.</p>
<p>&quot;Cmn, đây là đang trêu chọc lão tử?&quot; Tiêu Dật suýt chút nữa chửi ầm lên.</p>
<p>Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.</p>
<p>Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.</p>
<p>Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó
rất có thể liền phổ thông dã thú đều đánh không lại.</p>
<p>Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.</p>
<p>Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm
đem nó nuốt.</p>
<p>Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều
có thể một cước đem nó đá bay.</p>
<p>&quot;Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước
kia lúc nào cũng bị người phế vật phế vật mắng lấy.&quot; Tiêu Dật bó tay rồi.</p>
<p>Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất
Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ
gia súc Võ hồn còn muốn không bằng.</p>
<p>Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất
định lực lượng tăng phúc.</p>
<p>Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.</p>
<p>Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn
tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.</p>
<p>Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói,
so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa
đều ngại vướng bận.</p>
<p>Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ
có yếu nhất Phàm cảnh nhất trọng.</p>
<p>Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ
hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu
dụng Võ hồn.</p>
<p>Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.</p>
<p>Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc
ức hiếp, bị tất cả mọi người chỗ xem thường.</p>
<p>Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.</p>
<p>&quot;Được rồi, núi dựa núi lở, dựa vào người người ngã.&quot; Tiêu Dật xóa đi trong
lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, &quot;Dựa vào ta một thân Hình Ý
Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông
ra thuộc về chính ta một mảnh bầu trời.&quot;</p>
<p>Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại
nhìn thể nội Võ hồn liếc mắt.</p>
<p>Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.</p>
<p>&quot;Ừm?&quot; Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.</p>
<p>Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa
Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.</p>
<p>Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn
nữa còn là màu tím sậm.</p>
<p>&quot;Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn,
hơn nữa còn là màu tím Võ hồn.&quot; Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.</p>
<p>Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử
vong kẻ cầm đầu.</p>
<p>Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh
này Băng Loan Kiếm.</p>
<p>&quot;Tại sao có thể như vậy?&quot; Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi
mà không rõ.</p>
<p>Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng
điều tra cái này di vật văn hoá.</p>
<p>Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả
Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.</p>
<p>Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều
không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.</p>
<p>Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều
mạng tranh đoạt bảo vật.</p>
<p>Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi
thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.</p>
<p>&quot;Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên
xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể
thiếu ngươi công lao.&quot; Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng
khẳng định.</p>
<p>&quot;Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc
chậc.&quot; Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.</p>', null, 1, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 2', 'chuong-2', N'<p>Song sinh Võ hồn, tại Viêm Long đại lục thuộc về truyền thuyết. Chỉ nghe nói
qua tồn tại, lại chưa từng chân chính có người gặp qua.</p>
<p>Đến nỗi màu tím Võ hồn, đó cũng là hiếm có tới cực điểm đồ vật.</p>
<p>Cho dù là trong Tiêu gia trưởng lão, cũng phần lớn là Hoàng giai Võ hồn thôi.</p>
<p>Có thể nắm giữ màu lam Võ hồn, đã là toàn bộ đại lục cũng có tên thiên tài
võ giả, chớ nói chi là cao cấp nhất màu tím Võ hồn.</p>
<p>&quot;Thử một chút hiệu quả làm sao.&quot; Tiêu Dật thầm suy nghĩ nghĩ.</p>
<p>Bỗng nhiên, ngoài cửa phòng truyền đến một trận nhẹ nhàng tiếng bước chân.</p>
<p>&quot;Ừm?&quot; Tiêu Dật lỗ tai khẽ động, làm một cái sát thủ, đối với hoàn cảnh chung
quanh biến hóa cực kì mẫn cảm.</p>
<p>&quot;Có người tới.&quot; Tiêu Dật lập tức thu lại nghĩ thử một lần Võ hồn ý nghĩ, nằm
trên giường tốt, cũng chợp mắt.</p>
<p>Nếu như người tới là địch nhân, hắn liền có thể để cho địch nhân buông xuống
cảnh giác, chính mình có thể có đầy đủ thời gian cùng cơ hội đối phó địch
nhân.</p>
<p>Một tiếng cọt kẹt, cửa phòng bị mở ra.</p>
<p>Tiêu Dật dùng dư quang liếc qua, đi vào là một nữ tử.</p>
<p>Nữ tử một thân áo vải, đưa lưng về phía, cũng tiện tay đóng kỹ môn.</p>
<p>Không thấy được nữ tử hình dạng, nhưng nhìn bóng lưng này, nhu nhược kia thân
thể, nhẹ nhàng bước ngọc, chắc là cái mỹ nhân.</p>
<p>&quot;Ai, Tiêu Dật thiếu gia lúc nào có thể tỉnh đâu.&quot;</p>
<p>Nữ tử thanh âm rất êm tai, như như chuông bạc trong trẻo êm tai, trong thanh
âm tràn ngập lo lắng cùng quan tâm.</p>
<p>Nữ tử trong tay bưng lấy một bát dược, đi tới bên giường.</p>
<p>Tiêu Dật ý thức được nữ tử cũng không phải là địch nhân, có chút mở mắt.</p>
<p>Cơ hồ là hắn mở to mắt trong nháy mắt, ánh mắt trợn thật lớn.</p>
<p>&quot;Cmn, ở đâu ra người quái dị, dám can đảm dọa bản thiếu gia.&quot; Tiêu Dật nhìn
xem nữ tử xấu xí hình dạng, giật nảy mình, suýt chút nữa nhịn không được một
quyền đập tới.</p>
<p>Nguyên lai nữ tử này cũng không phải là cái gì mỹ nhân, ngược lại hết sức phổ
thông, thậm chí có chút xấu, trên mặt xanh một miếng đỏ một khối, nhìn xem
quái dọa người.</p>
<p>&quot;A.&quot; Nữ tử kinh hô một tiếng, vô ý thức muốn tách rời khỏi.</p>
<p>Nhưng nàng trong tay chính bưng lấy dược, nàng lập tức phản ứng lại, không
tiếp tục tránh, vẻn vẹn nghiêng đi mặt, nhút nhát nhắm mắt lại.</p>
<p>Tiêu Dật phản ứng cũng rất nhanh, lập tức thu lại nắm đấm.</p>
<p>Hắn không phải cái thích trông mặt mà bắt hình dong người, cũng sẽ không đi kỳ
thị người khác.</p>
<p>Chỉ có điều vừa rồi ý nghĩ trong lòng cùng nữ tử hình dạng có cực lớn chênh
lệch, này mới khiến hắn hơi kém đánh ra một quyền thôi.</p>
<p>&quot;Vì cái gì không né tránh?&quot; Tiêu Dật thu hồi nắm đấm, trầm giọng hỏi.</p>
<p>Nữ tử thấy Tiêu Dật không có đánh nàng, lúc này mới mở mắt, trên mặt như cũ
mang theo vẻ sợ hãi.</p>
<p>&quot;Đây là Tiêu Dật thiếu gia cứu mạng dược, không thể làm đổ, Tiêu Dật thiếu gia
phải nhanh lên một chút tốt lên.&quot; Nữ tử sợ hãi nói.</p>
<p>&quot;Ngươi liền không sợ bị ta đánh bị thương?&quot; Tiêu Dật cau mày nói.</p>
<p>Nữ tử lắc đầu, nói, &quot;Y Y mệnh là thiếu gia, thiếu gia đánh chính là.&quot;</p>
<p>&quot;Ngươi&quot; Tiêu Dật sững sờ, lúc này, hắn thấy rõ nữ tử khuôn mặt.</p>
<p>Kỳ thật, nàng chỉ là thiếu nữ, ngũ quan cùng mặt dài đến vô cùng tinh xảo,
tinh tế đi xem lời nói, vô cùng nén lòng mà nhìn.</p>
<p>Nếu như không phải dung mạo của nàng xanh xao vàng vọt, trên mặt lại xanh một
miếng, đỏ một khối đến, tuyệt đối là cái tuyệt sắc mỹ nữ.</p>
<p>&quot;A.&quot; Thiếu nữ bỗng nhiên kịp phản ứng, nói, &quot;Tiêu Dật thiếu gia ngươi cuối
cùng tỉnh rồi, ta phải vội vàng nói cho tam trưởng lão đi.&quot;</p>
<p>Dứt lời, thiếu nữ cẩn thận từng li từng tí cầm chén thuốc để lên bàn, chạy rời
đi.</p>
<p>Tiêu Dật thông qua trong đầu nhớ được biết.</p>
<p>Thiếu nữ này tên là Y Y, năm nay 15 tuổi.</p>
<p>Thuở nhỏ phụ mẫu đều mất, Tiêu Dật phụ thân nhìn nàng đáng thương, liền mua về
cho Tiêu Dật làm thiếp thân nha hoàn.</p>
<p>Khi còn bé Y Y dáng dấp vô cùng đáng yêu, tính cách nhu thuận hiểu chuyện.</p>
<p>Chỉ có điều Tiêu Dật là cái điển hình phế vật, mỗi lần tại bên ngoài bị khi
dễ, liền sẽ trở lại đem khí vung đến Y Y trên đầu.</p>
<p>Y Y thường xuyên chịu đến hắn ngược đãi, ăn không đủ no, mặc không đủ ấm
xuống, tự nhiên biến đến xanh xao vàng vọt.</p>
<p>Mà lại, ngay tại Tiêu Dật bị đẩy tới vách núi một ngày trước, Tiêu Dật còn
đánh đập nàng một hồi, cho nên nàng trên mặt bây giờ còn xanh một miếng, đỏ
một khối.</p>
<p>&quot;Ai.&quot; Tiêu Dật thở dài, đối với mình vừa rồi hành vi cảm thấy hối hận.</p>
<p>&quot;Lão tử một thế anh danh, làm sao lại bám thân đến như thế cái phế vật con
em trên thân.&quot; Tiêu Dật lần đầu đối với thân thể này cảm thấy chán ghét.</p>
<p>Không bao lâu, một người trung niên liền vô cùng lo lắng đi tới căn phòng.</p>
<p>Tiêu gia tam trưởng lão Tiêu Trọng, đã từng là Tiêu Dật phụ thân tâm phúc, bây
giờ đảm nhiệm đại diện gia chủ chức vụ.</p>
<p>Tuổi nhỏ Tiêu Dật, phụ thân mất tích bí ẩn về sau, chính là do vị này tam
trưởng lão nuôi dưỡng lớn lên.</p>
<p>&quot;Tỉnh rồi, thật tỉnh rồi, quá tốt rồi.&quot; Tiêu Trọng gấp đến độ nói năng lộn
xộn, trên mặt ngăn không được ý mừng.</p>
<p>&quot;Nếu là Dật nhi ngươi có cái gì không hay xảy ra, ta ngày sau làm sao cùng gia
chủ bàn giao a.&quot; Tiêu Trọng ngồi xuống bên giường, nghiêm túc đánh giá Tiêu
Dật.</p>
<p>Khi thấy Tiêu Dật khí tức ổn định, không có trở ngại lúc, một mực nỗi lòng lo
lắng mới buông xuống.</p>
<p>Tiêu Dật phụ thân đã mất tích nhiều năm, nhưng Tiêu Trọng từ đầu đến cuối
chiếu cố Tiêu Dật.</p>
<p>Lúc này, Tiêu Trọng dường như nhớ ra cái gì đó, trên mặt ý mừng bỗng nhiên
biến thành vẻ u sầu.</p>
<p>&quot;Ai, Dật nhi, ngươi làm sao lại không cẩn thận như vậy đây, ở sau núi đi
lung tung, cũng có thể rớt xuống dưới vách núi đi. Ai, ngươi hôn mê những ngày
gần đây, trong gia tộc &quot;</p>
<p>Tiêu Trọng vẻ mặt buồn thiu, muốn nói gì, nhưng nhìn xem Tiêu Dật bộ dáng,
nhưng lại bỗng nhiên dừng lại lời nói.</p>
<p>&quot;Được rồi, ngươi vừa mới tỉnh lại, hay là nghỉ ngơi nhiều một chút đi, các
trưởng lão khác vẫn chờ ta trở về chủ trì gia tộc hội nghị.&quot;</p>
<p>Dứt lời, Tiêu Trọng từ trong ngực lấy ra một túi đồ vật, đặt ở mặt bàn về sau,
thật sâu nhìn Tiêu Dật liếc mắt, mới chậm rãi rời đi.</p>
<p>Tiêu Dật rõ ràng chú ý tới, Tiêu Trọng ánh mắt hết sức phức tạp, có quan tâm,
có từ ái, nhưng càng nhiều lại là ưu sầu.</p>
<p>Đợi Tiêu Trọng rời đi, Tiêu Dật Tài đối với một bên Y Y hỏi, &quot;Y Y, chuyện gì
xảy ra?&quot;</p>
<p>Y Y là theo Tiêu Trọng đồng thời trở về, lúc này chính tỉ mỉ thổi dược, dược
quá nóng, thổi ấm, tốt cho Tiêu Dật dùng.</p>
<p>Nghe được Tiêu Dật tra hỏi, Y Y ngẩng đầu lên, biểu lộ có chút do dự, ấp úng.</p>
<p>&quot;Đến cùng thế nào.&quot; Tiêu Dật nhíu mày hỏi.</p>
<p>Y Y do dự, thấp giọng quan tâm nói, &quot;Thiếu gia ngươi vừa mới tỉnh lại, thân
thể lại yếu ớt, chờ một lúc uống thuốc nghỉ ngơi đi. Trong gia tộc chuyện, tam
trưởng lão sẽ xử lý tốt.&quot;</p>
<p>&quot;Nói đi.&quot; Tiêu Dật nói.</p>
<p>&quot;Cái này &quot;Y Y cúi đầu xuống, khó xử nắm góc áo của mình.</p>
<p>&quot;Nói!&quot; Tiêu Dật quát lớn một câu.</p>
<p>Y Y giật cả mình, không lay chuyển được Tiêu Dật, chỉ có thể chi tiết nói,
&quot;Thiếu gia ngươi hôn mê mấy ngày nay, Kiều nhi tiểu thư đến đây thăm hỏi, cũng
lui hôn sự của ngươi.&quot;</p>
<p>Y Y sợ Tiêu Dật không chịu nổi đả kích, vội vàng bồi thêm một câu, &quot;Thiếu gia
ngài hôn mê mấy ngày, tất cả mọi người cảm thấy ngươi không cứu nổi, Kiều nhi
tiểu thư cũng là vì hạnh phúc của mình suy nghĩ thôi. Bây giờ ngươi đã tỉnh,
chỉ cần nói cho Kiều nhi tiểu thư, nàng nhất định sẽ thay đổi chủ ý.&quot;</p>
<p>&quot;A.&quot; Tiêu Dật cười cười, thản nhiên nói, &quot;Ta tưởng rằng chuyện gì, nàng mới sẽ
không thay đổi chủ ý, mà lại, loại kia nữ nhân ác độc, lui cưới mới tốt.&quot;</p>
<p>&quot;A?&quot; Y Y lấy làm kinh hãi, thầm nghĩ, thiếu gia không phải là ném hỏng đầu óc
đi? Kiều nhi tiểu thư thế nhưng là toàn thành xinh đẹp nhất nữ tử, Mộ Dung gia
thiên kim tiểu thư a, nam nhân kia không động lòng.</p>
<p>Tử Vân thành ba gia tộc lớn, Tiêu gia, Mộ Dung gia, Giang gia.</p>
<p>&quot;Còn có chuyện khác sao?&quot; Tiêu Dật tiếp tục hỏi.</p>
<p>Y Y trả lời, &quot;Còn có trong gia tộc các trưởng lão, nói muốn phế ngài thiếu gia
chủ vị trí.&quot;</p>
<p>Tiêu Dật giật mình.</p>
<p>Trước kia Tiêu Dật, thiên phú thấp kém, tính cách uất ức, căn bản không xứng
làm thiếu gia tộc, sở hữu trưởng lão đều xem thường hắn, đối với hắn rất là
không vừa lòng.</p>
<p>Lần này, chính mình đến hậu sơn đi lung tung cũng có thể dẫn đầu xuống sườn
núi, quả thực là trong phế vật cực phẩm, truyền đi, làm cho cả Tiêu gia hổ
thẹn.</p>
<p>Các trưởng lão đương nhiên sẽ không lại để cho hắn tại thiếu gia chủ trên vị
trí ngồi xuống.</p>
<p>&quot;Cái gọi là không có lửa làm sao có khói, việc này khẳng định có người tại
thúc đẩy đi.&quot; Tiêu Dật cười lạnh một tiếng.</p>
<p>Hắn biết coi như mình nói ra sự thật, chính mình là bị Tiêu Nhược Hàn đẩy tới
vách núi, Tiêu gia cũng sẽ không có bất luận kẻ nào tin tưởng.</p>
<p>Dù sao, một cái là phế vật, gia tộc sỉ nhục.</p>
<p>Một cái là gia tộc thiên tài, tương lai tiền đồ tốt đẹp.</p>
<p>&quot;Thiếu gia, dược có thể uống.&quot; Y Y đem dược cầm lấy, chuẩn bị đút Tiêu Dật
dùng.</p>
<p>Đúng vào lúc này, ngoài cửa vang lên một trận tiếng bước chân dồn dập cùng
tiếng ồn ào.</p>
<p>&quot;Tiêu Dật tên phế vật kia có đủ mạng lớn, từ sau núi quẳng xuống đều không
chết được.&quot;</p>
<p>&quot;Không chết được vừa vặn, tên phế vật kia chết rồi, chúng ta về sau cũng
không có nhiều như vậy việc vui.&quot;</p>
<p>&quot; &quot;</p>
<p>Từng đợt trào phúng lại không khinh thường lời nói truyền đến.</p>
<p>&quot;Bành&quot; một tiếng, cửa phòng bị thô bạo đá văng ra, hai người thiếu niên đi
đến.</p>
<p>&quot;Tiêu Kiệt, Tiêu Thạch.&quot; Tiêu Dật nhíu mày.</p>
<p>Tiêu Kiệt, Thất trưởng lão chi tử; Tiêu Thạch, Bát trưởng lão chi tử.</p>
<p>Tính toán ra, hai người hay là Tiêu Dật biểu ca.</p>
<p>Bất quá, bọn hắn nhưng chưa từng làm Tiêu Dật là em họ, khắp nơi ức hiếp hắn,
đoạt tài nguyên tu luyện của hắn.</p>
<p>Trước kia, nhẹ thì chửi bới không ngớt, khắp nơi trêu cợt; nặng thì đánh một
trận, đem Tiêu Dật đánh cho vết thương chằng chịt.</p>
<p>&quot;Quả nhiên, tam trưởng lão đem tài nguyên tu luyện cho phế vật này.&quot; Tiêu Kiệt
liếc nhìn trên mặt bàn cái kia túi đồ vật.</p>
<p>Tiêu gia con em, mỗi tháng đều có thể đạt được gia tộc cho ngân lượng cùng đan
dược, lấy trợ đám tử đệ càng tốt hơn tu luyện.</p>
<p>&quot;Lập tức cút ra ngoài cho ta.&quot; Tiêu Dật lạnh lùng nhìn chằm chằm hai người.</p>
<p>&quot;Nha a, tiểu phế vật, dài tính tình.&quot;</p>
<p>&quot;Ha ha, oắt con vô dụng này sẽ không phải là quẳng xuống phía sau núi, đem đầu
óc ném hỏng đi.&quot;</p>
<p>Tiêu Kiệt cùng Tiêu Thạch khinh thường trào phúng, vênh váo hung hăng hướng
Tiêu Dật đi đến.</p>
<p>Bọn hắn đã thành thói quen cướp đoạt Tiêu Dật tài nguyên tu luyện, quen thuộc
bắt nạt Lăng Tiêu dật.</p>
<p>&quot;Hai người các ngươi đại bại hoại, đừng nghĩ tổn thương Tiêu Dật thiếu gia.&quot; Y
Y một cái cản tại bên giường.</p>
<p>Y Y tiện tay cầm căn bên giường cây gậy, lung tung vung vẫy, ý đồ dọa lùi Tiêu
Kiệt cùng Tiêu Thạch, cũng bảo hộ ''Nhỏ yếu'' Tiêu Dật.</p>', null, 2, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 3', 'chuong-3', N'<p>Tiêu Kiệt, Võ hồn vì Hỏa Thiêu Đằng, Chanh giai hệ thực vật Võ hồn, Phàm cảnh
tứ trọng tu vi.</p>
<p>Tiêu Thạch, Võ hồn vì Hỏa Lang, Chanh giai Thú võ hồn. Tuy chỉ có Phàm cảnh
tam trọng tu vi, nhưng Hỏa Lang chính là thực lực không tệ yêu thú, cho nên
chiến lực của hắn không chút thua kém tại Phàm cảnh tứ trọng Tiêu Kiệt.</p>
<p>Hai người đều là võ giả, nhưng Y Y chỉ là người bình thường, liền Phàm cảnh
nhất trọng cũng không sánh nổi.</p>
<p>Nàng thân thể gầy yếu kia, tại Tiêu Kiệt Tiêu Thạch trước mặt hai người quá
mức không có ý nghĩa.</p>
<p>Nàng cái kia lung tung vung vẩy cây gậy càng là có vẻ hơi buồn cười.</p>
<p>''Đùng'' một tiếng, Tiêu Kiệt nhẹ nhõm nắm chặt cây gậy.</p>
<p>&quot;Người quái dị, thức thời liền cút ngay cho ta.&quot;</p>
<p>&quot;Móa nó, một cái hèn mọn thị nữ thôi, mỗi lần đều tổ ba ngăn bốn, cẩn thận đem
ngươi cũng cùng nhau đánh.&quot;</p>
<p>Y Y hay là nắm thật chặt cây gậy, cắn răng nói, &quot;Y Y mệnh là Tiêu Dật thiếu
gia, ta sẽ không để cho các ngươi tổn thương thiếu gia.&quot;</p>
<p>&quot;Hừ, không biết sống chết.&quot; Tiêu Kiệt đoạt lấy cây gậy, đều xem trọng trọng
địa hướng Y Y cánh tay đập tới.</p>
<p>Cái này nếu là đập trúng, Y Y cánh tay gãy xương cũng có thể.</p>
<p>Dĩ vãng, mỗi lần Tiêu Dật bị sỉ nhục, Y Y đều là như thế cản ở trước mặt hắn.</p>
<p>Mà lại, nàng mỗi lần ngăn cản đều tốn công vô ích, cuối cùng đều là uất ức
Tiêu Dật bị cướp đi tài nguyên tu luyện. Sau đó, Tiêu Dật sẽ đem khí vung đến
trên người nàng, đánh chửi một hồi.</p>
<p>&quot;Y Y, ngươi nhớ kỹ, ngươi chỉ là cái hèn mọn thị nữ, bản thiếu gia chuyện
không cần ngươi quan tâm.&quot;</p>
<p>Tiêu Dật mỗi lần đều là tức hổn hển đánh chửi Y Y.</p>
<p>Y Y đã đã quen, nhưng chưa từng có dù là một lần oán trách qua Tiêu Dật.</p>
<p>Lần này cũng giống vậy, nhìn xem sắp đập tới cây gậy, sợ hãi nhắm mắt lại,
thân thể nhưng không có xê dịch nửa phần.</p>
<p>''Đùng'' một tiếng.</p>
<p>Y Y coi là cây gậy đã đánh vào trên bả vai mình, có thể nàng nhưng nghi ngờ
với mình không có cảm giác được đau đớn.</p>
<p>Làm nàng kỳ quái khi mở mắt ra, trong suốt hai con ngươi trợn tròn lên.</p>
<p>Bởi vì, giờ phút này Tiêu Dật vậy mà lần đầu tiên đứng ở trước mặt nàng,
cùng sử dụng bàn tay tiếp nhận cây gậy.</p>
<p>&quot;Thiếu thiếu gia&quot; Y Y cảm thấy không thể tưởng tượng nổi.</p>
<p>Dĩ vãng Tiêu Dật là cái phế vật; nhưng thời khắc này Tiêu Dật, chính là Địa
Cầu một đời Hình Ý Quyền Tông sư, càng là hoành hành thiên hạ vua sát thủ, sao
lại để Y Y bị thương.</p>
<p>Tiêu Dật không có trả lời Y Y, lạnh lùng nhìn chằm chằm Tiêu Kiệt cùng Tiêu
Thạch hai người, &quot;Thị nữ của ta, khi nào đến phiên các ngươi đi đánh!&quot;</p>
<p>Tiêu Kiệt Tiêu Thạch ngẩn người, trong ấn tượng, Tiêu Dật dám can đảm phản
kháng còn là lần đầu tiên.</p>
<p>&quot;Nha a, tiểu phế vật quả nhiên dài tính tình.&quot;</p>
<p>&quot;Nói với hắn nói nhảm làm cái gì, không nghe lời liền đánh tới hắn nghe lời.&quot;</p>
<p>Tiêu Kiệt Tiêu Thạch cười âm hiểm một tiếng.</p>
<p>&quot;Tiểu phế vật, ta nhìn ngươi là quên bị Hỏa Thiêu Đằng dạy bảo mùi vị.&quot; Tiêu
Kiệt cười lạnh một tiếng.</p>
<p>Tiêu Kiệt trong tay đột nhiên xuất hiện một đầu màu đỏ dây leo, chừng dài 2m,
trên dây leo lan tràn từng tia từng tia hỏa diễm, lốp bốp.</p>
<p>&quot;Hỏa Thiêu Đằng, đi.&quot;</p>
<p>Tiêu Kiệt hơi vung tay cánh tay, Hỏa Thiêu Đằng như có linh tính hướng Tiêu
Dật đánh tới.</p>
<p>Tiêu Dật không sợ chút nào, luận tu vi, hắn chỉ là Phàm cảnh nhất trọng, còn
kém rất rất xa Tiêu Kiệt, nhưng luận chiến đấu kinh nghiệm, 100 cái Tiêu Kiệt
cũng không sánh nổi hắn.</p>
<p>Tiêu Dật bỗng nhiên tiến lên trước một bước, thân thể quỷ dị uốn éo, tránh
thoát Hỏa Thiêu Đằng, sau đó hai tay thành trảo, thẳng đến Tiêu Kiệt đầu mà
đi.</p>
<p>&quot;Tránh thoát, cái này sao có thể?&quot; Tiêu Kiệt lấy làm kinh hãi.</p>
<p>&quot;Hổ hình.&quot; Tiêu Dật quát lạnh một tiếng.</p>
<p>Tiêu Kiệt vừa định thu hồi Hỏa Thiêu Đằng phòng ngự, chợt nghe được một đạo
tiếng hổ gầm.</p>
<p>''Rống'', Tiêu Dật song trảo bên trên lại phát ra một tiếng như bách thú chi
Vương Chấn rít gào núi rừng địa hổ rống.</p>
<p>Tiêu Kiệt rùng mình một cái, trong nháy mắt này, hắn cảm giác chính mình đang
bị một cái hung mãnh dã thú để mắt tới, lúc nào cũng có thể sẽ mất mạng.</p>
<p>Một giây sau, Tiêu Kiệt bỗng nhiên bị Tiêu Dật đụng ngã.</p>
<p>Thoạt nhìn, Tiêu Kiệt giống như là bị một cái mãnh hổ đụng ngã.</p>
<p>&quot;Chuyện gì xảy ra, là ta hoa mắt sao?&quot; Một bên Tiêu Thạch nhíu mày, &quot;Tiêu Kiệt
chính là Phàm cảnh tứ trọng võ giả, làm sao lại bị tiểu phế vật đụng ngã.&quot;</p>
<p>Hổ hình, như mãnh hổ hạ sơn, vừa nhanh vừa mạnh, là Hình Ý Quyền bên trong lớn
nhất lực công kích một thức.</p>
<p>Lúc này, Tiêu Dật song trảo chụp lấy Tiêu Kiệt cái cổ, mà lại vừa lúc là cổ
họng bộ vị.</p>
<p>Chỉ cần hắn nguyện ý, chỉ cần nhẹ nhàng động động ngón tay, liền có thể hủy
Tiêu Kiệt cái cổ, muốn Tiêu Kiệt mệnh.</p>
<p>Đừng quên, Tiêu Dật ngoại trừ là một đời Hình Ý Quyền Tông sư bên ngoài, càng
là cái cường đại sát thủ, tinh thông các loại kỹ nghệ giết người.</p>
<p>&quot;Tiêu Thạch, thất thần làm gì, nhanh cứu ta.&quot; Tiêu Kiệt bị hù ngã, không nghĩ
chính mình vì cái gì không phải là đối thủ của Tiêu Dật, lập tức hướng Tiêu
Thạch cầu cứu.</p>
<p>&quot;Tới.&quot; Tiêu Thạch lập tức kịp phản ứng.</p>
<p>&quot;Hỏa Lang, hiện.&quot; Tiêu Thạch hét lớn một tiếng.</p>
<p>Trên người hắn, bỗng nhiên xuất hiện một đầu Hỏa Lang hư ảnh.</p>
<p>Hỏa Lang, Chanh giai Võ hồn, có thể giao phó võ giả tốc độ cực nhanh cùng
hỏa diễm lực phá hoại.</p>
<p>&quot;Tiểu phế vật, đi chết đi.&quot;</p>
<p>Xem Tiêu Thạch động tác, đúng là quả thực dự định giết Tiêu Dật.</p>
<p>Cùng là Tiêu gia tộc nhân, lại ra tay tàn nhẫn, muốn lấy Tiêu Dật tính mệnh.</p>
<p>&quot;Hừ.&quot; Tiêu Dật sắc mặt lạnh lẽo, buông ra trói lại Tiêu Kiệt cái cổ hai tay.</p>
<p>&quot;Báo hình.&quot; Tiêu Dật động tác rất nhanh, như một đầu kiếm ăn nhanh báo, hoặc
là không ra tay, vừa ra tay liền đem con mồi thí tại dưới vuốt.</p>
<p>&quot;Thật nhanh.&quot; Tiêu Thạch mở to hai mắt nhìn, hắn vừa mới chuẩn bị phát động
công kích.</p>
<p>Tiêu Dật song trảo đã đi tới hắn trước bộ ngực, hung hăng một trảo, đem hắn
lồng ngực vạch ra một vết máu thật sâu.</p>
<p>Báo hình, như nhanh báo tập kích, nhanh như gió táp, nhanh như sấm sét,
chính là Hình Ý Quyền bên trong thích hợp nhất cự ly ngắn gần người bộc phát
tốc độ một thức.</p>
<p>Hình Ý Quyền, chính là một môn nội ngoại kiêm tu võ học.</p>
<p>Phân ngũ hành 12 thức, phách quyền, toản quyền, băng quyền, pháo quyền, hoành
quyền, hình rồng, hổ hình, ưng hình, hình rắn</p>
<p>Giữa lẫn nhau có thể lẫn nhau dung hợp hoặc là chia tách, giao ngang sai mặc
dù, vô cùng phức tạp, có thể diễn sinh ra trăm ngàn chủng đấu pháp, có thể
xưng bác đại tinh thâm.</p>
<p>Mà Tiêu Dật, xem như Hình Ý Quyền Tông sư, không chỉ có hoàn toàn hiểu được sở
hữu đấu pháp, càng đem hắn tinh luyện thành năm chủng quyền pháp.</p>
<p>Cái này theo trăm ngàn chủng đấu pháp bên trong diễn sinh đi ra năm loại, bị
Tiêu Dật ca tụng là hình ý ngũ tuyệt.</p>
<p>Phân biệt là hổ hình, báo hình, hình rắn, hạc hình, cùng với mạnh nhất thăng
long.</p>
<p>Dựa vào này ngũ tuyệt, hắn mới làm được ngang dọc Địa Cầu, khó gặp đối thủ.</p>
<p>Tuy chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, nhưng bằng mượn hình ý ngũ
tuyệt, hay là thoải mái mà đem Tiêu Kiệt cùng Tiêu Thạch đánh bại.</p>
<p>&quot;Ngươi muốn chết sao?&quot; Tiêu Dật song trảo xé ra, đem Tiêu Thạch trên lồng ngực
vết thương cắt đến lớn hơn.</p>
<p>Lập tức, ồ ồ máu tươi từ trên người Tiêu Thạch lưu lạc.</p>
<p>&quot;A a&quot; Tiêu Thạch kinh hô, nhìn xem trên lồng ngực không ngừng chảy ra máu
tươi, cảm thấy thân thể yếu ớt bên ngoài, còn có một loại đối tử vong sợ hãi.</p>
<p>&quot;Ta ta sẽ chết mất sao? A a &quot;</p>
<p>&quot;Ngậm miệng, đừng kêu đến theo giao xuân tựa như.&quot; Tiêu Dật trừng Tiêu Thạch
liếc mắt.</p>
<p>Một bên khác, Tiêu Kiệt nhìn xem thê thảm Tiêu Thạch, cũng toàn thân run rẩy.</p>
<p>Nói cho cùng, hai người này chẳng qua là hoa trong nhà kính, nơi nào thấy qua
bực này huyết tinh tình cảnh.</p>
<p>Một bên Y Y cũng là sắc mặt trắng bệch, bất quá càng nhiều lại là tại quan tâm
Tiêu Dật.</p>
<p>&quot;Hừ.&quot; Tiêu Dật thu hồi song trảo, một quyền đem Tiêu Thạch oanh tới mặt đất
Tiêu Kiệt bên cạnh.</p>
<p>&quot;Đừng đừng giết chúng ta.&quot; Tiêu Kiệt đã sớm dọa đến run chân, liền đứng lên
sức lực đều không có.</p>
<p>&quot;Nho nhỏ phế vật, không, Tiêu Dật, chúng ta là người cùng một cái gia tộc a.&quot;
Tiêu Thạch che lấy vết thương, cầu xin tha thứ.</p>
<p>Bọn hắn rõ ràng theo Tiêu Dật trong mắt nhìn thấy sát ý nồng nặc.</p>
<p>Thời khắc này, bọn hắn có thể cảm giác được, trước mặt Tiêu Dật hoàn toàn
không giống một cái phế vật, ngược lại giống một cái trong tay dính đầy máu
tươi đao phủ, để bọn hắn trong lòng rụt rè.</p>
<p>&quot;Đừng giết các ngươi?&quot; Tiêu Dật cười lạnh một tiếng, nói, &quot;Những năm gần đây,
các ngươi cướp ta tài nguyên tu luyện, bây giờ còn nhớ ta bỏ qua cho các
ngươi?&quot;</p>
<p>&quot;Không không phải a.&quot; Tiêu Kiệt run rẩy phản bác, &quot;Tiêu Dật, tính toán ra,
chúng ta thế nhưng là biểu ca của ngươi a, làm sao sẽ đoạt ngươi đồ vật đâu.
Trước kia chúng ta là vội vã tu luyện, hướng ngươi mượn một chút thôi.&quot;</p>
<p>&quot;Đúng đúng đúng, mượn, không phải đoạt.&quot; Tiêu Thạch cũng lập tức nói.</p>
<p>&quot;Tốt, mượn.&quot; Tiêu Dật gật gật đầu, nói, &quot;Như vậy những năm này mượn, cũng nên
trả lại đi.&quot;</p>
<p>&quot;Còn, chúng ta nhất định còn, chỉ cần ngươi thả chúng ta ra.&quot; Tiêu Kiệt cùng
Tiêu Thạch như được đại xá, lập tức nói.</p>
<p>&quot;Mỗi người 10,000 lượng, lập tức trả tiền.&quot; Tiêu Dật cười lạnh một tiếng.</p>
<p>&quot;10,000 lượng?&quot; Hai người mở to hai mắt nhìn.</p>
<p>&quot;Sao như thế nào nhiều như vậy.&quot; Tiêu Kiệt giật nảy mình.</p>
<p>&quot;Đúng a, mỗi tháng ngân lượng chỉ có 20 lượng, đan dược đại khái là giá trị 30
lượng trái phải, một cái tháng cao nữa là cũng liền 50 lượng.&quot;</p>
<p>&quot;Một năm 600 lượng &quot;</p>
<p>Tiêu Dật hung hăng lườm bọn họ một cái, ngắt lời nói, &quot;Tất nhiên các ngươi là
mượn, cái kia không phải thu tiền lãi? Lãi mẹ đẻ lãi con các ngươi chưa từng
nghe qua? Các ngươi theo ta 8 tuổi bắt đầu cướp đồ vật của ta, đến bây giờ
trọn vẹn 8 năm.&quot;</p>
<p>&quot;Mới mỗi người 10,000 lượng, ta xem như tiện nghi các ngươi.&quot; Tiêu Dật cười
lạnh nói.</p>
<p>&quot;Trán cái này&quot; Tiêu Thạch cùng Tiêu Kiệt âm thầm mắng to, rõ ràng tại lừa gạt
chúng ta, như thế nào cảm giác giống chúng ta chiếm chỗ tốt.</p>
<p>&quot;Thế nhưng là, chúng ta không bỏ ra nổi 10,000 lượng a.&quot; Tiêu Kiệt cùng Tiêu
Thạch trong lòng đánh lấy tính toán, nghĩ thầm chính mình không bỏ ra nổi
nhiều tiền như vậy, Tiêu Dật cũng bắt bọn hắn không có cách nào.</p>
<p>&quot;Không bỏ ra nổi tiền, vậy liền đi chết đi.&quot; Tiêu Dật song chưởng hiện lên
trảo, mặt lộ vô cùng sát ý, trực tiếp hướng bọn họ chỗ hiểm đánh tới.</p>
<p>&quot;Không không muốn &quot;</p>
<p>Tiêu Kiệt Tiêu Thạch nhìn xem Tiêu Dật đó là máu ánh mắt, biết Tiêu Dật không
có nói đùa, lập tức cầu xin tha thứ.</p>
<p>&quot;Trước thiếu được không?&quot;</p>
<p>&quot;Có thể.&quot; Tiêu Dật thu hồi thủ chưởng, cười nói, &quot;Y Y, lấy giấy cùng bút đến,
miễn cho hai người này quỵt nợ.&quot;</p>
<p>&quot;Vâng, Tiêu Dật thiếu gia.&quot; Y Y nhẹ gật đầu, lập tức chuẩn bị giấy cùng bút.</p>
<p>Tiêu Kiệt cùng Tiêu Thạch không cam lòng viết xuống ghi nợ đơn.</p>
<p>Tiêu Dật cầm lấy ghi nợ đơn, nhìn xem hai người đánh cho ngón tay sờ, thỏa mãn
nhẹ gật đầu.</p>
<p>&quot;Cút đi.&quot; Tiêu Dật nói, &quot;Ta nhắc nhở các ngươi, giấy tờ đã viết xuống, thiếu
nợ thì trả tiền, rất công bằng, ngươi chính là tìm gia tộc trưởng lão cũng vô
dụng.&quot;</p>
<p>&quot;Nhớ cho kĩ, mau chóng trù đủ tiền. Ta mặc kệ các ngươi trộm cũng tốt, đoạt
cũng được, trù không đủ tiền, sẽ chờ ta muốn mạng của các ngươi đi.&quot; Tiêu Dật
lạnh lùng giao cho một câu, để cho hai người rời đi.</p>
<p>Kỳ thật, từ vừa mới bắt đầu Tiêu Dật không có ý định giết bọn hắn, chẳng qua
là vì để cho bọn hắn trả tiền, chính mình có thể đạt được càng nhiều ưu việt
thôi.</p>
<p>Theo trong trí nhớ biết được, võ giả tu luyện, thế nhưng là một hạng cực kỳ
hao phí tài nguyên chuyện. Tiền càng nhiều, có thể được nhiều tài nguyên càng
phong phú, tu luyện mới thoải mái hơn, cũng càng nhanh.</p>
<p>Tiêu Kiệt Tiêu Thạch rời đi về sau, tại Tiêu Dật ngoài sân lượn quanh cái
vòng, cuối cùng ở trước mặt một tên thiếu niên ngừng lại.</p>
<p>Thiếu niên dáng dấp phong thần tuấn lãng, nhưng hai đầu lông mày lộ ra một cỗ
hung ác nham hiểm băng lãnh.</p>
<p>&quot;Nhược Hàn biểu ca, chúng ta thất bại, cái kia tiểu phế vật không biết chuyện
gì xảy ra biến đến lợi hại như vậy &quot;</p>
<p>Tiêu Kiệt Tiêu Thạch đại khái nói chút chuyện, nhưng không có đem chính mình
viết xuống ghi nợ chuyện đơn giản nói ra.</p>
<p>Không có ai biết, trong góc, Tiêu Dật chính lạnh lùng nhìn chằm chằm ba người
này.</p>
<p>Lấy hắn giấu kín bản lãnh, trừ phi có người đi đến trước mặt hắn, nếu không
thì, tuyệt đối không phát hiện được hắn.</p>
<p>Hắn đã sớm đoán được, hôm nay Tiêu Kiệt cùng Tiêu Thạch đến có chút không bình
thường, cho nên tại hai người bọn họ đi về sau, hắn vụng trộm theo sau.</p>
<p>&quot;Quả nhiên, lại là gia hỏa này làm quỷ.&quot; Tiêu Dật trong lòng cười lạnh.</p>
<p>&quot;Tốt nhất đừng đến chọc ta, nếu không thì ta không ngại trước thời hạn đưa
ngươi xuống Địa Ngục.&quot; Tiêu Dật nỉ non một tiếng, sau đó rời đi nơi hẻo lánh.</p>
<p>Từ đầu đến cuối, Tiêu Nhược Hàn ba người cũng không phát hiện hắn tồn tại.</p>', null, 3, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 4', 'chuong-4', N'<p>Vừa trở lại căn phòng.</p>
<p>&quot;Tê&quot;, Tiêu Dật hút miệng khí lạnh, cắn răng.</p>
<p>&quot;Thiếu gia ngươi thế nào?&quot; Y Y lo âu hỏi.</p>
<p>&quot;Không có gì.&quot; Tiêu Dật lắc đầu, trong lòng nhưng thầm mắng, &quot;Thân thể này
cũng quá yếu, mới dùng hai cái Hình Ý Quyền, vậy mà đã không chịu nổi.&quot;</p>
<p>Hình Ý Quyền, đặc biệt là hình ý ngũ tuyệt, nhìn như chiêu thức đơn giản,
nhưng kỳ thật mỗi một chiêu đều đối với thân thể có rất lớn yêu cầu.</p>
<p>Giống báo hình, trong thời gian ngắn đánh ra tính bùng nổ tốc độ, nhất định
phải dựa vào bắp thịt trong nháy mắt bộc phát.</p>
<p>Giống hình rắn, chính là trước đó Tiêu Dật tránh ra Hỏa Thiêu Đằng thân pháp,
như rắn cuồng loạn nhảy múa, thân như tơ mềm, nhanh chóng dời chuyển xê dịch,
đây đối với thân thể cường độ yêu cầu cực cao.</p>
<p>Nếu là lúc trước Tông sư Tiêu Dật, dù là chiến đấu ba ngày ba đêm đều không có
việc gì.</p>
<p>Nhưng bây giờ phế vật Tiêu Dật thân thể, nhưng căn bản không đạt được yêu cầu.</p>
<p>Trước đó Tiêu Dật nhìn như nhẹ nhõm đánh bại Tiêu Kiệt cùng Tiêu Thạch, nhưng
thật ra là một mực chịu đựng thân thể đau đớn thôi.</p>
<p>&quot;Ken két&quot; Tiêu Dật bẻ bẻ cổ, phát ra một trận ken két thanh âm.</p>
<p>Cái kia cỗ đau lưng cùng tứ chi không còn chút sức lực nào để hắn hết sức
không thoải mái.</p>
<p>Bộ thân thể này mặc dù có Phàm cảnh nhất trọng tu vi, kì thực chỉ là bé nhỏ tu
vi, so với người bình thường không mạnh hơn bao nhiêu.</p>
<p>&quot;A....&quot; Y Y bỗng nhiên gọi một tiếng, nói, &quot;Dược nhanh nguội, thiếu gia vội
vàng thừa dịp còn có sức lực còn lại, lập tức ăn vào đi.&quot;</p>
<p>Tiêu Dật tiếp nhận bát, nhìn xem bên trong một đoàn đen bên trong nước sơn đen
dược dịch, có chút nhấp một miếng.</p>
<p>Cơ hồ là chiếc kia dược dịch nuốt vào trong bụng trong nháy mắt, trên người
mình đau nhức lập tức làm dịu không nhỏ.</p>
<p>&quot;Dược lực thật là mạnh, đây cũng là tẩm bổ thân thể, ôn dưỡng kinh mạch thuốc
bổ đi.&quot; Tiêu Dật cười nói.</p>
<p>&quot;Ừm, đây là lục chuyển nuôi mạch dịch đây, là tam trưởng lão cầu đại trưởng
lão tự mình cho thiếu gia ngươi luyện chế, cực kì trân quý.&quot; Y Y nhẹ gật đầu.</p>
<p>Tiêu Dật ''Ân'' một tiếng, nhìn xem trong chén tràn đầy dược dịch, đem bát đẩy
lên Y Y trước mặt.</p>
<p>&quot;Ngươi uống.&quot; Tiêu Dật từ tốn nói một câu.</p>
<p>&quot;A?&quot; Y Y ngẩn người.</p>
<p>&quot;A cái gì a, để ngươi uống thì uống.&quot;</p>
<p>&quot;Không được.&quot; Y Y quật cường lắc đầu, nói, &quot;Đây là thiếu gia cứu mạng dược, ta
không thể &quot;</p>
<p>&quot;Ta sợ có độc, ngươi uống trước.&quot;</p>
<p>&quot;Thiếu gia yên tâm, Y Y trước thử một lần.&quot; Y Y lập tức uống một ngụm.</p>
<p>Nửa ngày, nàng mới nhớ tới, Tiêu Dật thiếu gia không phải mới vừa đã có chút
nhấp một miếng à.</p>
<p>&quot;Thiếu gia, ngươi &quot;</p>
<p>&quot;Uống xong đi, ta không quen uống người khác uống qua đồ vật. Ngươi nếu là
không muốn uống, rửa qua là được.&quot;</p>
<p>Dứt lời, Tiêu Dật tự mình đi tới một bên, bày ra một cái kỳ quái tạo hình, cổ
ngửa bên trên, Đan Tất độc lập, hai tay nâng bầu trời.</p>
<p>Hình ý ngũ tuyệt một trong, hạc hình.</p>
<p>Hạc hình, không có chiến đấu công dụng, nhưng có thể duyên niên hạc thọ,
dưỡng thần chữa thương.</p>
<p>Dĩ vãng ở Địa Cầu lúc, Tiêu Dật từng nhiều lần cửu tử nhất sinh, tuyệt cảnh
lật bàn, mỗi trận đại chiến về sau, thi triển hạc hình, phối hợp nội lực, liền
có thể nhẹ nhõm chữa trị thương thế.</p>
<p>Không thể không nói, Hình Ý Quyền quả nhiên là bác đại tinh thâm, hình ý ngũ
tuyệt càng là như vậy.</p>
<p>Muốn trị chính mình bây giờ thân thể mệt nhọc, dễ như trở bàn tay.</p>
<p>Một bên Y Y nhìn xem động tác kỳ quái Tiêu Dật, không dám đánh quấy nhiễu,
nàng nghi hoặc.</p>
<p>Nghi ngờ hôm nay thiếu gia nhà mình vì cái gì không đơn giản chỉ không có bị
khi dễ, ngược lại đánh bại Tiêu Kiệt Tiêu Thạch.</p>
<p>Nghi ngờ Tiêu Dật thiếu gia hôm nay vì cái gì không cầm nàng trút giận, không
đánh nàng.</p>
<p>Nghi ngờ Tiêu Dật thiếu gia vì sao hôm nay đối với nàng tốt như vậy, đem trân
quý dược dịch cho nàng uống.</p>
<p>Nàng có chút ngốc bẩm sinh, nhưng không phải đồ đần, tự nhiên rõ ràng Tiêu Dật
là cố ý muốn đem dược dịch cho nàng.</p>
<p>Nàng nghĩ mãi mà không rõ, nhưng không tiếp tục suy nghĩ nhiều, mà là nghe lời
đem sở hữu dược dịch uống sạch.</p>
<p>Uống đến một giọt không dư thừa.</p>
<p>Tiêu Dật cho đồ vật, nàng trân như trọng bảo.</p>
<p>Cơ hồ là mắt trần có thể thấy, Y Y nguyên bản sắc mặt tái nhợt thoáng khôi
phục một chút đỏ hồng; sắc mặt vết thương bầm tím cũng cởi một chút.</p>
<p>Một bên Tiêu Dật một bên duy trì lấy hạc hình, một bên liếc qua Y Y, nhàn nhạt
cười cười.</p>
<p>Mấy phút sau, Tiêu Dật thu hồi kỳ quái động tác, trên người đau nhức cùng
không còn chút sức lực nào đã biến mất, cả người tinh thần sảng khoái, toàn
thân có lực.</p>
<p>Hắn liếc nhìn Y Y, có chút đau lòng.</p>
<p>Y Y bộ mặt hình dáng rất tinh xảo, giống một cái tinh xảo tác phẩm nghệ thuật
hoàn mỹ, thỏa đáng mỹ nhân bại hoại. Nếu như không phải trường kỳ chịu đến
ngược đãi cùng đánh chửi, bây giờ tất nhiên là cái tuyệt thế mỹ nữ đi.</p>
<p>Cái kia nhu thuận hiểu chuyện tính cách, càng làm cho lòng người sinh trìu
mến.</p>
<p>&quot;Lần sau gặp nguy hiểm, không muốn lại cản ở trước mặt ta.&quot; Tiêu Dật nhớ tới
trước đó Y Y cử động, dặn dò một câu.</p>
<p>Nếu không phải là hắn kịp thời ra tay, lấy Y Y yếu đuối thân thể, lấy Tiêu
Kiệt cường độ, Y Y cánh tay tuyệt đối sẽ bị thương rất nghiêm trọng.</p>
<p>&quot;Y Y mệnh là thiếu gia, Y Y &quot;</p>
<p>&quot;Ta không cần bảo vệ của người khác.&quot; Tiêu Dật lãnh khốc ngắt lời nói.</p>
<p>&quot;Còn có, đừng nói mạng của ngươi là của ta, ta không quen trên người cõng mạng
của người khác.&quot;</p>
<p>Làm một cái sát thủ, Tiêu Dật cô độc đã quen, đối với mệnh, hắn chỉ có hai
khái niệm, hoặc là mạng của mình, hoặc là mạng của người khác; hoặc là có
thể giết mệnh, hoặc là cùng mình không liên hệ chút nào mệnh.</p>
<p>&quot;Ừm.&quot; Y Y khéo léo nhẹ gật đầu, nói, &quot;Y Y mệnh là thiếu gia, hết thảy theo
thiếu gia.&quot;</p>
<p>&quot;Ngươi&quot; Tiêu Dật nhíu mày.</p>
<p>&quot;Cái gì đều nghe ta đúng không?&quot; Tiêu Dật cười cười.</p>
<p>&quot;Ừm.&quot; Y Y gật đầu.</p>
<p>&quot;Được.&quot; Tiêu Dật nói, &quot;Hoặc là về sau đừng có lại để cho ta nghe được ''Mạng
của ngươi là ta'' loại này lời nói ngu xuẩn; hoặc là, ngươi ngay tại câu nói
này trước tăng thêm Tiêu Dật thiếu gia phong lưu phóng khoáng anh tuấn tiêu
sái ngọc thụ lâm phong tuyệt thế Vô Song soái đến bỏ đi, Y Y cái gì đều nghe
thiếu gia.&quot;</p>
<p>&quot;Rõ chưa?&quot; Tiêu Dật làm khó Y Y.</p>
<p>&quot;Ách.&quot; Y Y ngẩn người, nói, &quot;Y Y nghe thiếu gia, chỉ có điều, thiếu gia có thể
hay không nói lại lần nữa, nói chậm một chút, Y Y không nhớ được.&quot;</p>
<p>&quot;Không nhớ được là chuyện của ngươi.&quot; Tiêu Dật thản nhiên nói.</p>
<p>&quot;Thế nhưng là &quot;</p>
<p>&quot;Thế nào, không nghe ta sao?&quot; Tiêu Dật cau mày nói.</p>
<p>&quot;Nghe.&quot; Y Y nhẹ gật đầu, sau đó cúi đầu xuống, tựa hồ cảm thấy rất khó khăn.</p>
<p>Tiêu Dật không để ý đến nàng, tiện tay cầm lấy trước đó tam trưởng lão lưu lại
cái kia cái túi.</p>
<p>Trong túi, đúng là hắn tháng này tài nguyên tu luyện.</p>
<p>Tiêu Dật mở ra xem nhìn, bên trong có 20 lượng tán bạc, còn có một cái bình
ngọc.</p>
<p>Đem bình ngọc mở ra, lập tức một cỗ hương chu sa đập vào mặt.</p>
<p>Trong bình, có ba viên óng ánh sáng long lanh đan dược.</p>
<p>Đây là Thối Thể đan, Nhất phẩm đan dược.</p>
<p>Phàm cảnh võ giả chủ yếu vẫn là rèn luyện thân thể, đánh tốt cơ sở, ngày sau
mới có thể theo đuổi cảnh giới càng cao hơn.</p>
<p>Mà nói đến đan dược, liền không thể không nâng Luyện Dược sư.</p>
<p>Đây là một cái ở trong Viêm Long đại lục hiếm có mà tôn quý nghề nghiệp.</p>
<p>Muốn trở thành Luyện Dược sư, võ giả tư chất cùng thiên phú nhất định phải cực
cao, tiếp theo, đối với mặt khác các hạng yêu cầu cũng cực kì khắc nghiệt.</p>
<p>Có thể nói, 100 võ giả bên trong, cũng khó tìm đến một cái Luyện Dược sư.</p>
<p>Mà Luyện Dược sư tôn quý, ngay tại ở bọn hắn có thể luyện chế ra các loại
thần kỳ đan dược. Tu luyện đan dược, đan dược chữa thương, Luyện Thể đan dược
chờ một chút</p>
<p>Mà Luyện Dược sư, lại phân chín cấp bậc. Theo thấp đến cao, theo thứ tự là
Nhất phẩm Luyện Dược sư, Nhị phẩm Luyện Dược sư Cửu phẩm Luyện Dược sư.</p>
<p>Truyền thuyết, Cửu phẩm phía trên, còn có Hoàng phẩm Luyện Dược sư, chỉ có
điều không ai thấy qua chính là.</p>
<p>Tiêu gia đại trưởng lão, Tiêu Ly Hỏa, ngoại trừ là một vị cường đại Tiên Thiên
cảnh võ giả bên ngoài, còn là một vị tôn quý Tam phẩm Luyện Dược sư.</p>
<p>Trong gia tộc đan dược, phần lớn là hắn luyện chế mà thành.</p>
<p>Toàn bộ Tử Vân thành, cũng bất quá chỉ có ba cái Tam phẩm Luyện Dược sư thôi,
phân biệt tại Tiêu gia, Mộ Dung gia cùng Giang gia, có thể nghĩ Luyện Dược sư
hi hữu.</p>
<p>&quot;Thối Thể đan.&quot; Tiêu Dật cầm một hạt, nuốt vào trong miệng.</p>
<p>Đồng thời, phát động thể nội Khống Hỏa Thú Võ hồn.</p>
<p>Lập tức, đan dược hóa thành trận trận tinh thuần dược lực, du tẩu cùng toàn
thân, một bộ phận rèn luyện thân thể, một bộ phận bị thu nạp ở đan điền.</p>
<p>Chỉ có điều, tốc độ rất chậm.</p>
<p>Theo tốc độ này, tối thiểu muốn một ngày mới có thể hấp thu xong viên này Thối
Thể đan toàn bộ dược lực.</p>
<p>&quot;Khống Hỏa Thú Võ hồn, quả nhiên hết sức cặn bã.&quot; Tiêu Dật lắc đầu bất đắc dĩ.</p>
<p>Võ hồn đẳng cấp khác biệt, ngay tại ở hấp thu thiên địa linh khí, cùng với hấp
thu đan dược tốc độ. Loại tốc độ này, cũng liền tạo thành võ giả tu luyện
nhanh chậm, từ đó có thiên tài cùng phế vật.</p>
<p>Giống trong gia tộc Chanh giai Võ hồn con em, nửa ngày liền có thể hấp thu
xong Thối Thể đan.</p>
<p>... lướt qua đan dược, liền lấy thường ngày tu luyện tới nói. Chanh giai Võ
hồn có được, tu luyện 5 ngày, sánh được Xích giai Võ hồn 10 ngày.</p>
<p>Cả hai trọn vẹn kém gấp hai.</p>
<p>Tiêu Dật không chút do dự dừng lại Khống Hỏa Thú Võ hồn, ngược lại sử dụng
Băng Loan Kiếm Võ hồn.</p>
<p>Vèo, cơ hồ là tại Võ hồn phát động trong nháy mắt, Thối Thể đan chốc lát tan
rã, toàn bộ dược lực chuyển hóa làm chân khí trong cơ thể.</p>
<p>&quot;Thật là khủng khiếp tốc độ, thật không hổ là đỉnh phong nhất màu tím Võ hồn.&quot;
Tiêu Dật trong lòng lấy làm kinh hãi.</p>
<p>Bắt chước làm theo, Tiêu Dật đem mặt khác hai khỏa Thối Thể đan cũng nuốt mất.</p>
<p>Vài giây sau, thể nội ''Chạy nhảy'' một tiếng, một cỗ không hiểu lực lượng cường
đại bộc phát.</p>
<p>Đây là đột phá biểu tượng.</p>
<p>&quot;Đột phá đến Phàm cảnh nhị trọng.&quot; Tiêu Dật lộ ra ý cười.</p>
<p>Đồng thời, Tiêu Dật rõ ràng có thể cảm giác được, thể nội đan điền đã có thể
điều động ra chân khí.</p>
<p>Chân khí, là võ giả lực lượng trong cơ thể, võ giả phát động công kích, không
thể thiếu chân khí.</p>
<p>Tiêu Dật thử một chút, thôi động chân khí, lập tức, một cỗ tính bùng nổ lực
lượng ngưng tụ tại nắm đấm.</p>
<p>&quot;Thật mạnh, chân khí, sợ là so Địa Cầu nội lực muốn mạnh hơn một chút.&quot; Tiêu
Dật làm xuống phán đoán.</p>
<p>&quot;Đáng tiếc, dù sao chỉ có Phàm cảnh nhị trọng, chân khí số lượng quá ít.&quot; Tiêu
Dật lắc đầu.</p>
<p>Võ giả tu luyện, có chín tầng cảnh giới, theo thấp đến cao, theo thứ tự là
Phàm cảnh, Hậu thiên, Tiên thiên, Động Huyền, Phá Huyền, Địa Nguyên, thiên
nguyên, Địa Cực, Thiên Cực.</p>
<p>Truyền thuyết, đạp phá Thiên Cực về sau, chính là Võ Thần chi cảnh.</p>
<p>Võ Thần, chính là võ giả cảnh giới tối cao. Ngao du quá hư, khống chế thiên
địa, không gì làm không được.</p>
<p>Phất tay, vỡ vụn núi sông; đạp đạp chân, trời long đất lở; sức một người, đủ
để chúa tể hàng tỉ sinh linh.</p>
<p>Đương nhiên, Võ Thần khoảng cách bây giờ Tiêu Dật còn quá xa vời.</p>
<p>Cho dù là toàn bộ Tiêu gia, người mạnh nhất cũng bất quá là chín đại Tiên
Thiên cảnh trưởng lão.</p>
<p>Tiên thiên về sau, Động Huyền cảnh võ giả, đã có thể phi thiên độn địa, thủ
đoạn khó lường. Loại cấp bậc này võ giả, gần đây thần long thấy đầu mà không
thấy đuôi, toàn bộ Tử Vân thành đều không tồn tại.</p>
<p>&quot;Bây giờ nghĩ nhiều như vậy cũng vô dụng, hay là chăm chỉ tu luyện đi.&quot; Tiêu
Dật lắc đầu, vung đi trong lòng tạp niệm.</p>
<p>Tại màu tím Võ hồn Băng Loan Kiếm phát động xuống, thiên địa linh khí như dòng
sông tụ hợp vào biển rộng, mênh mông hướng trong cơ thể hắn dũng mãnh lao tới.</p>
<p>Chân khí trong cơ thể càng ngày càng nhiều, đan điền cũng càng thêm ngưng thực
cường đại.</p>', null, 4, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 1', 'chuong-1', N'<p>Đại Nguyên hoàng triều, Lôi Châu, Lôi Sơn thành một chỗ giữa rừng núi. </p>
<p>Bầu trời mây đen dày đặc, hình như có mưa to sắp xảy ra, đem nguyên bản hắc ám
cảnh ban đêm phụ trợ càng thêm hắc ám. </p>
<p>Bành! Bành! Bành! </p>
<p>Giữa rừng núi, có một cái thiếu nữ áo tím lại là đang huy quyền, quyền phong
múa, phát ra nổ vang. </p>
<p>Quyền ảnh biến hoá thất thường, khiến người ta thấy không rõ chân chính quyền
đầu ở nơi nào. </p>
<p>Mấy cái quyền oanh ra, thiếu nữ áo tím trên khuôn mặt xuất hiện một chút ảm
đạm. </p>
<p>&quot;Tần Trầm ca ca, ta có phải hay không quá đần?&quot; </p>
<p>Thiếu nữ áo tím xoay người lại, tinh xảo khuôn mặt khiến người ta không nhịn
được cảm thán. </p>
<p>Mà giờ khắc này, đứng tại thiếu nữ áo tím bên người, lại là một cái bộ dáng
kiên nghị thiếu niên. </p>
<p>&quot;Hư Huyễn Quyền, coi trọng cũng là hư thực kết hợp, để cho địch nhân không thể
phỏng đoán, mặc dù là hạ phẩm võ học, nhưng là tu luyện độ khó khăn, thậm chí
vượt qua tầm thường trung phẩm võ học.&quot; </p>
<p>&quot;Thời gian ba năm, ngươi có thể tu luyện tới đại thành cảnh giới, đã rất
không tệ.&quot; </p>
<p>Tần Trầm sờ sờ Lục Thiên Tuyết đầu, trong ánh mắt mang theo một tia yêu chiều. </p>
<p>&quot;Tần Trầm ca ca, ngươi đem Hư Huyễn Quyền tu luyện đại thành cảnh giới, dùng
bao lâu thời gian?&quot; Lục Thiên Tuyết hỏi. </p>
<p>Võ học căn cứ lĩnh ngộ trình độ, cũng chia là mấy cảnh giới. </p>
<p>Nhập môn, tiểu thành, đại thành, đại viên mãn, hoàn mỹ cùng trong truyền
thuyết siêu hoàn mỹ cảnh giới. </p>
<p>Tần Trầm nghe vậy, cười cười, cũng không có trực tiếp trả lời. </p>
<p>Trên thực tế, hắn chân chính học tập cái này 《 Hư Huyễn Quyền 》 vẻn vẹn chỉ là
tại ba tháng trước. </p>
<p>Trước đó, vẻn vẹn chỉ là đang một mực dạy bảo Lục Thiên Tuyết a. </p>
<p>Ba tháng, Tần Trầm lại là đem cái này 《 Hư Huyễn Quyền 》 tu luyện đến đại viên
mãn cảnh giới. </p>
<p>Lục Thiên Tuyết thực cũng coi là thiên phú rất không tệ, nhưng là so sánh Tần
Trầm, lại là chênh lệch khá lớn. </p>
<p>Trước mặt dùng thời gian ba năm, mới miễn cưỡng đạt đến đại thành. </p>
<p>Cái sau lại là dùng ba tháng, thì đạt đến đại viên mãn. </p>
<p>Hắn là trời sinh võ học kỳ tài, tại võ học phía trên, có kinh người lĩnh ngộ
lực, không phải Lục Thiên Tuyết có thể so bì. </p>
<p>&quot;Tần Trầm ca ca, ngày mai sẽ là truyền thừa ngày, ta nghe nói Thanh Càn Kiếm
Tông người sẽ vì ngươi mà đến.&quot; </p>
<p>Lục Thiên Tuyết nói đến đây, ánh mắt lấp lóe một chút. </p>
<p>Thời kỳ thượng cổ, thần ma chúa tể thế giới, lưu lại vô số truyền thừa. </p>
<p>Võ giả tu luyện tới mười sáu tuổi, liền là có thể thông qua đá truyền thừa,
thu hoạch được công pháp truyền thừa, theo mà trở thành một tên chân chính võ
giả. </p>
<p>Một ngày này, cũng bị trở thành truyền thừa ngày, một năm một lần. </p>
<p>Thanh Càn Kiếm Tông, chính là Lôi Châu hoàn toàn xứng đáng thứ nhất tông môn,
thực lực mạnh mẽ. </p>
<p>Vô số hậu bối đều vì có thể tiến vào Thanh Càn Kiếm Tông mà cảm thấy tự hào. </p>
<p>Mà như vậy dạng tồn tại, thế mà là tự thân vì Tần Trầm mà đến, cái này đủ để
chứng minh Tần Trầm thiên phú cuối cùng có bao kinh người. </p>
<p>&quot;Ngươi thiên phú cũng không tệ a, đến lúc đó cũng có thể cùng ta cùng một chỗ
tiến vào Thanh Càn Kiếm Tông.&quot; </p>
<p>Tần Trầm khích lệ nói. </p>
<p>Tại Lôi Sơn thành loại địa phương này, Lục Thiên Tuyết thiên phú tuyệt đối có
thể tính là đỉnh phong. </p>
<p>Năm gần mười sáu tuổi, cũng đã là Luyện Thể ngũ trọng tu vi. </p>
<p>&quot;Sáu năm.&quot; </p>
<p>Lục Thiên Tuyết sắc mặt biến hóa. </p>
<p>Tần Trầm còn không có chú ý tới Lục Thiên Tuyết sắc mặt biến hóa, nghe được
Lục Thiên Tuyết lời nói, có chút cảm thán. </p>
<p>Thời gian qua rất nhanh. </p>
<p>Mười tuổi năm đó, Tần Trầm phụ thân Tần Vấn, mang theo Tần Trầm đi vào Lục
gia. </p>
<p>Mười tuổi chuyện khi trước, Tần Trầm căn bản nghĩ không ra, đoạn trí nhớ kia
phảng phất là bị chém đứt, một chút ấn tượng đều không có. </p>
<p>Hắn trí nhớ, là theo mười tuổi bắt đầu. </p>
<p>Cái này nhoáng một cái cũng là thời gian sáu năm. </p>
<p>Mà Tần Trầm, cũng tại đây Lục gia, đợi chỉnh một chút thời gian sáu năm. </p>
<p>Thời gian sáu năm bên trong, tại Tần Vấn trợ giúp hạ, Lục gia theo Lôi Sơn
thành một cái tiểu gia tộc cấp tốc quật khởi trở thành Lôi Sơn thành bá chủ,
không người là đối thủ. </p>
<p>Sáu năm bên trong, Tần Trầm lấy tốc độ kinh người, phi tốc quật khởi, trở
thành cái này sét phố núi phương viên trăm dặm mọi người đều biết tuyệt thế
thiên tài. </p>
<p>Tuổi của hắn theo Lục Thiên Tuyết một dạng, nhưng là tu vi lại là đã đạt tới
Luyện Thể chín tầng. </p>
<p>Mười sáu tuổi, Luyện Thể chín tầng, dạng này thành tựu, đừng nói Lôi Sơn
thành, đưa mắt toàn bộ Lôi Châu, đều là tuyệt đỉnh thiên tài. </p>
<p>Tại Lôi Sơn thành, Tần Trầm được vinh dự ngàn năm khó gặp thiên kiêu chi tử! </p>
<p>Đây cũng là vì cái gì Thanh Càn Kiếm Tông đều sẽ không xa ngàn dặm, vì Tần
Trầm mà đến nguyên nhân. </p>
<p>&quot;Đúng vậy a, cái này nhoáng một cái đều sáu năm trôi qua.&quot; </p>
<p>Tần Trầm mắt lộ ra cảm thán. </p>
<p>Phốc thử! </p>
<p>Đột nhiên, ngay lúc này, một thanh băng lạnh dao găm đâm vào đến Tần Trầm
trong thân thể. </p>
<p>Tần Trầm mắt trợn tròn, nhìn lấy Lục Thiên Tuyết, trong ánh mắt, tràn ngập
không thể tin thần sắc. </p>
<p>&quot;Thiên Tuyết! Ngươi đang làm gì? !&quot; </p>
<p>Giờ phút này, so với băng lãnh dao găm, càng thêm băng lãnh, lại là Tần Trầm
tâm. </p>
<p>&quot;Ha ha, Tần Trầm, không thể không nói, ngươi thiên phú xác thực khiến người ta
hâm mộ!&quot; </p>
<p>Chính tại lúc này, cách đó không xa đi tới ba đạo thân ảnh. </p>
<p>&quot;Các ngươi! !&quot; </p>
<p>Cái này ba đạo thân ảnh Tần Trầm quả thực không nên quá quen thuộc. </p>
<p>Lục gia gia chủ Lục Trấn Nam, Lục gia đại trưởng lão Lục Hắc, Lục gia nhị
trưởng lão Lục Trình Trạch. </p>
<p>Nhìn thấy đâm vào trong thân thể của mình dao găm, Tần Trầm bỗng nhiên ở giữa
ý thức được, cái này chỉ sợ là một trận âm mưu! </p>
<p>&quot;Sáu năm, một ngày này, rốt cục đến! !&quot; </p>
<p>Lục Thiên Tuyết mặt mũi tràn đầy lạnh lẽo chi ý, ánh mắt chỗ sâu có vẻ hưng
phấn. </p>
<p>Lục Thiên Tuyết một câu nói kia càng làm cho Tần Trầm cảm thấy, chính mình chỉ
sợ là sa vào đến một trận âm mưu kinh thiên bên trong. </p>
<p>&quot;Lục Thiên Tuyết, sáu năm qua, ta thật tình đối đãi ngươi, dụng tâm chỉ đạo
ngươi tu luyện, ngươi vậy mà như thế hồi báo tại ta? !&quot; </p>
<p>Tần Trầm nhìn lấy Lục Thiên Tuyết, mặt mũi tràn đầy dữ tợn. </p>
<p>&quot;Ta không phải cũng cùng ngươi thời gian sáu năm sao?&quot; </p>
<p>Lục Thiên Tuyết xùy cười một tiếng. </p>
<p>&quot;Theo giúp ta thời gian sáu năm? Ha ha ha ha!&quot; </p>
<p>Tần Trầm cười như điên, trong tươi cười mang theo vẻ điên cuồng. </p>
<p>&quot;Ngươi cái này ác độc nữ nhân, ngươi đi chết đi! !&quot; </p>
<p>Tần Trầm gào thét một tiếng, toàn thân tu vi trong nháy mắt bạo phát. </p>
<p>Nhưng là đột nhiên, Tần Trầm cảm giác một cỗ vô cùng hình dung thiêu đốt cảm
giác đau đớn đánh tới, để Tần Trầm trong nháy mắt hét thảm lên. </p>
<p>Cái này một cỗ to lớn thiêu đốt đau đớn, để Tần Trầm toàn thân sửa chữa vì căn
bản là không có cách sử dụng, trực tiếp ngã trên mặt đất. </p>
<p>&quot;Ngươi vậy mà tại dao găm này phía trên bôi hỏa độc? !&quot; </p>
<p>Tần Trầm ngã trên mặt đất, toàn thân run rẩy, nổi gân xanh. </p>
<p>Giờ khắc này hắn, chật vật tới cực điểm. </p>
<p>Hỏa độc đốt thể thống khổ, để Tần Trầm gần như sắp muốn đã hôn mê. </p>
<p>Bá —— </p>
<p>Lục Trấn Nam đột nhiên xuất thủ, trong tay, nguyên lực xuất hiện, trực tiếp
đánh vào Tần Trầm trên thân thể. </p>
<p>Ô a! </p>
<p>Tần Trầm nhận trọng kích, phun ra một ngụm máu tươi. </p>
<p>Cứ như vậy, cũng trực tiếp để Tần Trầm đau đớn càng cực hạn! </p>
<p>&quot;Từ hôm nay trở đi, ngươi hết thảy, đều coi như không tồn tại!&quot; </p>
<p>Lục Trấn Nam khuôn mặt phía trên lộ ra một tia cười lạnh. </p>
<p>&quot;Lục Trấn Nam, nếu là không có phụ thân ta, ngươi Lục gia có thể trở thành Lôi
Thiên thành thứ nhất bá chủ sao? !&quot; </p>
<p>Tần Trầm bên trong trong lòng lửa giận ngập trời, khuôn mặt đều xuất hiện vặn
vẹo trạng thái. </p>
<p>Lục gia lấy oán báo ân, để Tần Trầm nội tâm phẫn nộ. </p>
<p>&quot;Ha ha, ta để ngươi hai cha con, tại đây Lôi Sơn thành hưởng sáu năm vinh hoa
phú quý, như thế vẫn chưa đủ sao?&quot; </p>
<p>&quot;Ngày hôm nay, cũng đến thu chút lợi tức thời điểm!&quot; </p>
<p>&quot;Lục Hắc, Lục Trình Trạch, cho ta đem hắn khống chế lại!&quot; </p>
<p>Lục Trấn Nam lạnh giọng nói ra. </p>
<p>Lục Hắc theo Lục Trình Trạch nhất thời xông lại, đem trên mặt đất đau đớn
không ngừng lăn lộn Tần Trầm kéo lên, sau đó cưỡng ép đè lại. </p>
<p>&quot;Các ngươi chết không yên lành! ! !&quot; </p>
<p>Đau đớn không chiếm được phát tiết, đây đối với Tần Trầm tới nói, không thể
nghi ngờ là họa vô đơn chí, hắn điên cuồng phát ra tiếng kêu thảm. </p>
<p>&quot;Lục Trấn Nam, Lục Thiên Tuyết, còn có Lục Hắc, Lục Trình Trạch, mối thù hôm
nay, ngày sau ta Tần Trầm, sẽ làm gấp trăm lần hoàn trả! !&quot; </p>
<p>Tần Trầm mạch máu đều thẳng tiếp vỡ ra, toàn thân đã chảy đầy máu tươi, như
cùng một cái huyết nhân. </p>
<p>&quot;Ha ha, yên tâm, sẽ không để cho ngươi có cơ hội như thế này!&quot; </p>
<p>Lục Trấn Nam cười lạnh hai tiếng, sau đó trực tiếp cưỡng ép đem Tần Trầm hai
tay đặt ở Lục Thiên Tuyết trên lưng. </p>
<p>&quot;Di Thiên Huyết Công!&quot; </p>
<p>Lục Trấn Nam hét lớn một tiếng, phun ra một ngụm máu tươi, ngược lại, nhất
chưởng đánh vào Tần Trầm trên lưng. </p>
<p>Cơ hồ trong nháy mắt, Tần Trầm thì cảm giác trong thân thể của mình lực lượng
chính tại điên cuồng biến mất. </p>
<p>Mà ngược lại, Lục Thiên Tuyết tu vi lại là đang không ngừng thăng cao. </p>
<p>Trong nháy mắt, Tần Trầm tu vi theo Luyện Thể chín tầng ngã xuống đến Luyện
Thể thất trọng. </p>
<p>Lục Thiên Tuyết tu vi lại là dâng lên đến Luyện Thể lục trọng! </p>
<p>&quot;Ha ha ha, Tần Trầm, sau ngày hôm nay, ngươi thiên tài vầng sáng, liền đem
thuộc về ta Lục Thiên Tuyết!&quot; </p>
<p>Lục Thiên Tuyết điên cuồng cười to. </p>
<p>Hắn ghen ghét Tần Trầm! </p>
<p>Ghen ghét Tần Trầm nắm giữ như thế tuyệt luân thiên phú. </p>
<p>Nhưng là ngày hôm nay, nàng đem cướp đi Tần Trầm hết thảy, từ đó, thay thế Tần
Trầm! </p>
<p>Trong nháy mắt, Tần Trầm tu vi ngã xuống đến Luyện Thể tứ trọng. </p>
<p>Lục Thiên Tuyết tu vi dâng lên đến Luyện Thể thất trọng. </p>
<p>Cái này 《 Di Thiên Huyết Công 》 là một môn cấm thuật, có thể đem trước mặt tu
vi chuyển dời đến cái sau trong thân thể. </p>
<p>Sở dĩ là cấm thuật, cái kia cũng là bởi vì, thi triển 《 Di Thiên Huyết Công 》
điều kiện so sánh hà khắc. </p>
<p>Trước mặt tu vi đem toàn bộ mất đi, lại đan điền đều sẽ vỡ vụn. </p>
<p>Mà lại, thi triển 《 Di Thiên Huyết Công 》 người, cả đời tu vi đều không thể
tại đi lên đề bạt một bộ. </p>
<p>Hiển nhiên, vì có thể làm cho Lục Thiên Tuyết trở thành thiên kiêu chi tử, Lục
Trấn Nam hoàn toàn đã không thèm đếm xỉa. </p>
<p>Ầm! </p>
<p>Giống như là vật gì đó bạo liệt âm thanh vang lên, sau một khắc, Tần Trầm trực
tiếp cảm giác, chính mình đan điền phá tan tới. </p>
<p>Cùng lúc đó, Lục Thiên Tuyết tu vi tăng vọt đến Luyện Thể bát trọng! </p>
<p>Đổ xoa! </p>
<p>Một tia chớp hiện lên, ấp ủ đã lâu mưa rào tầm tã trong nháy mắt xuống. </p>
<p>&quot;Luyện Thể bát trọng!&quot; </p>
<p>Lục Thiên Tuyết mặt lộ vẻ vẻ mừng như điên. </p>
<p>Oanh! </p>
<p>Một tia chớp xuất hiện lần nữa. </p>
<p>Thông qua lôi điện ánh sáng, Lục Thiên Tuyết đứng tại trong mưa, khuôn mặt
phía trên, đều là vẻ điên cuồng. </p>
<p>&quot;Cha, vất vả.&quot; </p>
<p>Lục Thiên Tuyết nhìn về phía Lục Trấn Nam. </p>
<p>Giờ phút này, Lục Trấn Nam sắc mặt tái nhợt, hiển nhiên, cái này 《 Di Thiên
Huyết Công 》 đối với hắn thương tổn cũng không nhỏ. </p>
<p>&quot;Không có việc gì, vì ngươi, hết thảy đều là đáng giá.&quot; </p>
<p>Lục Trấn Nam miễn cưỡng gạt ra vẻ mỉm cười. </p>
<p>Đan điền vỡ vụn, hỏa độc đốt thể, tu vi mất hết, đây hết thảy, để Tần Trầm căn
bản là không có cách phản kháng. </p>
<p>Băng lãnh nước mưa thẩm thấu Tần Trầm thân thể, để Tần Trầm toàn thân phát
run. </p>
<p>Nhìn thấy trên mặt đất đau nhức vặn vẹo Tần Trầm, Lục Hắc khoát tay. </p>
<p>&quot;Hắc thúc, đừng giết hắn!&quot; </p>
<p>Lục Thiên Tuyết lại là lắc đầu. </p>
<p>&quot;Vì cái gì?&quot; </p>
<p>Lục Hắc rất không minh bạch. </p>
<p>&quot;Ta ngưỡng mộ hắn sáu năm, hiện tại liền đến hắn ngưỡng mộ ta thời điểm, lưu
hắn, chẳng lẽ không chơi rất hay sao?&quot; </p>
<p>Nước mưa đập nện tại Lục Thiên Tuyết trên khuôn mặt, làm nổi bật lên Lục
Thiên Tuyết khuôn mặt vặn vẹo. </p>
<p>&quot;Ngươi! !&quot; </p>
<p>Tần Trầm hô hấp dồn dập, phảng phất cảm giác được tử vong, không cách nào hình
dung phẫn nộ, để Tần Trầm hận không thể đem Lục Thiên Tuyết ngàn đao bầm thây. </p>
<p>&quot;Ha ha, phẫn nộ sao? Phẫn nộ ngươi thì có làm sao? Đan điền vỡ vụn, thì đại
biểu ngươi đời này không cách nào tu luyện, ngươi cuối cùng sẽ thành nhìn lên
ta tồn tại!&quot; </p>
<p>&quot;Rõ ràng ngày sau, ta Lục Thiên Tuyết tên, liền sẽ theo tại đây Lôi Thiên
thành, triệt để vang vọng!&quot; </p>
<p>&quot;Tần Trầm, ta sẽ để ngươi nhìn tận mắt, thuộc về ta quật khởi con đường!&quot; </p>
<p>Nương theo lấy một tia cuồng tiếu, Lục Thiên Tuyết bọn người rời đi địa phương
này. </p>
<p>Nước mưa mưa như trút nước, chỉ một thoáng, Tần Trầm thân thể liền bị nước mưa
vây quanh. </p>
<p>Giờ khắc này, Tần Trầm thật cảm giác được tử vong mùi vị. </p>
<p>&quot;Nếu có kiếp sau, ta Tần Trầm chắc chắn bọn ngươi tru sát!&quot; </p>
<p>Ong ong ong! </p>
<p>Ngay lúc này, Tần Trầm cái kia đeo tại nơi ngực một cái tinh thạch lại là bỗng
nhiên chấn động hai lần. </p>
<p>Sau đó, thế mà là trực tiếp dung nhập vào Tần Trầm trong thân thể. </p>
<p>Cùng lúc đó, Tần Trầm cái kia nguyên bản tràn đầy sáng tạo tổn thương thân
thể, cùng cái kia phá nát đan điền, vậy mà đều tại lấy mắt trần có thể thấy
tốc độ khép lại. </p>', null, 1, 2)

INSERT INTO ChuongTruyen VALUES(N'Chương 2', 'chuong-2', N'<p>Hôm sau, ánh sáng mặt trời vẩy khắp mặt đất, đem sau cơn mưa mù mịt quét qua
hết sạch. </p>
<p>Giữa rừng núi. </p>
<p>Tần Trầm dằng dặc tỉnh lại. </p>
<p>&quot;Ta... Còn sống?&quot; </p>
<p>Tần Trầm nhìn lấy chung quanh, trong ánh mắt, mang theo một tia không cách nào
ngôn ngữ ý mừng. </p>
<p>&quot;Mà lại, thương thế toàn bộ đều tốt!&quot; </p>
<p>Tần Trầm hai mắt chấn kinh, không biết tối hôm qua trên người mình, cuối cùng
phát sinh cái gì. </p>
<p>&quot;A?&quot; </p>
<p>Bỗng nhiên, Tần Trầm phát hiện mình lại có thể rõ ràng nhìn thấy bên trong
thân thể của mình bộ. </p>
<p>&quot;Nội thị? Đây không phải chỉ có Ngưng Nguyên cảnh cường giả mới có thể có được
năng lực sao?&quot; </p>
<p>Tần Trầm hơi kinh ngạc. </p>
<p>Con đường tu luyện, trước Luyện Thể, sau Tam Nguyên. </p>
<p>Luyện Thể cảnh, chỉ cũng là rèn luyện thân thể, vì con đường võ đạo, đánh
xuống cơ sở. </p>
<p>Sau Tam Nguyên, chỉ cũng là Ngưng Nguyên cảnh, Địa Nguyên cảnh, cùng Thiên
Nguyên cảnh. </p>
<p>Chỉ có đến Ngưng Nguyên cảnh, trong đan điền mới có thể ngưng tụ ra hạt giống
nguyên lực, lúc này, võ giả mới có thể sử dụng nguyên lực, có thể có được nội
thị năng lực. </p>
<p>&quot;Đây là? !&quot; </p>
<p>Tần Trầm chợt thấy một cái hết sức quen thuộc đồ,vật. </p>
<p>Giờ phút này, tại Tần Trầm trong đan điền, một cái nhìn như phổ thông tinh
thạch đang nằm ở chính giữa. </p>
<p>&quot;Thần bí tinh thạch, thế mà là chạy đến ta trong đan điền đi?&quot; </p>
<p>Tần Trầm vô cùng ngạc nhiên, hắn sờ sờ trước ngực mình. </p>
<p>Quả nhiên, mình mang mười sáu năm thần bí tinh thạch, không gặp. </p>
<p>&quot;Chẳng lẽ ta sở dĩ có thể khởi tử hoàn sinh, là cùng cái này thần bí tinh
thạch có quan hệ sao?&quot; </p>
<p>Tần Trầm có chút chấn kinh. </p>
<p>&quot;Mặc kệ như thế nào, đã ta còn sống, hôm qua ta Tần Trầm thừa nhận hết thảy,
sẽ làm gấp trăm lần hoàn lại! !&quot; </p>
<p>Nhớ tới đêm qua từng màn, Tần Trầm bên trong tâm lên cơn giận dữ. </p>
<p>&quot;Lục Thiên Tuyết, Lục Trấn Nam...&quot; </p>
<p>Tần Trầm song quyền nắm chặt, hai con ngươi huyết hồng, toàn thân phát run. </p>
<p>&quot;Truyền thừa ngày xem ra đã bắt đầu.&quot; </p>
<p>Tần Trầm trong ánh mắt ánh sáng lấp lóe, giống như là đang tự hỏi cái gì, sau
đó Tần Trầm nhấc chân hướng Lôi Sơn thành quảng trường đi đến. </p>
<p>&quot;Lục Thiên Tuyết, ta ngược lại muốn xem xem, ngày hôm nay, cuối cùng là ai
ngưỡng mộ ai!&quot; </p>
<p>... </p>
<p>Lôi Sơn thành quảng trường. </p>
<p>Hơn nghìn người hội tụ ở đây. </p>
<p>Trong sân rộng, có một khối đá, tản ra cổ lão khí tức. </p>
<p>Khối đá này, liền là Nhân tộc võ đạo truyền thừa quan trọng chi vật, công pháp
đá truyền thừa. </p>
<p>Thanh Càn Kiếm Tông người an vị tại đây đá truyền thừa bên cạnh. </p>
<p>&quot;Lâm Kỳ Vĩ, không có thu hoạch được công pháp truyền thừa!&quot; </p>
<p>&quot;Miêu Đạt, hoàng cấp hạ phẩm công pháp công pháp, đạo quyết!&quot; </p>
<p>&quot;Lý Thụy Đạt, hoàng cấp trung phẩm công pháp truyền thừa, Thiên Lang Công!&quot; </p>
<p>&quot;Đều là chút phế vật!&quot; </p>
<p>Thanh Càn Kiếm Tông trưởng lão Tang Thanh Vân nhịn không được chửi một câu. </p>
<p>&quot;Tần Trầm còn chưa tới sao?&quot; </p>
<p>Tang Thanh Vân hỏi hướng bên cạnh một cái Thanh Càn Kiếm Tông người. </p>
<p>Lần này, bọn họ chính là vì Tần Trầm mà đến, thuận đường tham gia cái này sét
phố núi truyền thừa ngày. </p>
<p>Không phải vậy, Lôi Sơn thành loại địa phương này, bọn họ tự nhiên là sẽ không
chuyên môn đến đây. </p>
<p>Vốn nghĩ thuận đường nhìn xem có cái gì hạt giống tốt, nhưng là không nghĩ
tới, thế mà là không có một cái có thể lọt vào mắt xanh. </p>
<p>&quot;Tạm thời còn chưa tới.&quot; </p>
<p>Thanh Càn Kiếm Tông người vội vàng trả lời. </p>
<p>Thanh Càn Kiếm Tông trưởng lão Tang Thanh Vân lắc đầu, trực tiếp nhắm mắt lại,
chưa từng để ý tới. </p>
<p>&quot;Tiếp tục, Lục Thiên Tuyết!&quot; </p>
<p>Theo một thanh âm vang lên, trên quảng trường hơn nghìn người đều theo một cái
phương hướng nhìn sang. </p>
<p>Lục Thiên Tuyết mặc lấy một thân váy trắng, lộ ra đến vô cùng thánh khiết. </p>
<p>&quot;Tuyệt mỹ giai nhân!&quot; </p>
<p>Không ít người cảm thán. </p>
<p>Thì liền Tang Thanh Vân đều hiếu kỳ mở to mắt, nhìn sang. </p>
<p>&quot;Cha, ta đi.&quot; </p>
<p>Lục Thiên Tuyết nói với Lục Trấn Nam một tiếng, Lục Trấn Nam gật gật đầu. </p>
<p>Tại Lục Trấn Nam bên người, Lục Hắc theo Lục Trình Trạch đều đứng tại Lục Trấn
Nam bên người. </p>
<p>Lục Thiên Tuyết vô cùng hưởng thụ loại này vạn chúng chú mục cảm giác, đi đến
đá truyền thừa bên cạnh, sau đó đưa tay đặt ở đá truyền thừa phía trên. </p>
<p>Một đạo quang mang hiện lên, trên đá truyền thừa xuất hiện một hàng chữ viết. </p>
<p>&quot;Lục Thiên Tuyết, địa cấp trung phẩm công pháp Tuyết Phượng Quyết!&quot; </p>
<p>Theo người chủ trì tuyên bố, toàn bộ Lôi Sơn thành quảng trường nhất thời táo
động. </p>
<p>&quot;Lại là địa cấp trung phẩm công pháp? Ta Lôi Sơn thành cơ hồ một trăm năm đều
chưa từng xuất hiện dạng này thiên tài a?&quot; </p>
<p>&quot;Đúng vậy a! Tuyệt đỉnh thiên tài, không nghĩ tới Lục Thiên Tuyết lại có như
thế kỳ ngộ, có thể thu hoạch được địa cấp trung phẩm công pháp!&quot; </p>
<p>&quot;Lục gia chủ, chúc mừng chúc mừng a!&quot; </p>
<p>&quot;Chúc mừng!&quot; </p>
<p>Vô số người bắt đầu hướng Lục Trấn Nam chúc mừng. </p>
<p>Một vũ giả thiên phú, lớn nhất đại quyết định quyền, chính là thu hoạch được
truyền thừa công pháp yếu mạnh. </p>
<p>Truyền thừa công pháp, chia làm, Thần, Thiên, Địa, Huyền, Hoàng năm cái cấp
bậc. </p>
<p>Mỗi cái cấp bậc lại phân hạ phẩm, trung phẩm, thượng phẩm cùng cực phẩm bốn
cái cấp bậc. </p>
<p>Giống một môn địa cấp công pháp, có thể làm cho võ giả nắm giữ gấp mười lần
thôn nạp tốc độ. </p>
<p>Mà hoàng cấp công pháp, chỉ có thể có một chút gấp năm lần, nhiều nhất gấp hai
thôn nạp tốc độ. </p>
<p>Thôn nạp tốc độ càng nhanh, còn tu luyện tốc độ càng nhanh. </p>
<p>Một cái thu hoạch được địa cấp công pháp người, một buổi tối, có thể bù đắp
được một cái hoàng cấp công pháp người sáu cái buổi tối thậm chí càng nhiều
thời gian. </p>
<p>Dạng này một dạng, chênh lệch tự nhiên vô cùng thì sinh ra. </p>
<p>Cho nên, thu hoạch được công pháp truyền thừa đẳng cấp, phi thường trọng yếu. </p>
<p>Như hôm nay Lục Thiên Tuyết thu hoạch được 《 Tuyết Phượng Quyết 》 đó là địa
cấp trung phẩm công pháp, dạng này đẳng cấp công pháp, đã coi như là vô cùng
đỉnh phong. </p>
<p>Tại Lôi Sơn thành, chí ít đã trăm năm chưa từng xuất hiện. </p>
<p>Trong đám người, Lục Thiên Tuyết vô cùng loá mắt! </p>
<p>&quot;Ngươi gọi Lục Thiên Tuyết?&quot; </p>
<p>Lúc này, Tang Thanh Vân trên mặt rốt cục xuất hiện vẻ tươi cười. </p>
<p>Lục Thiên Tuyết gật gật đầu. </p>
<p>&quot;Lão phu Tang Thanh Vân, ngươi có bằng lòng hay không trở thành ta Thanh Càn
Kiếm Tông đệ tử?&quot; </p>
<p>Tang Thanh Vân mặt mỉm cười, đối Lục Thiên Tuyết phi thường hài lòng. </p>
<p>Xoạt! </p>
<p>Nghe được Tang Thanh Vân lời nói, trên quảng trường vang lên một mặt tiếng ồ
lên. </p>
<p>Thanh Càn Kiếm Tông, chính là Lôi Châu thứ nhất tông môn, tông môn thực lực
ngập trời, là vô số tuổi trẻ hậu bối muốn đi vào tu luyện thánh địa. </p>
<p>Bình thường truyền thừa ngày, có hai bước. </p>
<p>Bước đầu tiên, là thu hoạch được truyền thừa công pháp. </p>
<p>Bước thứ hai, thì là tư chất trắc thí. </p>
<p>Hiện tại, Lục Thiên Tuyết đều không có tiến hành bước thứ hai, vậy mà liền
trực tiếp bị Thanh Càn Kiếm Tông thu nhập đệ tử, cái này xác thực làm cho
người sợ hãi thán phục. </p>
<p>&quot;Ta nguyện ý!&quot; </p>
<p>Lục Thiên Tuyết mỉm cười gật gật đầu. </p>
<p>Từ hôm nay trở đi, ta Lục Thiên Tuyết, liền đem triệt để quật khởi! </p>
<p>Lục Thiên Tuyết song quyền nắm chặt. </p>
<p>Một ngày này, hắn chờ vô số ngày đêm! </p>
<p>Lục Trấn Nam trên mặt xuất hiện một tia như trút được gánh nặng nụ cười. </p>
<p>Vì có thể làm cho Lục Thiên Tuyết tiến vào Thanh Càn Kiếm Tông, hắn nhưng là
nhọc lòng. </p>
<p>Sự thật chứng minh, hắn khổ tâm đều không có uổng phí. </p>
<p>Trong đám người, một người trung niên nam nhân lại là nhíu mày. </p>
<p>&quot;Trầm nhi cuối cùng đi nơi nào? Tại sao lúc này đều còn chưa tới?&quot; </p>
<p>Người trung niên nam nhân này, cũng là Tần Trầm phụ thân Tần Vấn. </p>
<p>Lục Thiên Tuyết ánh mắt ngạo nghễ liếc nhìn toàn trường, bỗng nhiên, nàng ánh
mắt định trụ, như là thấy cái gì để cho nàng kinh ngạc sự việc. </p>
<p>Theo Lục Thiên Tuyết ánh mắt, không ít người cũng nhìn sang. </p>
<p>&quot;Tần Trầm?&quot; </p>
<p>&quot;Tần Trầm đến!&quot; </p>
<p>Nhìn thấy thiếu niên kia, không ít người có chút hưng phấn. </p>
<p>Lôi Sơn thành ngàn năm khó gặp thiên tài! </p>
<p>Không ít người lần này đến đây, chính là vì Tần Trầm, bọn họ đều muốn nhìn một
chút, cái này một cái tuyệt thế thiên tài, cứu có thể thu hoạch được như thế
nào truyền thừa công pháp. </p>
<p>&quot;Cha!&quot; </p>
<p>Tần Trầm đi đến Tần Vấn trước người. </p>
<p>Tần Vấn chau mày, lấy hắn thực lực, liếc mắt liền nhìn ra Tần Trầm hiện tại
trên thân thể biến hóa. </p>
<p>&quot;Ta không sao.&quot; </p>
<p>Như là cảm giác được Tần Vấn lo lắng, Tần Trầm mỉm cười lắc đầu. </p>
<p>Ngược lại, Tần Trầm ánh mắt nhìn về phía trước, vừa tốt theo Lục Thiên Tuyết
ánh mắt đụng vào nhau. </p>
<p>Cái sau ánh mắt tuy nói mang theo một vẻ kinh ngạc, nhưng là càng nhiều, lại
là mỉa mai. </p>
<p>Hiển nhiên, đối với Tần Trầm trở về, hắn hơi kinh ngạc, dù sao hôm qua thương
thế cũng không nhẹ, nhưng là càng nhiều, là khinh thường. </p>
<p>&quot;Đã ngươi có mặt đến, vậy ta sẽ nhường ngươi xem một chút, hiện tại ta, đối
với ngươi mà nói, cuối cùng là như thế nào tồn tại!&quot; </p>
<p>Lục Thiên Tuyết khóe miệng xẹt qua vẻ hưng phấn. </p>
<p>Nàng đã không kịp chờ đợi muốn xem đến Tần Trầm bị nàng nghiền ép tràng diện.</p>', null, 2, 2)

INSERT INTO ChuongTruyen VALUES(N'Chương 3', 'chuong-3', N'<p>&quot;Ngươi chính là Tần Trầm?&quot; </p>
<p>Nghe được mọi người tiếng kêu gọi âm, Tang Thanh Vân vội vàng đi tới. </p>
<p>Hắn ngày hôm nay chính là vì Tần Trầm mà đến! </p>
<p>Cho nên, hắn vô cùng bức thiết muốn nhìn một chút truyền thuyết này bên trong
tuyệt đỉnh thiên tài cuối cùng có cỡ nào mới có thể. </p>
<p>&quot;Đúng!&quot; </p>
<p>Tần Trầm thu hồi ánh mắt, khẽ gật đầu. </p>
<p>&quot;Vậy ngươi đi thử một chút!&quot; </p>
<p>Tang Thanh Vân vội vàng thúc giục. </p>
<p>Tần Trầm theo Tần Vấn ánh mắt ý chào một cái, sau đó hướng đi đá truyền thừa. </p>
<p>&quot;Các ngươi đoán Tần Trầm có thể thu hoạch được đẳng cấp gì công pháp truyền
thừa?&quot; </p>
<p>&quot;Tối thiểu cũng là địa cấp đi!&quot; </p>
<p>&quot;Tuyệt đối sẽ không so Lục Thiên Tuyết phải kém!&quot; </p>
<p>&quot;Đúng vậy a, theo Tần Trầm so ra, Lục Thiên Tuyết tuyệt đối là kém không ít!&quot; </p>
<p>&quot;Thật chờ mong a!&quot; </p>
<p>Tần Trầm cứ như vậy từng bước một đi đến đá truyền thừa bên cạnh, ở bên cạnh
hắn, cũng là Lục Thiên Tuyết. </p>
<p>&quot;Tần Trầm, hôm nay ngươi, cũng là một cái từ đầu đến đuôi phế vật, ngươi liền
đợi đến ta đem trên người ngươi vầng sáng, cho triệt để tước đoạt đi!&quot; </p>
<p>Lục Thiên Tuyết tại Tần Trầm bên người kêu gào nói ra. </p>
<p>Thu hoạch được truyền thừa công pháp đẳng cấp, lớn nhất nhân tố chủ yếu, thì
là Vũ Giả tu vi. </p>
<p>Giống Lục Thiên Tuyết, Luyện Thể bát trọng, cho nên nàng mới có thể thu được
địa cấp trung phẩm công pháp truyền thừa. </p>
<p>Theo Lục Thiên Tuyết, Tần Trầm một cái đan điền vỡ vụn, tu vi mất hết người,
có thể hay không thu hoạch được công pháp truyền thừa đều là không nhất định. </p>
<p>Càng đừng đề cập vượt qua hắn. </p>
<p>&quot;Úc? Thật sao?&quot; </p>
<p>Tần Trầm mặt không biểu tình, khóe miệng hơi hơi giương lên. </p>
<p>Bành! </p>
<p>Ngược lại, Tần Trầm tay chính là đặt ở trên đá truyền thừa. </p>
<p>Ong ong ong! </p>
<p>Bỗng nhiên, đá truyền thừa chính là tách ra vô cùng tia sáng chói mắt. </p>
<p>&quot;Trời ạ! !&quot; </p>
<p>&quot;Đây là cái gì đẳng cấp truyền thừa công pháp mới có thể tạo thành dị tượng
như thế?&quot; </p>
<p>Toàn bộ quảng trường, một mặt xôn xao. </p>
<p>&quot;Không hổ là được vinh dự ngàn năm khó gặp tuyệt thế thiên tài!&quot; </p>
<p>Tang Thanh Vân càng là mặt mũi tràn đầy kích động, tròng mắt đều nhanh muốn
tiến tới. </p>
<p>Lục Trấn Nam mặt mũi tràn đầy ngốc trệ. </p>
<p>Lục Hắc theo Lục Trình Trạch càng là toàn thân run rẩy. </p>
<p>&quot;Điều đó không có khả năng! Hắn tu vi mất hết, làm sao có thể có thể tạo thành
dạng này động tĩnh lớn?&quot; </p>
<p>Lục Trấn Nam điên cuồng lắc đầu. </p>
<p>Cơ hồ trong nháy mắt, Tần Trầm liền trở thành cái này trên quảng trường, tuyệt
đối tiêu điểm. </p>
<p>Còn Lục Thiên Tuyết, nguyên bản đắc ý sắc mặt trong nháy mắt thì thay đổi. </p>
<p>Cùng lúc đó, nàng đôi mắt sung huyết lên. </p>
<p>Chậm rãi, trên đá truyền thừa hiện ra một hàng chữ. </p>
<p>Hoàng cấp hạ phẩm công pháp, đạo quyết! </p>
<p>Nhìn qua trên đá truyền thừa xuất hiện một hàng chữ, toàn trường đột nhiên yên
tĩnh. </p>
<p>Tang Thanh Vân sắc mặt trong nháy mắt thì thay đổi. </p>
<p>&quot;Ha ha ha ha! Chỉ là một cái hoàng cấp hạ phẩm đạo quyết!&quot; </p>
<p>Lục Trấn Nam bọn người lên tiếng cuồng tiếu. </p>
<p>Lục Thiên Tuyết trên mặt lộ ra một tia cười khẽ, đây là thuộc về người thắng
lợi nụ cười. </p>
<p>Hoàng cấp hạ phẩm công pháp, đây là công pháp hạ cấp nhất đẳng cấp. </p>
<p>Cái này đại biểu, Tần Trầm, cuối cùng rồi sẽ không có thành công quá lớn! </p>
<p>Mà, Lục Thiên Tuyết, sẽ trong nháy mắt theo Tần Trầm kéo dài khoảng cách. </p>
<p>Cả hai, từ giờ trở đi, sẽ là, một cái trên trời, một cái dưới đất. </p>
<p>&quot;Tần Trầm thế mà là thu hoạch được lại là cấp thấp nhất đạo quyết?&quot; </p>
<p>&quot;Hoàng cấp hạ phẩm công pháp, Tần Trầm cả đời này lại tu luyện thế nào, tu vi
cũng sẽ không vượt qua Ngưng Nguyên cảnh!&quot; </p>
<p>&quot;Quá thất vọng!&quot; </p>
<p>Trên quảng trường, nguyên bản đối Tần Trầm ôm hi vọng lớn lao mọi người sắc
mặt trở nên cực nhanh. </p>
<p>Giờ phút này, chỉ có Tần Trầm một người, ánh mắt chỗ sâu có không che giấu
được ý mừng. </p>
<p>Bời vì, chỉ có hắn tự mình biết, hắn thu hoạch được công pháp truyền thừa, căn
bản không phải cái gì 《 đạo quyết 》. </p>
<p>Mà chính là, 《 Thôn Thần Ngộ Đạo Quyết 》! </p>
<p>Cái này đá truyền thừa chỉ cho thấy cái môn này công pháp đằng sau hai chữ. </p>
<p>Cái này 《 Thôn Thần Ngộ Đạo Quyết 》 tu luyện tới cảnh giới tối cao, đủ để thôn
phệ thần ma, nhẹ nhõm lĩnh ngộ vạn thiên đạo pháp, cường đại vô địch! </p>
<p>Nhìn qua chung quanh một mặt cười nhạo, Tần Trầm xem thường. </p>
<p>&quot;Được, ngươi có thể đi.&quot; </p>
<p>Tang Thanh Vân sắc mặt biến hóa đặc biệt nhanh, nhìn thấy Tần Trầm chỉ thu
hoạch được một cái 《 đạo quyết 》, nhất thời liền trở mặt. </p>
<p>Tần Trầm nghe xong, sầm mặt lại. </p>
<p>&quot;Tiền bối, ta tôn kính ngài, gọi ngài một tiếng tiền bối, nhưng là, ngài cũng
không thể như thế bợ đỡ a?&quot; </p>
<p>&quot;Ngài để cho ta lên, ta liền lên đến, hiện tại, ngài lại để cho ta đi xuống,
ta liền phải xuống dưới?&quot; </p>
<p>Cái này Tang Thanh Vân như thế bợ đỡ sắc mặt, để Tần Trầm trong nháy mắt đối
với người này chán ghét đến cực hạn. </p>
<p>Để cho mình bên trên, chính mình liền phải lên? </p>
<p>Để cho mình hạ, chính mình liền phải xuống? </p>
<p>Từ đâu tới đạo ý? </p>
<p>&quot;Ngươi chẳng lẽ còn muốn tham gia vòng thứ hai tư chất trắc thí hay sao?&quot; </p>
<p>Tang Thanh Vân nghe vậy, xùy cười một tiếng. </p>
<p>&quot;Tang trưởng lão, không quan hệ, đã hắn muốn tham gia, vậy liền để hắn tham
gia đi.&quot; </p>
<p>Bỗng nhiên, bên cạnh Lục Thiên Tuyết nói chuyện. </p>

<p>&quot;Tần Trầm, đã ngươi không có cam lòng, vậy ta liền dùng sự thực, đến triệt để
vỡ nát ngươi vọng tưởng!&quot; </p>
<p>Lục Thiên Tuyết mặt lộ vẻ mỉa mai. </p>
<p>Nói xong, Lục Thiên Tuyết chính là đi tới một bên tư chất trắc thí trên tấm
bia. </p>
<p>Sáu năm qua, Tần Trầm một mực ép nàng một đầu. </p>
<p>Hiện tại, đến phiên hắn đè lại, cho nên trong lòng của hắn tự nhiên là vô cùng
thoải mái. </p>
<p>Nàng thì là muốn nhìn thấy Tần Trầm ngưỡng mộ nàng! </p>
<p>&quot;Hư Huyễn Quyền!&quot; </p>
<p>Lục Thiên Tuyết thôi động lực lượng toàn thân, đấm ra một quyền. </p>
<p>Sử dụng, rõ ràng là Tần Trầm dạy cho nàng 《 Hư Huyễn Quyền 》. </p>
<p>&quot;Một quyền này! !&quot; </p>
<p>Nhìn thấy Lục Thiên Tuyết một quyền này, không nói việc khác người, thì liền
Tang Thanh Vân đều là sắc mặt hơi kinh ngạc. </p>
<p>&quot;Cái môn này võ học nhìn như chỉ là hạ phẩm võ học, nhưng là thực tu luyện độ
khó khăn, thậm chí vượt qua tầm thường trung phẩm võ học!&quot; </p>
<p>&quot;Dạng này một môn võ học, có thể đem tu luyện tới đại thành cảnh giới, không
nghĩ tới, cái này Lục Thiên Tuyết tại võ học phía trên, kinh người cũng đồng
dạng nắm giữ kinh người như vậy tạo nghệ.&quot; </p>
<p>Tang Thanh Vân thân là Thanh Càn Kiếm Tông trưởng lão, chỉ nhìn một chút, liền
có thể nhìn ra Lục Thiên Tuyết một quyền này ảo diệu. </p>
<p>&quot;Thiên Tuyết xác thực thiên phú trác tuyệt!&quot; </p>
<p>Lục Trấn Nam bên cạnh, Lục Hắc theo Lục Trình Trạch cũng mặt lộ vẻ ý mừng. </p>
<p>&quot;Đúng vậy a, võ đạo mặt, đã siêu việt vô số người đồng lứa, võ học phía trên,
tạo nghệ cũng cao như thế, ta nhìn ngày sau, Thiên Tuyết sẽ làm trở thành cái
này sét Châu bên trong đều danh tiếng hiển hách một phương nhân vật!&quot; </p>
<p>Lục Trình Trạch cũng nói. </p>
<p>Lục Trấn Nam mặt mũi tràn đầy ý mừng. </p>
<p>&quot;Không nghĩ tới a, Lục Thiên Tuyết lại có thể có thiên phú như vậy, võ đạo võ
học phía trên tạo nghệ đều phi thường cao!&quot; </p>
<p>&quot;Lục gia có Lục Thiên Tuyết, sẽ làm phồn vinh hưng thịnh!&quot; </p>
<p>Trong sân rộng, vây xem người cũng mặt lộ vẻ kinh hãi ý. </p>
<p>&quot;Cũng không biết cái này Lục Thiên Tuyết, cứu có thể thu hoạch được mấy sao tư
chất đâu?&quot; </p>
<p>&quot;Ta nhìn hẳn là có thể thu hoạch được lục tinh tư chất!&quot; </p>
<p>Mọi người, đều bị Lục Thiên Tuyết một quyền này rung động. </p>
<p>Chỉ có Tần Trầm một người, trong lòng cảm giác buồn cười. </p>
<p>Vô luận là Lục Thiên Tuyết tu vi, vẫn là Lục Thiên Tuyết võ học tạo nghệ, cái
này một chút, toàn bộ đều là Tần Trầm cho. </p>
<p>Hiện tại ngược lại là bị Lục Thiên Tuyết lấy ra ép hắn, cái này khiến Tần Trầm
trong lòng không sai cảm thấy thật đáng buồn buồn cười. </p>
<p>Theo Lục Thiên Tuyết cái này đấm ra một quyền, tư chất trắc thí trên tấm bia
chấm nhỏ cũng sáng lên. </p>
<p>Một khỏa, hai khỏa, ba khỏa, bốn khỏa, năm viên... </p>
<p>Trong nháy mắt, năm ngôi sao chính là sáng lên. </p>
<p>Cái này đại biểu, Lục Thiên Tuyết tư chất, đã đến cấp năm sao đừng. </p>
<p>&quot;Còn đang lên cao!&quot; </p>
<p>Ngay sau đó, thứ sáu vì sao chính là sáng lên. </p>
<p>&quot;Quả nhiên là lục tinh tư chất!&quot; </p>
<p>Trong sân rộng, một mặt xôn xao. </p>
<p>Lục tinh tư chất, cái này tại Lôi Sơn thành, đã thời gian thật dài đều chưa
từng xuất hiện. </p>
<p>&quot;Không đúng, các ngươi nhìn!&quot; </p>
<p>Bỗng nhiên có người hô một tiếng. </p>
<p>Vô số người nhìn sang, giờ phút này, thứ bảy viên ngôi sao cũng sáng lên. </p>
<p>Thất tinh tư chất! </p>
<p>Mọi người sắc mặt ngốc trệ. </p>
<p>&quot;Tần Trầm, hiện tại, ngươi biết giữa ta với ngươi chênh lệch sao?&quot; </p>
<p>Làm tư chất trắc thí trên tấm bia bảy viên ngôi sao toàn bộ sáng lên về sau,
Lục Thiên Tuyết ngạo nghễ nhìn thẳng Tần Trầm.</p>', null, 3, 2)

INSERT INTO ChuongTruyen VALUES(N'Chương 4', 'chuong-4', N'<p>Tư chất trắc thí bia hơi hơi rung động động một cái, chậm rãi xuất hiện một
hàng chữ. </p>
<p>Tu vi, Luyện Thể bát trọng, tư chất, thất tinh! </p>
<p>&quot;Thất tinh tư chất, thật sự là thất tinh tư chất, ta trời ơi, ta Lôi Sơn thành
có lẽ có một trăm năm chưa từng xuất hiện dạng này yêu nghiệt a?&quot; </p>
<p>&quot;Đúng vậy a! Không nghĩ tới a, ngày hôm nay cái này truyền thừa ngày quật
khởi thiên kiêu, lại là Lục Thiên Tuyết!&quot; </p>
<p>&quot;Quá kinh người!&quot; </p>
<p>&quot;Tuổi còn trẻ liền đã đạt tới Luyện Thể bát trọng, cái này quả thực khiến
người ta vô pháp tưởng tượng!&quot; </p>
<p>&quot;Lục Thiên Tuyết, tiền đồ vô lượng!&quot; </p>
<p>Trên quảng trường mọi người hít một hơi lãnh khí. </p>
<p>Thất tinh tư chất, trăm năm khó gặp! </p>
<p>Lục Thiên Tuyết, chính là Lôi Sơn thành trăm năm khó gặp siêu cấp thiên tài! </p>
<p>Nàng cũng tất sẽ bị Lôi Sơn thành tái nhập sử sách. </p>
<p>&quot;Tốt! Rất tốt! !&quot; </p>
<p>Tang Thanh Vân mặt mũi tràn đầy ý mừng. </p>
<p>Tuy nhiên Tần Trầm để hắn vô cùng thất vọng, nhưng là, giờ phút này Lục Thiên
Tuyết chỗ thể hiện ra thiên phú, đã để hắn phi thường hài lòng. </p>
<p>Thất tinh tư chất, tại Thanh Càn Kiếm Tông cũng coi là vô cùng nhân vật đứng
đầu. </p>
<p>Thêm chút bồi dưỡng, ngày sau nhất định cũng có thể trở thành một phương cường
giả. </p>
<p>&quot;Thiên Tuyết quật khởi, đã thế bất khả đáng!&quot; </p>
<p>Lục Trấn Nam chờ trong lòng người sôi trào. </p>
<p>Thất tinh tư chất, chắc chắn viết lên truyền kỳ! </p>
<p>&quot;Ngươi nhất định chỉ có thể nhìn lên ta!&quot; </p>
<p>Lục Thiên Tuyết khinh thường Tần Trầm. </p>
<p>Nhưng, đối mặt Lục Thiên Tuyết kêu gào, Tần Trầm lại là thủy chung thần sắc
đạm mạc, để Lục Thiên Tuyết trong lòng giận dữ. </p>
<p>Đột nhiên, Tần Trầm chậm rãi đi đến tư chất trắc thí bia trước mặt. </p>
<p>&quot;Hắn muốn làm gì?&quot; </p>
<p>&quot;Hắn muốn trắc thí chính mình tư chất?&quot; </p>
<p>&quot;Tên này xác định không phải tại tự mình chuốc lấy cực khổ sao?&quot; </p>
<p>Nhìn thấy Tần Trầm hành vi, trên quảng trường một mặt kinh ngạc. </p>
<p>Một cái chỉ thu hoạch được 《 đạo quyết 》 gia hỏa, còn muốn tham gia tư chất
trắc thí? </p>
<p>Còn ngại không đủ mất mặt sao? </p>
<p>Tang Thanh Vân càng là cười lạnh lắc đầu. </p>
<p>Tần Trầm chậm rãi ngẩng đầu, nhất thời, ánh mắt theo Lục Thiên Tuyết ánh mắt
thì đụng vào nhau. </p>
<p>&quot;Ngươi, xem trọng.&quot; </p>
<p>Nhàn nhạt mấy chữ, rơi xuống Lục Thiên Tuyết trong lòng, lại là để Lục Thiên
Tuyết trong lòng cảm giác buồn cười. </p>
<p>Ta chú ý? </p>
<p>Ta nhìn cái gì? </p>
<p>Nhìn ngươi mất mặt xấu hổ sao? </p>
<p>&quot;Được, ta chú ý.&quot; </p>
<p>Lục Thiên Tuyết cười nhạo, gật gật đầu. </p>
<p>&quot;Lăn xuống đi!&quot; </p>
<p>Lúc này, có người thậm chí ác ngôn lối ra. </p>
<p>Tần Trầm tâm lặng như nước. </p>
<p>Giờ khắc này, trong lòng của hắn, lại là nghĩ đến rất nhiều. </p>
<p>Hắn nghĩ tới Lục gia lấy oán báo ân. </p>
<p>Hắn nghĩ tới hỏa độc đốt thể thống khổ. </p>
<p>Hắn nghĩ tới Lục Thiên Tuyết cưỡng đoạt chính mình tu vi, để cho mình đan điền
vỡ vụn. </p>
<p>Hắn nghĩ tới chính mình nằm tại bàng bạc trong mưa to suốt cả đêm kém chút tử
vong. </p>
<p>Hắn còn nghĩ tới Lục Thiên Tuyết cái kia mấy câu. </p>
<p>Tần Trầm, ngươi cuối cùng rồi sẽ tận mắt chứng kiến thuộc về ta quật khởi con
đường. </p>
<p>Tần Trầm, ngươi cả đời này chỉ có thể trở thành ngưỡng mộ ta người. </p>
<p>&quot;Đây hết thảy, ta sẽ dùng sự thật, để ngươi xem một chút, cuối cùng là ai,
ngưỡng mộ ai!&quot; </p>
<p>Ngay tại lúc này! </p>
<p>&quot;Hư Huyễn Quyền! !&quot; </p>
<p>Tần Trầm đột nhiên xuất quyền, rõ ràng là Lục Thiên Tuyết vừa rồi sử dụng 《 Hư
Huyễn Quyền 》. </p>
<p>Chỉ là, so với Lục Thiên Tuyết 《 Hư Huyễn Quyền 》, trước mắt Tần Trầm sử dụng
《 Hư Huyễn Quyền 》 lại là càng thêm huyền ảo. </p>
<p>&quot;Thế mà là theo Lục Thiên Tuyết là một dạng võ học!&quot; </p>
<p>Có người hơi kinh ngạc. </p>
<p>&quot;Theo Lục Thiên Tuyết thi triển võ học, hoàn toàn là hai cái dạng!&quot; </p>
<p>&quot;So Lục Thiên Tuyết càng thêm huyền ảo, cái này Tần Trầm tại võ học phía trên
tạo nghệ, so Lục Thiên Tuyết muốn cao hơn nhiều!&quot; </p>
<p>Người bình thường liếc một chút liền có thể nhìn ra Tần Trầm một quyền này
theo Lục Thiên Tuyết ở giữa chênh lệch. </p>
<p>Cho dù là lúc trước một mực đối xử lạnh nhạt nhìn Tần Trầm Tang Thanh Vân, giờ
phút này đều là nhíu mày, trong ánh mắt có một chút kinh ngạc. </p>
<p>&quot;Bất quá, coi như võ học tạo nghệ cao lại như thế nào? Chỉ là hoàng cấp hạ
phẩm công pháp đạo quyết, một dạng không cách nào lấy được đến thành công quá
lớn!&quot; </p>
<p>Tang Thanh Vân chợt cười lạnh lắc đầu. </p>
<p>&quot;Tiểu tử này, có lẽ não tử bị đánh hư mất.&quot; </p>
<p>Lục Trấn Nam nhìn lấy giữa sân Tần Trầm, mặt mũi tràn đầy khinh miệt. </p>
<p>&quot;Chỉ bằng hắn, còn muốn giống như trước đó, đứng tại Thiên Tuyết trên đầu?&quot; </p>
<p>&quot;Đoán chừng là đả kích quá lớn, còn không có kịp phản ứng đâu!&quot; </p>
<p>Lục Hắc cười lên ha hả. </p>
<p>Đối với đêm qua ám hại Tần Trầm sự việc, bọn họ không có một chút ăn năn chi
tâm. </p>
<p>Chinh! </p>
<p>Bỗng nhiên, tư chất trắc thí trên tấm bia, thứ một vì sao sáng lên. </p>
<p>Điều này đại biểu Tần Trầm giờ phút này nắm giữ nhất tinh tư chất! </p>
<p>&quot;Ha ha, nhất tinh tư chất mà thôi, không đáng giá nhắc tới!&quot; </p>
<p>Lục Trấn Nam vẫn như cũ một mặt khinh thường. </p>
<p>Nhưng lại tại cái này thứ một vì sao sáng sau khi thức dậy, sau một khắc, viên
thứ hai chấm nhỏ liền theo sáng lên. </p>
<p>&quot;Lại còn có thể thắp sáng hai ngôi sao?&quot; </p>
<p>Lục Trấn Nam hơi kinh ngạc. </p>
<p>&quot;Haha, hai ngôi sao đoán chừng là cực hạn, ngươi nhìn tiểu tử kia bộ dáng, có
lẽ trong lòng tràn đầy không cam lòng đi!&quot; </p>
<p>Lục Hắc ở một bên cuồng tiếu. </p>
<p>Trên quảng trường người cũng lắc đầu. </p>
<p>Giờ phút này, cũng chỉ có Tần Vấn một người, đứng ở trong đám người, từ đầu
đến cuối không có nói chuyện, biểu lộ bình thản. </p>
<p>Nhưng, cũng vào thời khắc này, thứ ba sao sáng lên. </p>
<p>Thắp sáng ba khỏa ngôi sao, tam tinh tư chất! </p>
<p>&quot;A?&quot; </p>
<p>Nhìn thấy cái này viên thứ ba ngôi sao đều sáng, Tang Thanh Vân có chút tiểu
kinh quái lạ. </p>
<p>Lục Thiên Tuyết thì là nhíu mày. </p>
<p>Một cái thu hoạch được hoàng cấp hạ phẩm công pháp người, lại còn có thể thu
hoạch được tam tinh tư chất? </p>
<p>Chinh! </p>
<p>Chinh! </p>
<p>Ngay sau đó, viên thứ tư ngôi sao, theo thứ năm ngôi sao cũng trong nháy mắt
sáng lên lên. </p>
<p>Giờ khắc này, toàn trường tĩnh mịch! </p>
<p>Lục Thiên Tuyết mặt mũi tràn đầy không thể tin được. </p>
<p>Thắp sáng ngũ tinh? </p>
<p>Cái này sao có thể? </p>
<p>Tang Thanh Vân càng là trong lòng run lên, nhìn về phía Tần Trầm ánh mắt rõ
ràng thay đổi. </p>
<p>&quot;Hắn làm sao lại thu hoạch được ngũ tinh tư chất?&quot; </p>
<p>Lục Trấn Nam không ngừng lắc đầu, không thể tin được đây hết thảy. </p>
<p>Trong sân rộng, nguyên bản chế giễu Tần Trầm cái kia một số người nhất thời
tất cả câm miệng. </p>
<p>Ngũ tinh tư chất, tuy nhiên so ra kém Lục Thiên Tuyết thất tinh tư chất, nhưng
là, đã coi như là vô cùng lưa thưa có tồn tại. </p>
<p>&quot;Vẻn vẹn năm ngôi sao liền để ngươi chấn kinh a?&quot; </p>
<p>Tần Trầm một thanh âm chậm rãi rơi vào Lục Thiên Tuyết trong tai, lại là để
Lục Thiên Tuyết như bị sét đánh. </p>
<p>Vẻn vẹn năm ngôi sao? </p>
<p>Chẳng lẽ, cái này còn không phải cực hạn? </p>
<p>Lục Thiên Tuyết nhìn về phía Tần Trầm ánh mắt nhất thời thì thay đổi, trở nên
tràn ngập kinh hãi ý theo hoảng sợ. </p>
<p>Chinh! Chinh! </p>
<p>Lại là hai âm thanh vang lên, bảy viên ngôi sao đã được thắp sáng. </p>
<p>Thất tinh tư chất, đã đuổi ngang Lục Thiên Tuyết. </p>
<p>&quot;Điều đó không có khả năng! ! !&quot; </p>
<p>Lục Thiên Tuyết há to mồm, đã không biết nên như thế nào hình dung chính mình
nội tâm chấn kinh. </p>
<p>Chính mình nhưng là Luyện Thể bát trọng, cũng lại đạt được địa cấp trung phẩm
công pháp mới thắp sáng bảy viên ngôi sao. </p>
<p>Tần Trầm tu vi mất hết, chỉ thu hoạch được hoàng cấp hạ phẩm công pháp 《 đạo
quyết 》, cũng có thể thắp sáng bảy viên ngôi sao? </p>
<p>&quot;Cái này! !&quot; </p>
<p>Chớ nói Lục Thiên Tuyết, thì liền kiến thức rộng rãi Tang Thanh Vân giờ phút
này cũng không biết nên như thế nào hình dung chính mình nội tâm chấn kinh. </p>
<p>Lục Trấn Nam bọn người càng là thân thể chấn động mãnh liệt, đã nói không ra
lời. </p>
<p>&quot;Lục Thiên Tuyết, ngươi cho ta mở to hai mắt nhìn rõ, cuối cùng là ai, ngưỡng
mộ người nào? ! !&quot; </p>
<p>Tần Trầm cuồng hống một tiếng, chợt, trong tay đột nhiên dùng lực. </p>
<p>Hắn là thiên kiêu chi tử, trước đó là, hiện tại cũng là! </p>
<p>Lục Thiên Tuyết có thể cướp đi hắn tu vi, nhưng là, này thiên phú, nàng là
đoạt không đi! </p>
<p>Thứ tám khỏa tinh điểm sáng! </p>
<p>Ngay sau đó, thứ chín khỏa ngôi sao, thắp sáng! </p>
<p>Cái này tư chất trắc thí trên tấm bia, chỉ có chín khỏa ngôi sao, chín khỏa
ngôi sao, thì đại biểu cái này tư chất trắc thí bia có thể trắc thí cực hạn. </p>
<p>Mà bây giờ, Tần Trầm liền đã đạt tới cực hạn này. </p>
<p>Cửu tinh tư chất! </p>
<p>Có một không hai yêu nghiệt! </p>
<p>&quot;Ta trời ơi! ! !&quot; </p>
<p>&quot;Đây là tình huống thế nào?&quot; </p>
<p>&quot;Tần Trầm quá khủng bố!&quot; </p>
<p>&quot;Cửu tinh tư chất, đây là ta Lôi Sơn thành lập thành đến nay đều chưa từng
xuất hiện có một không hai yêu nghiệt!&quot; </p>
<p>Tang Thanh Vân ngốc, triệt để ngốc. </p>
<p>Lục Trấn Nam càng là cảm giác trái tim đều muốn đột nhiên ngừng. </p>
<p>&quot;Cái này tuyệt đối không phải thật! !&quot; </p>
<p>Lục Thiên Tuyết nhìn lấy Tần Trầm, điên cuồng lắc đầu. </p>
<p>&quot;Không phải thật sự? Ha ha, không quan hệ, chân chính xem chút, còn ở phía sau
đâu!&quot; </p>
<p>Theo Tần Trầm vừa dứt lời, cái này tư chất trắc thí bia bỗng nhiên rung động
kịch liệt lên. </p>
<p>Oanh! </p>
<p>Tư chất trắc thí bia giống như đến cực hạn chịu đựng, trực tiếp vỡ ra.</p>', null, 4, 2)

INSERT INTO ChuongTruyen VALUES(N'Chương 5', 'chuong-5', N'<p>Điên! </p>
<p>Toàn bộ Lôi Sơn thành trên quảng trường, triệt để điên cuồng! </p>
<p>Cửu tinh tư chất! </p>
<p>Trực tiếp bạo bia! </p>
<p>Đây hết thảy, đều khiến mọi người chấn kinh, nhưng là cùng lúc đó, càng nhiều,
lại là nghi vấn. </p>
<p>&quot;Tình huống như thế nào? Trắc thí bia tại sao bạo?&quot; </p>
<p>&quot;Là xấu sao?&quot; </p>
<p>&quot;Tuyệt đối là, không phải vậy Tần Trầm không có khả năng thắp sáng chín khỏa
ngôi sao!&quot; </p>
<p>&quot;Vâng, trắc thí bia nhất định là xấu rơi, dạng này, hết thảy đều có thể giải
thích thông!&quot; </p>
<p>Trên quảng trường mặt người lộ kinh hãi ý. </p>
<p>Bạo bia loại chuyện này, bọn họ cho tới bây giờ đều chưa từng gặp qua, cho
nên, bọn họ đều cho rằng trắc thí bia hẳn là hư. </p>
<p>Dạng này, cũng có thể giải thích vì cái gì Tần Trầm có thể thu hoạch được cửu
tinh tư chất. </p>
<p>&quot;Thì ra là trắc thí bia hư!&quot; </p>
<p>Lục Thiên Tuyết cái này mới phản ứng được, trong lòng chấn kinh lúc này mới
thối lui. </p>
<p>Nhưng là giờ phút này, tất cả mọi người cho là nên là trắc thí bia hư mất, tất
cả mới có thể bạo bia, nhưng là, làm Thanh Càn Kiếm Tông trưởng lão, Tang
Thanh Vân vô cùng rõ ràng cuối cùng là xảy ra chuyện gì. </p>
<p>&quot;Đây là... Bạo bia ra thiên kiêu! ! !&quot; </p>
<p>Tang Thanh Vân đầu chấn động, cảm giác giống như bị lôi đình đánh trúng. </p>
<p>Hắn quá khiếp sợ! </p>
<p>Hắn dám nói chính mình nằm mơ đều không nghĩ tới, Tần Trầm tư chất, lại có thể
đạt đến một bước này! </p>
<p>Người khác không biết, nhưng là hắn là rất rõ. </p>
<p>Bạo bia, ý vị này, sẽ có thiên kiêu xuất hiện! </p>
<p>Nói một cách đơn giản, cũng là trắc thí bia đã trắc thí không Tần Trầm thiên
phú, cho nên, mới có thể bạo bia. </p>
<p>Oanh! </p>
<p>Bỗng nhiên, bầu trời thay đổi, một cỗ mênh mông khí tức phát ra. </p>
<p>&quot;Tình huống như thế nào?&quot; </p>
<p>&quot;Chuyện gì xảy ra?&quot; </p>
<p>Thiên địa này đột nhiên ở giữa biến ảo, để trên quảng trường người có chút bối
rối. </p>
<p>Oanh! </p>
<p>Lại là một đạo cự đại tiếng oanh minh, mọi người liền là có thể nhìn thấy, cái
kia trên bầu trời, lại là có một cái to lớn vô cùng bàn tay, từ trên trời
giáng xuống. </p>
<p>Toàn trường đều kinh ngạc đến ngây người, không hiểu chuyện này rốt cuộc là
như thế nào. </p>
<p>Giờ phút này, chỉ có Tang Thanh Vân, sắc mặt ngốc trệ, trong miệng tự lẩm bẩm. </p>
<p>&quot;Thiên Đạo ân sủng, thiên kiêu dị tượng! ! !&quot; </p>
<p>Oanh! </p>
<p>Lại là một đạo oanh minh, một con kia to lớn vô cùng bàn tay bỗng nhiên ở giữa
thì buông xuống đến Tần Trầm trên đầu. </p>
<p>&quot;Ta biết!&quot; </p>
<p>Bỗng nhiên có người hô to một tiếng. </p>
<p>&quot;Đây là... Một tay che trời! Đây là thiên kiêu dị tượng! Tần Trầm, có trở
thành thiên kiêu tư chất! !&quot; </p>
<p>Theo đạo này lời nói vang vọng, giữa sân người giờ mới hiểu được tới. </p>
<p>Như thế nào thiên kiêu? </p>
<p>Tên như ý nghĩa, thiên kiêu chi tử! </p>
<p>Loại người này, đến Thiên Đạo ân sủng, có thể tạo thành Thiên Đạo dị tượng,
chính là rồng trong loài người! </p>
<p>Một tay che trời, đây là nhất tinh thiên kiêu thiên kiêu dị tượng! </p>
<p>&quot;Thiên kiêu tư chất?&quot; </p>
<p>Lục Thiên Tuyết sắc mặt ngốc trệ. </p>
<p>Nàng tuy nhiên không biết đây hết thảy cuối cùng là xảy ra chuyện gì, nhưng là
nàng là biết cái gì là thiên kiêu. </p>
<p>Chỉ có chân chính thiên phú tuyệt luân hạng người, mới sẽ trở thành thiên
kiêu, đạt được thượng thiên ân sủng! </p>
<p>Loại tư chất này, siêu việt cửu tinh tư chất, vì, thiên kiêu tư chất! </p>
<p>Đây cũng chính là nói, Tần Trầm, tương lai là có thể trở thành một tên thiên
kiêu chi tử! </p>
<p>&quot;Điều đó không có khả năng! Tu vi mất hết, đan điền vỡ vụn, công pháp truyền
thừa chỉ là một cái công pháp hạ cấp nhất, làm sao có thể có thể thu hoạch
được thiên kiêu tư chất?&quot; </p>
<p>Lục Thiên Tuyết triệt để ngốc, chấn kinh ngốc, nàng không thể tin được đây hết
thảy. </p>
<p>&quot;Dựa vào cái gì? Dựa vào cái gì? ! !&quot; </p>
<p>Lục Thiên Tuyết điên, đôi mắt sung huyết, nàng toàn thân run rẩy, nhìn lấy Tần
Trầm, hô hấp dồn dập. </p>
<p>Dựa vào cái gì dạng này một cái phế vật, đều có thể có được Thiên Đạo ân sủng,
thu hoạch được thiên kiêu tư chất? </p>
<p>Vì cái gì ta không được? </p>
<p>Lục Thiên Tuyết mặt mũi tràn đầy dữ tợn, trước đó tuyệt mỹ giai nhân bộ dáng
trong nháy mắt tan thành mây khói. </p>
<p>Tần Trầm thần sắc đạm mạc nhìn trước mắt Lục Thiên Tuyết. </p>
<p>Hắn đột nhiên cảm giác được chính mình cái này sáu năm thật là ngu, lại là
theo một nữ nhân như vậy thật tình ở chung sáu năm. </p>
<p>Lục Thiên Tuyết cướp đi hắn tu vi, thậm chí vỡ vụn hắn đan điền. </p>
<p>Nhưng là! </p>
<p>Tu vi không, hắn còn có thể trọng tu! </p>
<p>Phá nát đan điền đã được chữa trị. </p>
<p>Hiện tại càng là thu hoạch được 《 Thôn Thần Ngộ Đạo Quyết 》 cùng thiên kiêu tư
chất. </p>
<p>Hắn tiền đồ, bừng sáng! </p>
<p>&quot;Ngươi rõ ràng không có tu vi, là sao có thể thu hoạch được thiên kiêu tư
chất?&quot; </p>
<p>Tang Thanh Vân đi vào Tần Trầm trước mặt, một mặt không hiểu. </p>
<p>Hắn lúc này mới phát hiện, Tần Trầm thế mà là căn bản không có tu vi! </p>
<p>Một cái không có tu vi phàm nhân, lại có thể thu hoạch được thiên kiêu tư
chất? </p>
<p>Cái này sao có thể! </p>
<p>Cái gì? ! </p>
<p>Theo Tang Thanh Vân một lời nói, hiện trường lại là vỡ tổ. </p>
<p>Thực bọn họ sớm liền phát hiện Tần Trầm trên thân biến hóa, nhưng là dù sao
bọn họ tu vi đều không cao, cho nên cũng không có khả năng phán đoán chính
xác. </p>
<p>Cho đến khi Tang Thanh Vân cái này một lời nói. </p>
<p>&quot;Một cái không có tu vi người, lại có thể thu hoạch được thiên kiêu tư chất?
Đây rốt cuộc là làm sao làm được?&quot; </p>
<p>&quot;Lúc trước hắn không phải Luyện Thể chín tầng tu vi a? Tại sao đột nhiên tu
vi mất hết?&quot; </p>
<p>&quot;Nhìn lấy cái này nhất định là phát sinh cái gì!&quot; </p>
<p>Quá khiếp sợ! </p>
<p>Không có tu vi có thể thu hoạch được thiên kiêu tư chất, đây quả thực nghe đều
chưa từng nghe qua! </p>
<p>Tần Trầm không để ý đến Tang Thanh Vân, mà chính là tay giơ lên trực chỉ Lục
Thiên Tuyết. </p>
<p>&quot;Lục Thiên Tuyết, sau ba tháng, chính là Lôi Châu tông môn thi đấu, đến lúc
đó, ta sẽ đem món nợ máu này, tự mình theo trên thân, đòi lại! !&quot; </p>
<p>Tần Trầm trực chỉ Lục Thiên Tuyết, ánh mắt sắc bén giống như lưỡi đao. </p>
<p>&quot;Trực tiếp tuyên chiến?&quot; </p>
<p>&quot;Cái này Tần Trầm theo Lục Thiên Tuyết ở giữa, cuối cùng phát sinh cái gì?&quot; </p>
<p>&quot;Bất quá, liền xem như thiên kiêu tư chất, bằng vào một cái hoàng cấp hạ phẩm
công pháp, ba tháng muốn muốn khiêu chiến Lục Thiên Tuyết? Không khỏi muốn
quá nhiều!&quot; </p>
<p>Lục Thiên Tuyết sắc mặt biến đổi, qua một lúc, sắc mặt nàng thì bình tĩnh trở
lại. </p>
<p>&quot;Ba tháng? Ta ngược lại muốn xem xem, ngươi là như thế nào tại ba tháng, vượt
qua ta! !&quot; </p>
<p>Lục Thiên Tuyết mặt lộ vẻ dữ tợn. </p>
<p>Tu vi mất hết, đan điền vỡ vụn, đừng nói ba tháng, coi như ba năm lại như thế
nào? </p>
<p>Phải biết, đan điền vỡ vụn, điều này đại biểu, cũng là cả đời không cách nào
tu luyện! </p>
<p>Mà liền xem như Tần Trầm có thể chữa trị đan điền. </p>
<p>Ba tháng liền nghĩ vượt qua nàng? </p>
<p>Chỉ bằng mượn một môn hoàng cấp hạ phẩm công pháp? </p>
<p>Đây quả thực là một chuyện cười! </p>
<p>&quot;Đan điền vỡ vụn, lại còn dám như thế đối Thiên Tuyết tuyên chiến?&quot; </p>
<p>&quot;Thật không biết ông trời là muốn như thế nào, thế mà là để dạng này một cái
phế vật thu hoạch được thiên kiêu tư chất!&quot; </p>
<p>Lục Trấn Nam bọn người sắc mặt âm trầm. </p>
<p>&quot;Tần Trầm!&quot; </p>
<p>Bỗng nhiên, Tang Thanh Vân mở miệng nói chuyện. </p>
<p>Tất cả mọi người nhìn sang. </p>
<p>&quot;Ngươi có bằng lòng hay không ta Thanh Càn Kiếm Tông?&quot; </p>
<p>Theo Tang Thanh Vân lời nói vang lên, toàn bộ quảng trường một mặt xôn xao. </p>
<p>Lục Thiên Tuyết càng là một mặt chấn kinh. </p>
<p>Không ai từng nghĩ tới, Tang Thanh Vân vậy mà lại đối Tần Trầm phát ra mời. </p>
<p>Có điều sau đó mọi người ngẫm lại. </p>
<p>Xác thực, coi như Tần Trầm hiện tại không có tu vi, nhưng là dù sao cũng là
thiên kiêu tư chất, mấy năm về sau, cũng nhất định có thể quật khởi. </p>
<p>Tang Thanh Vân nhìn trúng, là Tần Trầm tương lai! </p>
<p>Lục Thiên Tuyết sắc mặt âm trầm, nàng không nghĩ tới Tang Thanh Vân lại muốn
đem Tần Trầm kéo vào Thanh Càn Kiếm Tông. </p>
<p>Nàng cắn răng một cái, chuẩn bị đem Tần Trầm đan điền vỡ vụn sự việc nói ra. </p>
<p>Tần Trầm tiến vào Thanh Càn Kiếm Tông, đây là Lục Thiên Tuyết tuyệt đối không
muốn nhìn thấy sự việc. </p>
<p>Nàng cũng có thể tưởng tượng, một khi chính mình đem Tần Trầm đan điền vỡ vụn
sự việc nói ra, Tang Thanh Vân chắc là liền sẽ không ném ra ngoài cành ô liu. </p>
<p>Dù sao, đan điền vỡ vụn, không cách nào tu luyện, cũng không có nghe nói đan
điền vỡ vụn còn có thể chữa trị. </p>
<p>Cứ như vậy, cho dù là thiên kiêu tư chất, không thể tu luyện, cũng sẽ không có
bất luận cái gì tương lai! </p>
<p>Nhưng là, ngay lúc này, Tần Trầm lại là nói chuyện. </p>
<p>&quot;Thật xin lỗi, ta cự tuyệt!&quot; </p>
<p>Sau một khắc, lạnh lẽo lời nói, truyền khắp toàn trường.</p>', null, 5, 2)
