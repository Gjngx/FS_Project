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

INSERT INTO ChuongTruyen VALUES(N'Chương 1', 'chuong-1', N'Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.

	"A, ta không chết?" Đây là hắn ý niệm đầu tiên.

	Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.

	Đây là một cái ưu tú sát thủ bản năng phản ứng.

	Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.

	Ta làm sao sẽ như thế yếu ớt?

	Tiêu Dật, người Hoa, thiên tài võ học.

	Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.

	Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào thực chiến ý nghĩa lúc

	Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng lập nên 300 thắng liên tiếp kỳ tích ghi chép.

	Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có thể tại nắm đấm của hắn xuống chống nổi mười chiêu.

	''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm kỵ cùng hoảng sợ.

	Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận vua không ngai.

	Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.

	Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy thù lao.

	Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một phần ranh giới cuối cùng cùng trách nhiệm.

	Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.

	Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực cùng nhân vật.

	Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.

	Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc

	Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội thành viên không một may mắn thoát khỏi.

	Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.

	Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự định lẻn vào Hoa Hạ trộm mật lúc

	Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám sát.

	Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công cùng nhau chết oan chết uổng về sau

	Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường đại của hắn cùng tàn nhẫn.

	Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước vào Hoa Hạ nửa bước.

	Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.

	Người muốn giết hắn, nhiều vô số kể.

	Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến dọa người, cao cư bảng danh sách đệ nhất.

	Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không người dám nhắc tới lên cái này nhiệm vụ.

	Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.

	Treo thưởng không treo, nhưng không người dám tiếp.

	Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.

	Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học, lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật văn hoá.

	Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.

	Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.

	Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.

	Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh giết, đem di vật văn hoá thu hồi.

	Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.

	Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.

	Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều đứng đầu sát thủ

	Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.

	Một cái nhắm vào mình âm mưu.

	Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi ra.

	Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.

	Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay là trúng kế.

	Nhưng, Tiêu Dật không có sợ.

	Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.

	Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.

	Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá bên trong.

	Dị biến đột nhiên phát sinh.

	Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.

	Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi tới.

	Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.

	Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.

	Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.

	Vì chính là phòng ngừa ngoài ý muốn.

	Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.

	Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.

	Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.

	"Ha ha ha ha "

	Tiêu Dật không khỏi cất tiếng cười to.

	Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn cùng, đủ vốn.

	"Ách, đau quá." Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô cùng suy yếu cảm giác.

	"Không đúng, ta không chết." Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.

	Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!

	Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu

	"Cmn, lão tử vậy mà xuyên qua!"

	Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.

	Giờ phút này vẫn là không nhịn được văng tục.

	Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị thế giới.

	Có chút cùng loại với Địa Cầu cổ đại.

	Thế giới này, cường giả vi tôn, võ giả hoành hành.

	Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.

	Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một cái vừa mới chết đi con em gia tộc trên người.

	Xảo là, gia tộc này con em cũng gọi Tiêu Dật.

	Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia, đương đại gia chủ con độc nhất.

	Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí ẩn.

	Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.

	Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ nhục, cả ngày chịu đến ức hiếp.

	Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.

	"Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!" Tiêu Dật bĩu môi.

	Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được

	Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.

	Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.

	Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn, ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.

	Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.

	Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.

	Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn đã sớm cùng mình vị hôn thê có tư tình.

	Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ giả, càng là Ngũ trưởng lão chi tử.

	Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn, cũng đem hắn đẩy xuống vách núi.

	Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không thể nói, mắt không thể trợn.

	Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.

	Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi trên người hắn.

	"Thật ác độc nữ tử, thật là ác độc biểu ca." Tiêu Dật nhíu mày, trong mắt đều là băng lãnh.

	"Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn bộ chôn cùng, ngươi nhưng chết được như vậy uất ức." Tiêu Dật thở dài.

	"Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù này, ta liền giúp ngươi báo."

	Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái trùng hợp, dù là người này đã chết.

	Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.

	Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.

	Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.

	Võ hồn lại phân rất nhiều loại.

	Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn, rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây, mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.

	Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.

	Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả Võ hồn.

	Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.

	Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.

	Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao, heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.

	Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ cũng thiêu đốt hầu như không còn.

	Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.

	Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến đấu mạnh yếu.

	Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.

	"Võ giả, Võ hồn." Tiêu Dật khóe miệng nhếch ra một đạo ý cười, "Có ý tứ, mặc dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc."

	Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại, thậm chí là trợn mắt há hốc mồm.

	Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.

	Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.

	Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.

	Xích giai Võ hồn, Khống Hỏa Thú.

	"Cmn, đây là đang trêu chọc lão tử?" Tiêu Dật suýt chút nữa chửi ầm lên.

	Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.

	Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.

	Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó rất có thể liền phổ thông dã thú đều đánh không lại.

	Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.

	Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm đem nó nuốt.

	Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều có thể một cước đem nó đá bay.

	"Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước kia lúc nào cũng bị người phế vật phế vật mắng lấy." Tiêu Dật bó tay rồi.

	Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ gia súc Võ hồn còn muốn không bằng.

	Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất định lực lượng tăng phúc.

	Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.

	Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.

	Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói, so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa đều ngại vướng bận.

	Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ có yếu nhất Phàm cảnh nhất trọng.

	Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu dụng Võ hồn.

	Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.

	Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc ức hiếp, bị tất cả mọi người chỗ xem thường.

	Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.

	"Được rồi, núi dựa núi lở, dựa vào người người ngã." Tiêu Dật xóa đi trong lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, "Dựa vào ta một thân Hình Ý Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông ra thuộc về chính ta một mảnh bầu trời."

	Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại nhìn thể nội Võ hồn liếc mắt.

	Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.

	"Ừm?" Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.

	Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.

	Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn nữa còn là màu tím sậm.

	"Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn, hơn nữa còn là màu tím Võ hồn." Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.

	Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử vong kẻ cầm đầu.

	Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh này Băng Loan Kiếm.

	"Tại sao có thể như vậy?" Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi mà không rõ.

	Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng điều tra cái này di vật văn hoá.

	Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.

	Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.

	Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều mạng tranh đoạt bảo vật.

	Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.

	"Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể thiếu ngươi công lao." Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng khẳng định.

	"Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc chậc." Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.

	Như gặp nhảy dấu, ta cũng không có cách, tiểu Bát xin lỗi.', null, 1, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 2', 'chuong-2', N'Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.

	"A, ta không chết?" Đây là hắn ý niệm đầu tiên.

	Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.

	Đây là một cái ưu tú sát thủ bản năng phản ứng.

	Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.

	Ta làm sao sẽ như thế yếu ớt?

	Tiêu Dật, người Hoa, thiên tài võ học.

	Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.

	Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào thực chiến ý nghĩa lúc

	Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng lập nên 300 thắng liên tiếp kỳ tích ghi chép.

	Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có thể tại nắm đấm của hắn xuống chống nổi mười chiêu.

	''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm kỵ cùng hoảng sợ.

	Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận vua không ngai.

	Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.

	Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy thù lao.

	Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một phần ranh giới cuối cùng cùng trách nhiệm.

	Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.

	Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực cùng nhân vật.

	Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.

	Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc

	Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội thành viên không một may mắn thoát khỏi.

	Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.

	Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự định lẻn vào Hoa Hạ trộm mật lúc

	Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám sát.

	Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công cùng nhau chết oan chết uổng về sau

	Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường đại của hắn cùng tàn nhẫn.

	Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước vào Hoa Hạ nửa bước.

	Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.

	Người muốn giết hắn, nhiều vô số kể.

	Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến dọa người, cao cư bảng danh sách đệ nhất.

	Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không người dám nhắc tới lên cái này nhiệm vụ.

	Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.

	Treo thưởng không treo, nhưng không người dám tiếp.

	Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.

	Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học, lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật văn hoá.

	Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.

	Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.

	Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.

	Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh giết, đem di vật văn hoá thu hồi.

	Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.

	Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.

	Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều đứng đầu sát thủ

	Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.

	Một cái nhắm vào mình âm mưu.

	Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi ra.

	Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.

	Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay là trúng kế.

	Nhưng, Tiêu Dật không có sợ.

	Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.

	Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.

	Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá bên trong.

	Dị biến đột nhiên phát sinh.

	Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.

	Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi tới.

	Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.

	Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.

	Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.

	Vì chính là phòng ngừa ngoài ý muốn.

	Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.

	Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.

	Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.

	"Ha ha ha ha "

	Tiêu Dật không khỏi cất tiếng cười to.

	Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn cùng, đủ vốn.

	"Ách, đau quá." Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô cùng suy yếu cảm giác.

	"Không đúng, ta không chết." Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.

	Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!

	Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu

	"Cmn, lão tử vậy mà xuyên qua!"

	Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.

	Giờ phút này vẫn là không nhịn được văng tục.

	Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị thế giới.

	Có chút cùng loại với Địa Cầu cổ đại.

	Thế giới này, cường giả vi tôn, võ giả hoành hành.

	Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.

	Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một cái vừa mới chết đi con em gia tộc trên người.

	Xảo là, gia tộc này con em cũng gọi Tiêu Dật.

	Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia, đương đại gia chủ con độc nhất.

	Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí ẩn.

	Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.

	Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ nhục, cả ngày chịu đến ức hiếp.

	Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.

	"Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!" Tiêu Dật bĩu môi.

	Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được

	Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.

	Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.

	Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn, ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.

	Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.

	Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.

	Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn đã sớm cùng mình vị hôn thê có tư tình.

	Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ giả, càng là Ngũ trưởng lão chi tử.

	Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn, cũng đem hắn đẩy xuống vách núi.

	Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không thể nói, mắt không thể trợn.

	Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.

	Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi trên người hắn.

	"Thật ác độc nữ tử, thật là ác độc biểu ca." Tiêu Dật nhíu mày, trong mắt đều là băng lãnh.

	"Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn bộ chôn cùng, ngươi nhưng chết được như vậy uất ức." Tiêu Dật thở dài.

	"Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù này, ta liền giúp ngươi báo."

	Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái trùng hợp, dù là người này đã chết.

	Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.

	Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.

	Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.

	Võ hồn lại phân rất nhiều loại.

	Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn, rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây, mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.

	Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.

	Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả Võ hồn.

	Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.

	Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.

	Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao, heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.

	Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ cũng thiêu đốt hầu như không còn.

	Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.

	Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến đấu mạnh yếu.

	Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.

	"Võ giả, Võ hồn." Tiêu Dật khóe miệng nhếch ra một đạo ý cười, "Có ý tứ, mặc dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc."

	Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại, thậm chí là trợn mắt há hốc mồm.

	Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.

	Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.

	Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.

	Xích giai Võ hồn, Khống Hỏa Thú.

	"Cmn, đây là đang trêu chọc lão tử?" Tiêu Dật suýt chút nữa chửi ầm lên.

	Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.

	Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.

	Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó rất có thể liền phổ thông dã thú đều đánh không lại.

	Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.

	Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm đem nó nuốt.

	Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều có thể một cước đem nó đá bay.

	"Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước kia lúc nào cũng bị người phế vật phế vật mắng lấy." Tiêu Dật bó tay rồi.

	Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ gia súc Võ hồn còn muốn không bằng.

	Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất định lực lượng tăng phúc.

	Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.

	Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.

	Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói, so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa đều ngại vướng bận.

	Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ có yếu nhất Phàm cảnh nhất trọng.

	Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu dụng Võ hồn.

	Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.

	Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc ức hiếp, bị tất cả mọi người chỗ xem thường.

	Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.

	"Được rồi, núi dựa núi lở, dựa vào người người ngã." Tiêu Dật xóa đi trong lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, "Dựa vào ta một thân Hình Ý Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông ra thuộc về chính ta một mảnh bầu trời."

	Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại nhìn thể nội Võ hồn liếc mắt.

	Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.

	"Ừm?" Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.

	Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.

	Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn nữa còn là màu tím sậm.

	"Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn, hơn nữa còn là màu tím Võ hồn." Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.

	Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử vong kẻ cầm đầu.

	Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh này Băng Loan Kiếm.

	"Tại sao có thể như vậy?" Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi mà không rõ.

	Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng điều tra cái này di vật văn hoá.

	Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.

	Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.

	Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều mạng tranh đoạt bảo vật.

	Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.

	"Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể thiếu ngươi công lao." Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng khẳng định.

	"Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc chậc." Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.

	Như gặp nhảy dấu, ta cũng không có cách, tiểu Bát xin lỗi.', null, 2, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 3', 'chuong-3', N'Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.

	"A, ta không chết?" Đây là hắn ý niệm đầu tiên.

	Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.

	Đây là một cái ưu tú sát thủ bản năng phản ứng.

	Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.

	Ta làm sao sẽ như thế yếu ớt?

	Tiêu Dật, người Hoa, thiên tài võ học.

	Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.

	Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào thực chiến ý nghĩa lúc

	Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng lập nên 300 thắng liên tiếp kỳ tích ghi chép.

	Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có thể tại nắm đấm của hắn xuống chống nổi mười chiêu.

	''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm kỵ cùng hoảng sợ.

	Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận vua không ngai.

	Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.

	Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy thù lao.

	Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một phần ranh giới cuối cùng cùng trách nhiệm.

	Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.

	Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực cùng nhân vật.

	Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.

	Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc

	Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội thành viên không một may mắn thoát khỏi.

	Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.

	Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự định lẻn vào Hoa Hạ trộm mật lúc

	Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám sát.

	Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công cùng nhau chết oan chết uổng về sau

	Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường đại của hắn cùng tàn nhẫn.

	Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước vào Hoa Hạ nửa bước.

	Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.

	Người muốn giết hắn, nhiều vô số kể.

	Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến dọa người, cao cư bảng danh sách đệ nhất.

	Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không người dám nhắc tới lên cái này nhiệm vụ.

	Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.

	Treo thưởng không treo, nhưng không người dám tiếp.

	Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.

	Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học, lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật văn hoá.

	Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.

	Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.

	Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.

	Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh giết, đem di vật văn hoá thu hồi.

	Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.

	Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.

	Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều đứng đầu sát thủ

	Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.

	Một cái nhắm vào mình âm mưu.

	Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi ra.

	Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.

	Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay là trúng kế.

	Nhưng, Tiêu Dật không có sợ.

	Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.

	Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.

	Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá bên trong.

	Dị biến đột nhiên phát sinh.

	Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.

	Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi tới.

	Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.

	Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.

	Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.

	Vì chính là phòng ngừa ngoài ý muốn.

	Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.

	Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.

	Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.

	"Ha ha ha ha "

	Tiêu Dật không khỏi cất tiếng cười to.

	Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn cùng, đủ vốn.

	"Ách, đau quá." Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô cùng suy yếu cảm giác.

	"Không đúng, ta không chết." Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.

	Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!

	Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu

	"Cmn, lão tử vậy mà xuyên qua!"

	Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.

	Giờ phút này vẫn là không nhịn được văng tục.

	Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị thế giới.

	Có chút cùng loại với Địa Cầu cổ đại.

	Thế giới này, cường giả vi tôn, võ giả hoành hành.

	Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.

	Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một cái vừa mới chết đi con em gia tộc trên người.

	Xảo là, gia tộc này con em cũng gọi Tiêu Dật.

	Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia, đương đại gia chủ con độc nhất.

	Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí ẩn.

	Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.

	Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ nhục, cả ngày chịu đến ức hiếp.

	Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.

	"Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!" Tiêu Dật bĩu môi.

	Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được

	Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.

	Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.

	Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn, ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.

	Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.

	Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.

	Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn đã sớm cùng mình vị hôn thê có tư tình.

	Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ giả, càng là Ngũ trưởng lão chi tử.

	Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn, cũng đem hắn đẩy xuống vách núi.

	Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không thể nói, mắt không thể trợn.

	Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.

	Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi trên người hắn.

	"Thật ác độc nữ tử, thật là ác độc biểu ca." Tiêu Dật nhíu mày, trong mắt đều là băng lãnh.

	"Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn bộ chôn cùng, ngươi nhưng chết được như vậy uất ức." Tiêu Dật thở dài.

	"Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù này, ta liền giúp ngươi báo."

	Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái trùng hợp, dù là người này đã chết.

	Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.

	Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.

	Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.

	Võ hồn lại phân rất nhiều loại.

	Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn, rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây, mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.

	Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.

	Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả Võ hồn.

	Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.

	Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.

	Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao, heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.

	Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ cũng thiêu đốt hầu như không còn.

	Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.

	Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến đấu mạnh yếu.

	Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.

	"Võ giả, Võ hồn." Tiêu Dật khóe miệng nhếch ra một đạo ý cười, "Có ý tứ, mặc dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc."

	Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại, thậm chí là trợn mắt há hốc mồm.

	Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.

	Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.

	Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.

	Xích giai Võ hồn, Khống Hỏa Thú.

	"Cmn, đây là đang trêu chọc lão tử?" Tiêu Dật suýt chút nữa chửi ầm lên.

	Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.

	Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.

	Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó rất có thể liền phổ thông dã thú đều đánh không lại.

	Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.

	Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm đem nó nuốt.

	Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều có thể một cước đem nó đá bay.

	"Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước kia lúc nào cũng bị người phế vật phế vật mắng lấy." Tiêu Dật bó tay rồi.

	Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ gia súc Võ hồn còn muốn không bằng.

	Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất định lực lượng tăng phúc.

	Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.

	Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.

	Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói, so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa đều ngại vướng bận.

	Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ có yếu nhất Phàm cảnh nhất trọng.

	Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu dụng Võ hồn.

	Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.

	Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc ức hiếp, bị tất cả mọi người chỗ xem thường.

	Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.

	"Được rồi, núi dựa núi lở, dựa vào người người ngã." Tiêu Dật xóa đi trong lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, "Dựa vào ta một thân Hình Ý Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông ra thuộc về chính ta một mảnh bầu trời."

	Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại nhìn thể nội Võ hồn liếc mắt.

	Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.

	"Ừm?" Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.

	Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.

	Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn nữa còn là màu tím sậm.

	"Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn, hơn nữa còn là màu tím Võ hồn." Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.

	Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử vong kẻ cầm đầu.

	Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh này Băng Loan Kiếm.

	"Tại sao có thể như vậy?" Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi mà không rõ.

	Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng điều tra cái này di vật văn hoá.

	Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.

	Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.

	Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều mạng tranh đoạt bảo vật.

	Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.

	"Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể thiếu ngươi công lao." Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng khẳng định.

	"Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc chậc." Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.

	Như gặp nhảy dấu, ta cũng không có cách, tiểu Bát xin lỗi.', null, 3, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 4', 'chuong-4', N'Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.

	"A, ta không chết?" Đây là hắn ý niệm đầu tiên.

	Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.

	Đây là một cái ưu tú sát thủ bản năng phản ứng.

	Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.

	Ta làm sao sẽ như thế yếu ớt?

	Tiêu Dật, người Hoa, thiên tài võ học.

	Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.

	Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào thực chiến ý nghĩa lúc

	Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng lập nên 300 thắng liên tiếp kỳ tích ghi chép.

	Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có thể tại nắm đấm của hắn xuống chống nổi mười chiêu.

	''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm kỵ cùng hoảng sợ.

	Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận vua không ngai.

	Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.

	Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy thù lao.

	Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một phần ranh giới cuối cùng cùng trách nhiệm.

	Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.

	Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực cùng nhân vật.

	Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.

	Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc

	Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội thành viên không một may mắn thoát khỏi.

	Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.

	Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự định lẻn vào Hoa Hạ trộm mật lúc

	Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám sát.

	Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công cùng nhau chết oan chết uổng về sau

	Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường đại của hắn cùng tàn nhẫn.

	Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước vào Hoa Hạ nửa bước.

	Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.

	Người muốn giết hắn, nhiều vô số kể.

	Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến dọa người, cao cư bảng danh sách đệ nhất.

	Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không người dám nhắc tới lên cái này nhiệm vụ.

	Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.

	Treo thưởng không treo, nhưng không người dám tiếp.

	Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.

	Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học, lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật văn hoá.

	Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.

	Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.

	Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.

	Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh giết, đem di vật văn hoá thu hồi.

	Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.

	Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.

	Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều đứng đầu sát thủ

	Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.

	Một cái nhắm vào mình âm mưu.

	Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi ra.

	Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.

	Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay là trúng kế.

	Nhưng, Tiêu Dật không có sợ.

	Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.

	Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.

	Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá bên trong.

	Dị biến đột nhiên phát sinh.

	Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.

	Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi tới.

	Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.

	Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.

	Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.

	Vì chính là phòng ngừa ngoài ý muốn.

	Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.

	Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.

	Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.

	"Ha ha ha ha "

	Tiêu Dật không khỏi cất tiếng cười to.

	Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn cùng, đủ vốn.

	"Ách, đau quá." Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô cùng suy yếu cảm giác.

	"Không đúng, ta không chết." Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.

	Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!

	Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu

	"Cmn, lão tử vậy mà xuyên qua!"

	Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.

	Giờ phút này vẫn là không nhịn được văng tục.

	Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị thế giới.

	Có chút cùng loại với Địa Cầu cổ đại.

	Thế giới này, cường giả vi tôn, võ giả hoành hành.

	Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.

	Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một cái vừa mới chết đi con em gia tộc trên người.

	Xảo là, gia tộc này con em cũng gọi Tiêu Dật.

	Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia, đương đại gia chủ con độc nhất.

	Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí ẩn.

	Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.

	Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ nhục, cả ngày chịu đến ức hiếp.

	Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.

	"Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!" Tiêu Dật bĩu môi.

	Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được

	Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.

	Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.

	Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn, ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.

	Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.

	Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.

	Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn đã sớm cùng mình vị hôn thê có tư tình.

	Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ giả, càng là Ngũ trưởng lão chi tử.

	Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn, cũng đem hắn đẩy xuống vách núi.

	Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không thể nói, mắt không thể trợn.

	Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.

	Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi trên người hắn.

	"Thật ác độc nữ tử, thật là ác độc biểu ca." Tiêu Dật nhíu mày, trong mắt đều là băng lãnh.

	"Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn bộ chôn cùng, ngươi nhưng chết được như vậy uất ức." Tiêu Dật thở dài.

	"Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù này, ta liền giúp ngươi báo."

	Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái trùng hợp, dù là người này đã chết.

	Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.

	Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.

	Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.

	Võ hồn lại phân rất nhiều loại.

	Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn, rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây, mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.

	Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.

	Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả Võ hồn.

	Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.

	Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.

	Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao, heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.

	Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ cũng thiêu đốt hầu như không còn.

	Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.

	Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến đấu mạnh yếu.

	Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.

	"Võ giả, Võ hồn." Tiêu Dật khóe miệng nhếch ra một đạo ý cười, "Có ý tứ, mặc dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc."

	Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại, thậm chí là trợn mắt há hốc mồm.

	Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.

	Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.

	Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.

	Xích giai Võ hồn, Khống Hỏa Thú.

	"Cmn, đây là đang trêu chọc lão tử?" Tiêu Dật suýt chút nữa chửi ầm lên.

	Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.

	Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.

	Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó rất có thể liền phổ thông dã thú đều đánh không lại.

	Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.

	Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm đem nó nuốt.

	Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều có thể một cước đem nó đá bay.

	"Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước kia lúc nào cũng bị người phế vật phế vật mắng lấy." Tiêu Dật bó tay rồi.

	Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ gia súc Võ hồn còn muốn không bằng.

	Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất định lực lượng tăng phúc.

	Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.

	Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.

	Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói, so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa đều ngại vướng bận.

	Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ có yếu nhất Phàm cảnh nhất trọng.

	Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu dụng Võ hồn.

	Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.

	Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc ức hiếp, bị tất cả mọi người chỗ xem thường.

	Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.

	"Được rồi, núi dựa núi lở, dựa vào người người ngã." Tiêu Dật xóa đi trong lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, "Dựa vào ta một thân Hình Ý Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông ra thuộc về chính ta một mảnh bầu trời."

	Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại nhìn thể nội Võ hồn liếc mắt.

	Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.

	"Ừm?" Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.

	Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.

	Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn nữa còn là màu tím sậm.

	"Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn, hơn nữa còn là màu tím Võ hồn." Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.

	Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử vong kẻ cầm đầu.

	Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh này Băng Loan Kiếm.

	"Tại sao có thể như vậy?" Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi mà không rõ.

	Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng điều tra cái này di vật văn hoá.

	Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.

	Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.

	Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều mạng tranh đoạt bảo vật.

	Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.

	"Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể thiếu ngươi công lao." Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng khẳng định.

	"Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc chậc." Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.

	Như gặp nhảy dấu, ta cũng không có cách, tiểu Bát xin lỗi.', null, 4, 1)

INSERT INTO ChuongTruyen VALUES(N'Chương 1', 'chuong-1', N'Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.

	"A, ta không chết?" Đây là hắn ý niệm đầu tiên.

	Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.

	Đây là một cái ưu tú sát thủ bản năng phản ứng.

	Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.

	Ta làm sao sẽ như thế yếu ớt?

	Tiêu Dật, người Hoa, thiên tài võ học.

	Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.

	Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào thực chiến ý nghĩa lúc

	Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng lập nên 300 thắng liên tiếp kỳ tích ghi chép.

	Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có thể tại nắm đấm của hắn xuống chống nổi mười chiêu.

	''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm kỵ cùng hoảng sợ.

	Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận vua không ngai.

	Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.

	Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy thù lao.

	Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một phần ranh giới cuối cùng cùng trách nhiệm.

	Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.

	Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực cùng nhân vật.

	Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.

	Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc

	Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội thành viên không một may mắn thoát khỏi.

	Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.

	Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự định lẻn vào Hoa Hạ trộm mật lúc

	Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám sát.

	Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công cùng nhau chết oan chết uổng về sau

	Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường đại của hắn cùng tàn nhẫn.

	Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước vào Hoa Hạ nửa bước.

	Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.

	Người muốn giết hắn, nhiều vô số kể.

	Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến dọa người, cao cư bảng danh sách đệ nhất.

	Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không người dám nhắc tới lên cái này nhiệm vụ.

	Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.

	Treo thưởng không treo, nhưng không người dám tiếp.

	Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.

	Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học, lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật văn hoá.

	Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.

	Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.

	Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.

	Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh giết, đem di vật văn hoá thu hồi.

	Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.

	Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.

	Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều đứng đầu sát thủ

	Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.

	Một cái nhắm vào mình âm mưu.

	Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi ra.

	Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.

	Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay là trúng kế.

	Nhưng, Tiêu Dật không có sợ.

	Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.

	Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.

	Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá bên trong.

	Dị biến đột nhiên phát sinh.

	Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.

	Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi tới.

	Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.

	Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.

	Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.

	Vì chính là phòng ngừa ngoài ý muốn.

	Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.

	Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.

	Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.

	"Ha ha ha ha "

	Tiêu Dật không khỏi cất tiếng cười to.

	Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn cùng, đủ vốn.

	"Ách, đau quá." Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô cùng suy yếu cảm giác.

	"Không đúng, ta không chết." Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.

	Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!

	Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu

	"Cmn, lão tử vậy mà xuyên qua!"

	Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.

	Giờ phút này vẫn là không nhịn được văng tục.

	Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị thế giới.

	Có chút cùng loại với Địa Cầu cổ đại.

	Thế giới này, cường giả vi tôn, võ giả hoành hành.

	Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.

	Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một cái vừa mới chết đi con em gia tộc trên người.

	Xảo là, gia tộc này con em cũng gọi Tiêu Dật.

	Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia, đương đại gia chủ con độc nhất.

	Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí ẩn.

	Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.

	Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ nhục, cả ngày chịu đến ức hiếp.

	Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.

	"Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!" Tiêu Dật bĩu môi.

	Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được

	Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.

	Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.

	Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn, ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.

	Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.

	Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.

	Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn đã sớm cùng mình vị hôn thê có tư tình.

	Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ giả, càng là Ngũ trưởng lão chi tử.

	Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn, cũng đem hắn đẩy xuống vách núi.

	Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không thể nói, mắt không thể trợn.

	Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.

	Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi trên người hắn.

	"Thật ác độc nữ tử, thật là ác độc biểu ca." Tiêu Dật nhíu mày, trong mắt đều là băng lãnh.

	"Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn bộ chôn cùng, ngươi nhưng chết được như vậy uất ức." Tiêu Dật thở dài.

	"Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù này, ta liền giúp ngươi báo."

	Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái trùng hợp, dù là người này đã chết.

	Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.

	Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.

	Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.

	Võ hồn lại phân rất nhiều loại.

	Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn, rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây, mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.

	Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.

	Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả Võ hồn.

	Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.

	Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.

	Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao, heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.

	Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ cũng thiêu đốt hầu như không còn.

	Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.

	Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến đấu mạnh yếu.

	Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.

	"Võ giả, Võ hồn." Tiêu Dật khóe miệng nhếch ra một đạo ý cười, "Có ý tứ, mặc dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc."

	Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại, thậm chí là trợn mắt há hốc mồm.

	Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.

	Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.

	Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.

	Xích giai Võ hồn, Khống Hỏa Thú.

	"Cmn, đây là đang trêu chọc lão tử?" Tiêu Dật suýt chút nữa chửi ầm lên.

	Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.

	Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.

	Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó rất có thể liền phổ thông dã thú đều đánh không lại.

	Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.

	Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm đem nó nuốt.

	Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều có thể một cước đem nó đá bay.

	"Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước kia lúc nào cũng bị người phế vật phế vật mắng lấy." Tiêu Dật bó tay rồi.

	Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ gia súc Võ hồn còn muốn không bằng.

	Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất định lực lượng tăng phúc.

	Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.

	Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.

	Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói, so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa đều ngại vướng bận.

	Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ có yếu nhất Phàm cảnh nhất trọng.

	Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu dụng Võ hồn.

	Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.

	Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc ức hiếp, bị tất cả mọi người chỗ xem thường.

	Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.

	"Được rồi, núi dựa núi lở, dựa vào người người ngã." Tiêu Dật xóa đi trong lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, "Dựa vào ta một thân Hình Ý Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông ra thuộc về chính ta một mảnh bầu trời."

	Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại nhìn thể nội Võ hồn liếc mắt.

	Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.

	"Ừm?" Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.

	Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.

	Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn nữa còn là màu tím sậm.

	"Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn, hơn nữa còn là màu tím Võ hồn." Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.

	Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử vong kẻ cầm đầu.

	Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh này Băng Loan Kiếm.

	"Tại sao có thể như vậy?" Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi mà không rõ.

	Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng điều tra cái này di vật văn hoá.

	Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.

	Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.

	Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều mạng tranh đoạt bảo vật.

	Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.

	"Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể thiếu ngươi công lao." Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng khẳng định.

	"Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc chậc." Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.

	Như gặp nhảy dấu, ta cũng không có cách, tiểu Bát xin lỗi.', null, 1, 2)

INSERT INTO ChuongTruyen VALUES(N'Chương 2', 'chuong-2', N'Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.

	"A, ta không chết?" Đây là hắn ý niệm đầu tiên.

	Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.

	Đây là một cái ưu tú sát thủ bản năng phản ứng.

	Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.

	Ta làm sao sẽ như thế yếu ớt?

	Tiêu Dật, người Hoa, thiên tài võ học.

	Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.

	Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào thực chiến ý nghĩa lúc

	Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng lập nên 300 thắng liên tiếp kỳ tích ghi chép.

	Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có thể tại nắm đấm của hắn xuống chống nổi mười chiêu.

	''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm kỵ cùng hoảng sợ.

	Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận vua không ngai.

	Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.

	Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy thù lao.

	Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một phần ranh giới cuối cùng cùng trách nhiệm.

	Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.

	Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực cùng nhân vật.

	Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.

	Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc

	Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội thành viên không một may mắn thoát khỏi.

	Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.

	Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự định lẻn vào Hoa Hạ trộm mật lúc

	Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám sát.

	Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công cùng nhau chết oan chết uổng về sau

	Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường đại của hắn cùng tàn nhẫn.

	Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước vào Hoa Hạ nửa bước.

	Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.

	Người muốn giết hắn, nhiều vô số kể.

	Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến dọa người, cao cư bảng danh sách đệ nhất.

	Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không người dám nhắc tới lên cái này nhiệm vụ.

	Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.

	Treo thưởng không treo, nhưng không người dám tiếp.

	Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.

	Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học, lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật văn hoá.

	Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.

	Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.

	Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.

	Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh giết, đem di vật văn hoá thu hồi.

	Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.

	Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.

	Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều đứng đầu sát thủ

	Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.

	Một cái nhắm vào mình âm mưu.

	Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi ra.

	Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.

	Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay là trúng kế.

	Nhưng, Tiêu Dật không có sợ.

	Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.

	Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.

	Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá bên trong.

	Dị biến đột nhiên phát sinh.

	Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.

	Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi tới.

	Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.

	Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.

	Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.

	Vì chính là phòng ngừa ngoài ý muốn.

	Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.

	Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.

	Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.

	"Ha ha ha ha "

	Tiêu Dật không khỏi cất tiếng cười to.

	Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn cùng, đủ vốn.

	"Ách, đau quá." Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô cùng suy yếu cảm giác.

	"Không đúng, ta không chết." Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.

	Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!

	Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu

	"Cmn, lão tử vậy mà xuyên qua!"

	Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.

	Giờ phút này vẫn là không nhịn được văng tục.

	Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị thế giới.

	Có chút cùng loại với Địa Cầu cổ đại.

	Thế giới này, cường giả vi tôn, võ giả hoành hành.

	Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.

	Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một cái vừa mới chết đi con em gia tộc trên người.

	Xảo là, gia tộc này con em cũng gọi Tiêu Dật.

	Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia, đương đại gia chủ con độc nhất.

	Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí ẩn.

	Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.

	Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ nhục, cả ngày chịu đến ức hiếp.

	Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.

	"Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!" Tiêu Dật bĩu môi.

	Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được

	Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.

	Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.

	Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn, ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.

	Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.

	Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.

	Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn đã sớm cùng mình vị hôn thê có tư tình.

	Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ giả, càng là Ngũ trưởng lão chi tử.

	Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn, cũng đem hắn đẩy xuống vách núi.

	Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không thể nói, mắt không thể trợn.

	Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.

	Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi trên người hắn.

	"Thật ác độc nữ tử, thật là ác độc biểu ca." Tiêu Dật nhíu mày, trong mắt đều là băng lãnh.

	"Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn bộ chôn cùng, ngươi nhưng chết được như vậy uất ức." Tiêu Dật thở dài.

	"Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù này, ta liền giúp ngươi báo."

	Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái trùng hợp, dù là người này đã chết.

	Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.

	Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.

	Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.

	Võ hồn lại phân rất nhiều loại.

	Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn, rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây, mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.

	Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.

	Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả Võ hồn.

	Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.

	Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.

	Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao, heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.

	Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ cũng thiêu đốt hầu như không còn.

	Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.

	Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến đấu mạnh yếu.

	Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.

	"Võ giả, Võ hồn." Tiêu Dật khóe miệng nhếch ra một đạo ý cười, "Có ý tứ, mặc dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc."

	Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại, thậm chí là trợn mắt há hốc mồm.

	Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.

	Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.

	Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.

	Xích giai Võ hồn, Khống Hỏa Thú.

	"Cmn, đây là đang trêu chọc lão tử?" Tiêu Dật suýt chút nữa chửi ầm lên.

	Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.

	Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.

	Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó rất có thể liền phổ thông dã thú đều đánh không lại.

	Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.

	Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm đem nó nuốt.

	Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều có thể một cước đem nó đá bay.

	"Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước kia lúc nào cũng bị người phế vật phế vật mắng lấy." Tiêu Dật bó tay rồi.

	Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ gia súc Võ hồn còn muốn không bằng.

	Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất định lực lượng tăng phúc.

	Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.

	Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.

	Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói, so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa đều ngại vướng bận.

	Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ có yếu nhất Phàm cảnh nhất trọng.

	Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu dụng Võ hồn.

	Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.

	Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc ức hiếp, bị tất cả mọi người chỗ xem thường.

	Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.

	"Được rồi, núi dựa núi lở, dựa vào người người ngã." Tiêu Dật xóa đi trong lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, "Dựa vào ta một thân Hình Ý Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông ra thuộc về chính ta một mảnh bầu trời."

	Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại nhìn thể nội Võ hồn liếc mắt.

	Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.

	"Ừm?" Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.

	Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.

	Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn nữa còn là màu tím sậm.

	"Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn, hơn nữa còn là màu tím Võ hồn." Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.

	Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử vong kẻ cầm đầu.

	Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh này Băng Loan Kiếm.

	"Tại sao có thể như vậy?" Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi mà không rõ.

	Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng điều tra cái này di vật văn hoá.

	Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.

	Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.

	Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều mạng tranh đoạt bảo vật.

	Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.

	"Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể thiếu ngươi công lao." Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng khẳng định.

	"Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc chậc." Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.

	Như gặp nhảy dấu, ta cũng không có cách, tiểu Bát xin lỗi.', null, 2, 2)

INSERT INTO ChuongTruyen VALUES(N'Chương 3', 'chuong-3', N'Cổ kính trong gian phòng, Tiêu Dật bỗng nhiên tỉnh rồi.

	"A, ta không chết?" Đây là hắn ý niệm đầu tiên.

	Nháy mắt sau đó, hắn chú ý tới mình đang đứng ở một cái trong hoàn cảnh lạ lẫm. Không có chút gì do dự, giơ tay hướng dưới thân một vỗ, chuẩn bị vọt lên.

	Đây là một cái ưu tú sát thủ bản năng phản ứng.

	Tay vừa dứt xuống, đau đớn kịch liệt đánh tới, để cánh tay hắn mềm nhũn.

	Ta làm sao sẽ như thế yếu ớt?

	Tiêu Dật, người Hoa, thiên tài võ học.

	Một vị tu luyện ra nội lực Hình Ý Quyền Tông sư.

	Làm những cái kia vô tri ngoại quốc lão trào phúng Hoa Hạ võ thuật chỉ là khoa chân múa tay, chỉ có thể dùng cho thưởng thức công dụng, không có chút nào thực chiến ý nghĩa lúc

	Hắn giận mà ra tay, quét ngang thế giới tất cả dưới mặt đất quyền đàn, cũng lập nên 300 thắng liên tiếp kỳ tích ghi chép.

	Đối thủ không thiếu đai lưng vàng quyền vương, nhưng từ không một người có thể tại nắm đấm của hắn xuống chống nổi mười chiêu.

	''Hình Ý Quyền'' ba chữ, trở thành toàn bộ thế giới dưới mặt đất quyền đàn cấm kỵ cùng hoảng sợ.

	Hắn hay là cái sát thủ, sát thủ bảng xếp hạng đệ nhất, sát thủ giới công nhận vua không ngai.

	Xuất đạo đến nay, nhiệm vụ xác suất thành công đạt tới doạ người 100%.

	Nghĩ mời hắn người xuất thủ chạy theo như vịt, thậm chí không tiếc hết thảy thù lao.

	Nhưng, hắn có sát thủ đạo đức nghề nghiệp, nhưng cũng có thân là người Hoa một phần ranh giới cuối cùng cùng trách nhiệm.

	Chỉ cần là đối với Hoa Hạ bất lợi nhiệm vụ, một mực không tiếp.

	Hắn yêu tổ quốc của hắn, căm thù hết thảy ý đồ đối với Hoa Hạ bất lợi thế lực cùng nhân vật.

	Dù thân ở nước ngoài, nhưng thủy chung tâm hệ tổ quốc.

	Làm một cái cấp độ SSS đoàn lính đánh thuê không nhìn cảnh cáo của hắn, cao giọng tiếp nhận một phần căm thù Hoa Hạ nhiệm vụ bí mật lúc

	Hắn giận mà ra tay, đối với cái này ghi tên thế giới đoàn lính đánh thuê đệ nhất đoàn đội triển khai máu tanh đồ sát, vẻn vẹn một đêm, toàn bộ đoàn đội thành viên không một may mắn thoát khỏi.

	Từ đó, Hoa Hạ trở thành lính đánh thuê cấm địa. Lại xú danh chiêu chương, hung danh hiển hách lính đánh thuê, cũng không dám đi Hoa Hạ giương oai.

	Làm nước Mỹ những cái kia tự cao tự đại đặc công cùng gián điệp bí mật, dự định lẻn vào Hoa Hạ trộm mật lúc

	Hắn không chút do dự đối với mấy cái này đặc công tiến hành cực kỳ tàn ác ám sát.

	Tại mấy vị kia đã trở thành nước Mỹ đặc công giới nhân vật truyền kỳ đặc công cùng nhau chết oan chết uổng về sau

	Những cái kia tự cao tự đại nước Mỹ đặc công cuối cùng kiến thức đến sự cường đại của hắn cùng tàn nhẫn.

	Từ đó, Hoa Hạ trở thành nước ngoài đặc công câm như hến khủng bố chi địa. Lại nghiêm chỉnh huấn luyện, lại xuất sắc nước ngoài đặc công, cũng không dám bước vào Hoa Hạ nửa bước.

	Chuyện đương nhiên, hắn bởi vậy kết đếm mãi không hết cừu gia.

	Người muốn giết hắn, nhiều vô số kể.

	Ở thế giới hắc đạo bảng treo thưởng bên trên, hắn truy sát treo thưởng cao đến dọa người, cao cư bảng danh sách đệ nhất.

	Nhưng mà, làm từng cái đứng đầu sát thủ, từng cái nhân vật truyền kỳ, tại tiếp cái này truy sát nhiệm vụ, liên tiếp bốc hơi khỏi nhân gian về sau, lại không người dám nhắc tới lên cái này nhiệm vụ.

	Giết Tiêu Dật, thành hắc đạo bảng treo thưởng một hạng cấm kỵ.

	Treo thưởng không treo, nhưng không người dám tiếp.

	Mấy ngày trước, hắn thông qua đặc thù đường tắt thu đến một tin tức.

	Một chi nước ngoài lính đánh thuê đoàn đội, ngụy trang thành nhà khảo cổ học, lẻn vào Hoa Hạ, tại nào đó di tích đào được một cái giá trị liên thành di vật văn hoá.

	Hơn nữa, đã bí mật vận ra nước ngoài bên ngoài.

	Đối với cái này, Tiêu Dật đương nhiên sẽ không ngồi nhìn mặc kệ.

	Mênh mông Hoa Hạ trọng bảo, há có thể lưu lạc nước ngoài.

	Hắn lúc này đuổi kịp chi này lính đánh thuê đoàn đội, cũng đem bọn hắn đánh giết, đem di vật văn hoá thu hồi.

	Ngay tại hắn chuẩn bị tiêu sái rời đi lúc.

	Hơn 100 cái cầm trong tay súng ống người vây quanh hắn.

	Hắn liếc mắt một cái liền nhận ra những người này, có rất nhiều nước Mỹ tinh anh đặc công, có rất nhiều hung danh ở bên ngoài lính đánh thuê, có rất nhiều đứng đầu sát thủ

	Tiêu Dật trong nháy mắt rõ ràng, đây là một cái âm mưu.

	Một cái nhắm vào mình âm mưu.

	Chi kia lính đánh thuê đoàn đội chỉ là cái ngụy trang, vì chính là dẫn hắn đi ra.

	Nhiều mặt thế lực liên thủ, chỉ là vì giết hắn.

	Mặc hắn lại khôn khéo, tại đây nhiều mặt liên thủ bố trí âm mưu xuống, hắn hay là trúng kế.

	Nhưng, Tiêu Dật không có sợ.

	Hắn có lòng tin, liều mạng trọng thương một cái giá lớn giết ra khỏi trùng vây, ngày sau sẽ chậm chậm tìm đám người này tính sổ sách không muộn.

	Ngay tại hắn giết ra một đường máu, chuẩn bị thoát đi lúc.

	Trên vết thương máu tươi nhỏ xuống đến mang Trung Hoa mùa hè di vật văn hoá bên trong.

	Dị biến đột nhiên phát sinh.

	Hắn như bị sét đánh, thân thể run lên, tứ chi không có sức.

	Hắn chỉ có thể không cam lòng, trơ mắt nhìn địch nhân cười gằn hướng hắn đi tới.

	Không có ai biết, Tiêu Dật trên người một mực có một cái uy lực mạnh mẽ bom.

	Viên này bom, đủ để đem phạm vi 100m nổ thành tro tàn.

	Cho dù là lại đơn giản nhiệm vụ, Tiêu Dật đều sẽ mang theo viên này bom.

	Vì chính là phòng ngừa ngoài ý muốn.

	Làm hắn làm nổ bom trong nháy mắt, địch nhân cười gằn biến thành khủng hoảng.

	Cái kia kịch liệt nổ tung, đem hắn cùng với sở hữu địch nhân toàn bộ bao phủ.

	Tiêu Dật trích lời, vĩnh viễn muốn có át chủ bài, như thế, dù là chính mình chết rồi, địch nhân cũng không có cơ hội cười xuống dưới.

	"Ha ha ha ha "

	Tiêu Dật không khỏi cất tiếng cười to.

	Đáng giá, coi như lão tử chết rồi, có thể để các ngươi tất cả mọi người chôn cùng, đủ vốn.

	"Ách, đau quá." Tiêu Dật tiếng cười im bặt mà dừng, thể nội truyền đến vô cùng suy yếu cảm giác.

	"Không đúng, ta không chết." Tiêu Dật ngẩn người, nghi ngờ đến cực điểm.

	Có thể cảm nhận được thân thể yếu ớt, chứng minh chính mình không chết!

	Một giây sau, một cỗ lạ lẫm ký ức tràn vào trong đầu

	"Cmn, lão tử vậy mà xuyên qua!"

	Dù là Tiêu Dật sớm đã coi nhẹ sinh tử, trải qua sóng to gió lớn.

	Giờ phút này vẫn là không nhịn được văng tục.

	Nơi này đã không phải là Địa Cầu, mà là một cái tên là Viêm Long đại lục dị thế giới.

	Có chút cùng loại với Địa Cầu cổ đại.

	Thế giới này, cường giả vi tôn, võ giả hoành hành.

	Chỉ cần có đầy đủ thực lực, ngươi liền có thể áp đảo cao hơn hết.

	Mà chính mình sở dĩ không có chết, là bởi vì xuyên qua cũng bám thân đến một cái vừa mới chết đi con em gia tộc trên người.

	Xảo là, gia tộc này con em cũng gọi Tiêu Dật.

	Cái này Tiêu Dật, chính là Tử Vân thành một trong tam đại gia tộc, Tiêu gia, đương đại gia chủ con độc nhất.

	Chỉ có điều, hắn còn nhỏ mất mẹ, phụ thân cũng ở nhiều năm trước mất tích bí ẩn.

	Tuổi nhỏ hắn, do trong gia tộc một vị trưởng lão nuôi dưỡng lớn lên.

	Bây giờ 16 tuổi, cũng chỉ có Phàm cảnh nhất trọng bé nhỏ thực lực, kém xa người đồng lứa. Chịu lấy ''Thiếu gia chủ'' danh hiệu, lại là toàn cả gia tộc sỉ nhục, cả ngày chịu đến ức hiếp.

	Ở trong mắt mọi người, hắn là cái phế vật từ đầu đến chân.

	"Gọi giống vậy Tiêu Dật, ngươi thế nào lẫn vào thảm như vậy!" Tiêu Dật bĩu môi.

	Về phần hắn vì sao lại chết, Tiêu Dật theo trong trí nhớ biết được

	Mấy ngày trước, vị hôn thê của hắn Mộ Dung Kiều Nhi hẹn hắn đến phía sau núi.

	Đần độn hắn, còn tưởng rằng là mỹ nhân làm bạn, hẹn hắn hẹn hò.

	Làm hắn đi đến cuộc hẹn lúc, mới phát hiện phía sau núi bên trên chờ đợi hắn, ngoại trừ Mộ Dung Kiều Nhi, còn có biểu ca của hắn Tiêu Nhược Hàn.

	Mà Tiêu Nhược Hàn, đã sớm muốn diệt trừ hắn.

	Tại hắn không thể tin lại xen lẫn hoảng sợ cùng ánh mắt phẫn nộ bên trong, Mộ Dung Kiều Nhi cùng Tiêu Nhược Hàn hôn vào cùng một chỗ.

	Thẳng đến trước khi chết hắn mới biết được, nguyên lai biểu ca Tiêu Nhược Hàn đã sớm cùng mình vị hôn thê có tư tình.

	Tiêu Nhược Hàn chính là Tiêu gia nổi danh thiên tài, Phàm cảnh thất trọng võ giả, càng là Ngũ trưởng lão chi tử.

	Kết quả có thể nghĩ, Tiêu Nhược Hàn một chưởng làm vỡ nát tâm mạch của hắn, cũng đem hắn đẩy xuống vách núi.

	Làm hắn bị người theo dưới vách núi cứu trở về lúc, đã thoi thóp, miệng không thể nói, mắt không thể trợn.

	Dưới loại thương thế nghiêm trọng kia, thân thể cùng tâm lý song trọng tra tấn, hắn vẻn vẹn chống ba ngày, liền trên giường chết thẳng cẳng.

	Cũng là ở thời điểm này, Tiêu Dật xuyên qua cũng bám thân đến đã chết đi trên người hắn.

	"Thật ác độc nữ tử, thật là ác độc biểu ca." Tiêu Dật nhíu mày, trong mắt đều là băng lãnh.

	"Đồng dạng là chết ở dưới âm mưu, lão tử tốt xấu để đám kia khốn khiếp toàn bộ chôn cùng, ngươi nhưng chết được như vậy uất ức." Tiêu Dật thở dài.

	"Thôi, tất nhiên chiếm thân thể của ngươi, lão tử mới có thể trọng sinh, thù này, ta liền giúp ngươi báo."

	Tiêu Dật không thích nợ ơn người khác, dù là nhân tình này chỉ là một cái trùng hợp, dù là người này đã chết.

	Thầm nghĩ thôi, Tiêu Dật lần nữa sửa sang lại một cái trong đầu lạ lẫm ký ức.

	Thế giới này võ giả, có một loại đặc thù thiên phú, thức tỉnh Võ hồn.

	Thức tỉnh tuổi tác càng sớm, thiên phú càng mạnh, Võ hồn cũng càng lợi hại.

	Võ hồn lại phân rất nhiều loại.

	Khí võ hồn: Đao, thương, kiếm, kích, tiễn, búa,,, ; Thú võ hồn: Sư, hổ, vượn, rắn,,, thậm chí cường đại yêu thú võ hồn; hệ thực vật Võ hồn: Hoa, cỏ, cây, mộc,,, thậm chí trân quý mà nắm giữ đặc hiệu thiên tài địa bảo.

	Đương nhiên, còn có mặt khác các loại vượt qua người tưởng tượng kỳ dị Võ hồn.

	Tóm lại, chỉ cần là thế giới này nắm giữ sự vật, đều có thể trở thành võ giả Võ hồn.

	Mà Võ hồn, theo thấp đến cao, lại phân đỏ cam vàng lục lam chàm tím Thất giai.

	Cấp bậc càng cao, Võ hồn tự nhiên là càng mạnh.

	Giống Xích giai Võ hồn, phần lớn là chút vật tầm thường, tỉ như phổ thông đao, heo chó dê bò chờ gia súc, ven đường hoa dại cỏ dại chờ chút.

	Mà cao giai Võ hồn, tỉ như Tiêu gia nổi danh thiên tài Tiêu Nhược Hàn, thì là Hoàng giai Võ hồn Hỏa Vân Mãng. Một khi phát động công kích, thao túng Hỏa Vân Mãng, hỏa diễm ngập trời, trong khoảnh khắc liền có thể đem địch nhân thôn phệ cũng thiêu đốt hầu như không còn.

	Có thể nói, Võ hồn là thế giới này võ giả trọng yếu nhất đồ vật.

	Nó quyết định võ giả tương lai, tốc độ tu luyện, thủ đoạn công kích, sức chiến đấu mạnh yếu.

	Tóm lại, thức tỉnh ra càng lợi hại Võ hồn, đại biểu cho cái võ giả này thiên phú càng mạnh, ngày sau cũng càng dễ dàng trở thành một phương cường giả.

	"Võ giả, Võ hồn." Tiêu Dật khóe miệng nhếch ra một đạo ý cười, "Có ý tứ, mặc dù bỏ mình, nhưng có thể đi tới thế giới này, có lẽ về sau sẽ rất xuất sắc."

	Nhưng mà, một giây sau, khóe miệng của hắn ý cười trong nháy mắt dừng lại, thậm chí là trợn mắt há hốc mồm.

	Bởi vì, hắn thoáng cảm giác một cái trong cơ thể mình Võ hồn.

	Võ hồn, tồn tại ở võ giả thể nội đan điền bên cạnh.

	Mà bây giờ chính mình đan điền bên cạnh, đang có một cái giống cầu, ngơ ngác ngốc ngốc đồ vật, toàn thân tản ra yếu ớt màu đỏ ánh sáng.

	Xích giai Võ hồn, Khống Hỏa Thú.

	"Cmn, đây là đang trêu chọc lão tử?" Tiêu Dật suýt chút nữa chửi ầm lên.

	Khống Hỏa Thú, nhìn tên này tựa hồ rất trâu.

	Nhưng kì thực, đây là một loại tại dã ngoại hoang vu cực kỳ cấp thấp yêu thú.

	Càng nghiêm chỉnh mà nói, nó là trong yêu thú sỉ nhục cùng phế vật, bởi vì, nó rất có thể liền phổ thông dã thú đều đánh không lại.

	Cả ngày ngơ ngác ngốc ngốc, lấy con thỏ chờ nhỏ yếu động vật làm thức ăn.

	Cho dù là đến một cái có điểm hung ác tàn lang hổ báo đều có thể một ngụm đem nó nuốt.

	Thậm chí, cho dù là một cái không có tu vi phổ thông người trưởng thành, đều có thể một cước đem nó đá bay.

	"Cmn, huynh đệ, ngươi vậy mà thức tỉnh ra cái đồ chơi này, khó trách trước kia lúc nào cũng bị người phế vật phế vật mắng lấy." Tiêu Dật bó tay rồi.

	Khống Hỏa Thú, được vinh dự rác rưởi nhất Võ hồn. Dù cho tại cấp thấp nhất Xích giai Võ hồn bên trong, đó cũng là hạng chót tồn tại, so heo chó dê bò chờ gia súc Võ hồn còn muốn không bằng.

	Tối thiểu những cái kia gia súc Võ hồn, còn có thể cho võ giả cung cấp nhất định lực lượng tăng phúc.

	Mà Khống Hỏa Thú, duy nhất giao phó võ giả, chỉ có ''Khống hỏa'' kỹ năng.

	Tiêu Dật tại chỗ thí nghiệm một cái, thao túng thể nội Võ hồn, trong lòng bàn tay đột nhiên tung ra một đoàn ngọn lửa nhỏ.

	Chỉ là, cái này đoàn ngọn lửa nhỏ, dùng Tiêu Dật kiếp trước lời nói tới nói, so cái bật lửa còn không bằng, đừng nói dùng để công kích, dùng để nhóm lửa đều ngại vướng bận.

	Cái khác võ giả, 16 tuổi tối thiểu có Phàm cảnh tam trọng tu vi, hắn cũng chỉ có yếu nhất Phàm cảnh nhất trọng.

	Cái khác võ giả, giống trong Tiêu gia con em, phổ biến đều là Chanh giai Võ hồn, liền là tư chất độ chênh lệch, cũng là Xích giai bên trong so sánh hữu dụng Võ hồn.

	Hắn nhưng thức tỉnh ra vô dụng nhất Khống Hỏa Thú.

	Khó trách hắn có ''Thiếu gia chủ'' danh hiệu, nhưng cả ngày bị con em gia tộc ức hiếp, bị tất cả mọi người chỗ xem thường.

	Võ hồn, cơ hồ quyết định võ giả một đời thành tựu.

	"Được rồi, núi dựa núi lở, dựa vào người người ngã." Tiêu Dật xóa đi trong lòng khó chịu, trong mắt đều là vẻ kiêu ngạo, "Dựa vào ta một thân Hình Ý Quyền tuyệt học, coi như không dựa vào Võ hồn, cũng có thể ở thế giới này xông ra thuộc về chính ta một mảnh bầu trời."

	Tiêu Dật thu hồi lòng bàn tay đoàn kia ''Đáng thương'' hỏa diễm, lười nhác lại nhìn thể nội Võ hồn liếc mắt.

	Đúng vào lúc này, hắn nhưng bỗng nhiên cứng lại.

	"Ừm?" Tiêu Dật nhíu mày, lập tức sắc mặt đại biến.

	Bởi vì, ở trong người đan điền bên cạnh, ngoại trừ cái kia nhỏ yếu Khống Hỏa Thú Võ hồn bên ngoài; lại còn có mặt khác một đoàn đồ vật.

	Vật kia, hiện lên ''Hình kiếm'', toàn thân tản ra loá mắt hào quang màu tím, hơn nữa còn là màu tím sậm.

	"Cái này cái này đây là Băng Loan Kiếm, nó nó như thế nào trở thành ta Võ hồn, hơn nữa còn là màu tím Võ hồn." Tiêu Dật vừa ngạc nhiên vừa mừng rỡ.

	Băng Loan Kiếm, không phải thế giới này đồ vật, mà là để Tiêu Dật ở Địa Cầu tử vong kẻ cầm đầu.

	Không tệ, Tiêu Dật lúc trước muốn cướp về Hoa Hạ di vật văn hoá, liền là thanh này Băng Loan Kiếm.

	"Tại sao có thể như vậy?" Dù là Tiêu Dật được chứng kiến người, nhưng nghĩ mãi mà không rõ.

	Mấy ngày trước, làm Tiêu Dật nhận được tin tức, cũng ra tay trước, đã từng điều tra cái này di vật văn hoá.

	Nhưng mà, lấy hắn tên sát thủ này giới vua không ngai năng lực, lại ngay cả Băng Loan Kiếm một tí tin tức đều kiểm tra không ra.

	Chỉ biết là, thanh kiếm này lai lịch cực kỳ thần bí, liền lịch sử ghi chép đều không có, ngược lại là lưu lại một chút truyền thuyết thần thoại.

	Nghe nói, đây là một cái thời kỳ thượng cổ, vô số tiên nhân đại thần đều liều mạng tranh đoạt bảo vật.

	Lúc ấy, Tiêu Dật còn đối với mấy cái này truyền thuyết thần thoại khịt mũi coi thường; nhưng bây giờ, hắn nhưng cải biến ý nghĩ.

	"Nhìn đến, lai lịch của ngươi quả nhiên bất phàm. Mà lại, ta có thể bình yên xuyên qua đến thế giới này, giành lấy cuộc sống mới, cũng khẳng định không thể thiếu ngươi công lao." Tiêu Dật suy đoán, nhưng kỳ thật trong lòng đã vô cùng khẳng định.

	"Song sinh Võ hồn, trong đó một cái hay là cường đại nhất màu tím Võ hồn, chậc chậc." Tiêu Dật nguyên bản tâm tình buồn bực chuyển biến làm vẻ mong đợi.

	Như gặp nhảy dấu, ta cũng không có cách, tiểu Bát xin lỗi.', null, 3, 2)


