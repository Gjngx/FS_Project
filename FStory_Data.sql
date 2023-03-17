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
	SoChuong INT,
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

--Admins

INSERT INTO Admins VALUES (1, 'admin','admin',1) 

--Users

INSERT INTO Users VALUES (1, N'Đặng Nhật Giang', N'Nam', '2002/10/26', '0378687955', 'giangdang2k2@gmail.com', 'user', 'user', 1, 1)

--Thể Loại

INSERT INTO TheLoai VALUES (1, N'Huyền Ảo', 'huyen-ao' ) 
INSERT INTO TheLoai VALUES (2, N'Hài Hước', 'hai-huoc') 
INSERT INTO TheLoai VALUES (3, N'Huyền Huyễn', 'huyen-huyen') 
INSERT INTO TheLoai VALUES (4, N'Lịch Sử', 'lich-su' ) 
INSERT INTO TheLoai VALUES (5, N'Hệ Thống', 'he-thong') 
INSERT INTO TheLoai VALUES (6, N'Dị Năng', 'di-nang') 
INSERT INTO TheLoai VALUES (7, N'Trinh Thám', 'trinh-tham' ) 
INSERT INTO TheLoai VALUES (8, N'Cổ Đại', 'co-dai') 
INSERT INTO TheLoai VALUES (9, N'Kiếm Hiệp', 'kiem-hiep') 

--Tác Giả

INSERT INTO TacGia VALUES (1, N'Tiểu Tiểu Bát', 'tieu-tieu-bat') 
INSERT INTO TacGia VALUES (2, N'Hồ Đồ Tiếu Tiếu', 'ho-do-tieu-tieu') 
INSERT INTO TacGia VALUES (3, N'Thập Nguyệt Lưu Niên', 'thap-nguyet-luu-nien') 
INSERT INTO TacGia VALUES (4, N'Mạc Hỏa Tiểu Mạt', 'mac-hoa-tieu-mat') 
INSERT INTO TacGia VALUES (5, N'Hỏa Tiểu Huyên', 'hoa-tieu-huyen') 
INSERT INTO TacGia VALUES (6, N'Vân Ngoại Thiên Đô', 'van-ngoai-thien-do') 

--Trạng Thái

INSERT INTO TrangThai VALUES (1, N'Hoàn Thành') 
INSERT INTO TrangThai VALUES (2, N'Đang Cập Nhật') 

--Truyen

INSERT INTO Truyen VALUES (1, 1, 7, 1, N'Hồn Đế Vũ Thần', 'hon-de-vu-than', 'hon-de-vu-than.jpg', N'Hình Ý Quyền Tông sư Tiêu Dật hồn xuyên dị giới. Tại cái này võ giả hoành hành thế giới, Tiêu Dật đến nghịch thiên Võ hồn, mở ra một đoạn nghiền ép đương thời vô số thiên tài, thành tựu Hồn Đế Võ Thần con đường cường giả. Nát bấy thiên địa, đánh vỡ bầu trời, bao trùm chư thiên vạn giới', 12000, '2021-12-03 20:33:11.260')
INSERT INTO Truyen VALUES (2, 6, 2, 2, N'Thôn Thần Chí Tôn', 'thon-than-chi-ton', 'thon-than-chi-ton.jpg', N'Thượng cổ thời kỳ, thần ma chúa tể thế giới, lưu lại vô số truyền thừa! Thiếu niên Tần Trầm, lấy được Thôn Thần Ngộ Đạo Quyết, thôn phệ thần ma truyền thừa, lĩnh ngộ vạn thiên đạo pháp, thành tựu đệ nhất chí tôn! Ta Thôn Thần nhất tộc lúc trở về, chính là cái này vạn thiên thế giới, rung động ngày!', 3000, '2021-12-03 20:33:33.827')
INSERT INTO Truyen VALUES (3, 4, 3, 2, N'Dị Giới Vô Địch Hệ Thống', 'di-gioi-vo-dich-he-thong', 'di-gioi-vo-dich-he-thong.jpg', N'Tu luyện kỳ hiệu giết người giết quái đẳng cấp bão táp! Rút thưởng công năng Thần kỹ Thần binh cầm tới mềm tay! Phó chức hệ thống Thần đan Thánh phù nhẹ nhõm luyện chế .Trạch nam Thần Thân mang theo vô địch hệ thống vượt qua mà đến, đánh quái bạo bí tịch, giết người làm rơi đồ, tay trái Hàng Long 128 chưởng, tay phải chư thiên Càn Khôn Đại Na Di, uy áp Tam Giới, cuối cùng trở thành vô địch Chí Tôn!', 4000, '2021-12-03 20:33:38.873')
INSERT INTO Truyen VALUES (4, 5, 6, 1, N'Trọng Sinh Chi Tối Cường Kiếm Thần', 'trong-sinh-chi-toi-cuong-kiem-than', 'trong-sinh-chi-toi-cuong-kiem-than.jpg', N'Thạch Phong trọng sinh mang theo trí nhớ mười năm từng chơi game, bắt đầu làm lại từ đầu. Mở ra Studio Game của mình, mở ra một cuộc sống mới. Kỹ xảo kiếm tiền! Công lược đánh phó bản! Nhiệm vụ truyền kỳ! Xuất sứ trang bị! Kỹ xảo chiến đấu mà người khác không biết! Bí mật mà ngay cả Phong Trắc Giả cũng không biết, hắn đều biết.', 12319, '2021-12-03 20:33:41.890')
INSERT INTO Truyen VALUES (5, 3, 4, 2, N'Cổ Chân Nhân', 'co-chan-nhan', 'co-chan-nhan.jpg', N'Người là vạn vật chi linh, Cổ là thiên địa chân tinh Tam quan bất chính, ma đầu tái sinh. Chuyện về một người xuyên qua không ngừng sống lại. Một thế giới kì lạ của người nuôi Cổ, dùng Cổ, luyện Cổ. Xuân Thu Thiền, Nguyệt Quang Cổ, Tửu Trùng, Nhất Khí Kim Quang Trùng, Thanh Ti Cổ, Hi Vọng Cổ...... Một tuyệt thế ma đầu thỏa chí tung hoành!', 12838, '2021-12-30 11:11:47.663')

INSERT INTO Truyen VALUES (6, 5, 8, 1, N'Bán Tiên', 'ban-tien', 'ban-tien.jpg', N'Kẻ hèn này bất tài, tuổi vừa mới mười chín, từ nhỏ liền là một gã đạo sĩ, trên có sư huynh hơn mười vị trí, dưới duy hơn nhỏ nhất, tục xưng quan môn đệ tử. Sư môn nghèo quá, các sư huynh khó nhịn kham khổ, may mắn Chưởng môn sư tôn rộng rãi, mặc cho các sư huynh giải thể mà đi.', 12080, '2021-12-30 11:18:21.920')
INSERT INTO Truyen VALUES (7, 2, 1, 1, N'Giang Sơn Mỹ Sắc', 'giang-son-my-sac', 'giang-son-my-sac.jpg', N'Thịnh thế Đường triều có thể nói là điểm sáng chói nhất trong lịch sử trung hoa, bởi xét về khía cạnh lãnh thổ lẫn văn hóa, đế chế này có phần nổi bật hơn cả nhà Hán khi ảnh hưởng và móng vuốt của nó lan tràn khắp cả thế giới. Không những vậy, Đường Thái Tông Lý Thế Dân còn được công nhận là một trong những đại đế thế giới đầy quyền lực nhất. Chính vì ánh sáng quang huy của triều đại này quá rực rỡ, mơ hồ che đựng hết thảy diễn biến lịch sử thời đại xung quanh nó khiến người khác lãng quên đi nhà Tùy, một triều đại đoản mệnh nhưng nếu so sánh về ý nghĩa lịch sử với nhà Đường chỉ có hơn không kém.', 30090, '2021-12-30 11:19:31.313')
INSERT INTO Truyen VALUES (8, 4, 8, 2, N'Đế Yến', 'de-yen', 'de-yen.jpg', N'Tu luyện kỳ hiệu giết người giết quái đẳng cấp bão táp! Rút thưởng công năng Thần kỹ Thần binh cầm tới mềm tay! Phó chức hệ thống Thần đan Thánh phù nhẹ nhõm luyện chế .Trạch nam Thần Thân mang theo vô địch hệ thống vượt qua mà đến, đánh quái bạo bí tịch, giết người làm rơi đồ, tay trái Hàng Long 128 chưởng, tay phải chư thiên Càn Khôn Đại Na Di, uy áp Tam Giới, cuối cùng trở thành vô địch Chí Tôn!', 4700, '2021-12-30 11:22:51.990')
INSERT INTO Truyen VALUES (9, 6, 5, 1, N'Nghịch Thiên Tà Thần', 'nghich-thien-ta-than', 'nghich-thien-ta-than.jpg', N'Chưởng Thiên Độc chi châu, thừa Tà Thần chi huyết, tu nghịch thiên chi lực. Nhất đại Tà Thần, quân lâm thiên hạ!', 12329, '2021-12-30 11:24:41.293')
INSERT INTO Truyen VALUES (10, 1, 9, 2, N'Khắp Chốn Giang Hồ Đều Là Thổ Hào', 'khap-chon-giang-ho-deu-la-tho-hao', 'khap-chon-giang-ho-deu-la-tho-hao.jpg', N'Kiếp trước Thẩm Thiên Lăng là một ảnh đế vô cùng nổi tiếng, nay lại được người ta sắp đặt cho một vị hôn thê không giống ai, không giống ai bởi vì hắn được sắp đặt gả cho một ông chồng. Vừa nghe thấy tin này Thẩm Thiên Lăng giống như bị sét đánh trúng đầu! Vì sao vị hôn thê của hắn lại là một gã đàn ông chứ? Dù sao không phải một em gái đáng yêu e thẹn dáng người mảnh mai, thì một bà chị già tóc quăn bưởi to đều được mà.', 12838, '2021-12-30 11:11:47.663')

INSERT INTO Truyen VALUES (11, 1, 7, 1, N'Huyến Vực Mê Đồ', 'huyet-vuc-me-do', 'huyet-vuc-me-do.jpg', N'Nội dung truyện xoay quanh đề tài mỗi một kẻ yêu nghiệt đều hy vọng có thể kiếm được một trung khuyển công, Sera đương nhiên không ngoại lệ. Vì thế cậu hứng thú bừng bừng, siêng năng, chịu thương chịu khó triển khai nhiệm vụ câu dẫn vĩ đại. Mặt than? Lạnh nhạt? Né tránh? Không thành vấn đề. Chuốc rượu, cởi sạch, lăn lên giường! Sau đó… Ê ê, anh rốt cuộc có làm được không? Tôi sẽ đau a!', 12000, '2021-11-03 20:33:11.260')
INSERT INTO Truyen VALUES (12, 6, 2, 2, N'Trường Cấp Ba Sơn Hải', 'truong-cap-ba-son-hai', 'truong-cap-ba-son-hai.jpg', N'Trường cấp ba Sơn Hải bên trong ngoại trừ những học sinh phổ thông bình thường, còn có một quần ( sơn hải kinh)* bên trong là những tiểu yêu quái, bọn họ ngụy trang thành dáng dấp của con người. Mỗi ngày nghiêm túc học tập, tích cực chuẩn bị chiến tranh đi thi đại học. Lâm Cạnh là học sinh mới, tại ngày khai giảng thứ nhất, liền bị người đứng thứ nhất từ dưới lên trên của lớp – Quý Tinh Lăng hiểu lầm thành tiểu yêu quái mình phải bảo vệ, bởi vậy dẫn đến một loạt sự cố. Bất quá Quý Tinh Lăng rất nhanh liền phát hiện, bạn cùng bàn mới của mình không hề yên tĩnh, khi thi đấu lại còn —— vừa hiếu thắng lại vừa có sức chiến đấu, còn có tính khiết phích, kỹ năng độc miệng: MAX.', 3050, '2021-12-06 20:37:33.827')
INSERT INTO Truyen VALUES (13, 4, 3, 2, N'Nhất Kiếm Sương Hàn', 'nhat-kiem-suong-han', 'nhat-kiem-suong-han.jpg', N'Tiêu vương Quý Yên Nhiên là một người tao nhã thanh thoát, lại còn có võ công cao cường. Bao nhiều người ngưỡng mộ đều tự suy đoán rằng, một vị hoàng tộc cao quý, phong lưu như Tiêu vương, ý trung nhân chắc chắn cũng sẽ là một người tài tình, có thể lên được phòng khách, xuống được phòng bếp, tinh thông mọi thứ, như vậy mới có thể cầm sắt hoà minh cùng vương gia.', 4060, '2021-12-03 20:31:38.873')
INSERT INTO Truyen VALUES (14, 5, 6, 1, N'Lui Ra Để Trẩm Đến', 'lui-ra-de-tram-den', 'lui-ra-de-tram-den.jpg', N'Thẩm Đường tỉnh lại trên đường đi đày, phát hiện thế giới này rất phản khoa học. Thần thạch trên trời rơi xuống, trăm quốc tương tranh. Văn ngưng Văn tâm, xuất khẩu thành thật. Võ tụ Võ đảm, phá núi đoạn biển. Tiểu bạch kiểm cô cho là, một câu "Hoành thương thúc ngựa", một giây sau mũ giáp phụ thân, trường thương trong tay, một người thành quân, thiên quân vạn mã khả năng gϊếŧ thất tiến thất xuất!', 16319, '2021-12-04 20:33:41.890')
INSERT INTO Truyen VALUES (15, 3, 4, 2, N'Đô Thị Thần Nhân', 'do-thi-than-nhan', 'do-thi-than-nhan.jpg', N'Chàng trai xui xẻo Lưu Vũ Phi, bước qua mười bảy cái xuân xanh, vừa thi rớt, lại vừa bị bạn gái đá, trong lúc đau khổ được cha mẹ cho tiền đi du lịch khuây khỏa thoải mái tâm tình. Không hiểu sao hắn lại hứng thú chọn điểm đến Côn Lôn, vùng đất thần thoại với những truyền thuyết về các vị thần tiên. Người ta kể rằng đó là một truyền thuyết từ hàng vạn năm trước Tây Vương Mẫu đã tu luyện ở Dao Trì, địa danh nổi tiếng nhất Côn Lôn và đã đắc đạo, phi thăng thần giới.', 13838, '2021-12-30 09:11:47.663')

INSERT INTO Truyen VALUES (16, 5, 8, 1, N'Kiều Thế Như Vân', 'kieu-the-nhu-van', 'kieu-the-nhu-van.jpg', N'Hắn - Thẩm Ngao - một kẻ trời ban cho thiên phú làm giả đồ cổ, đồ hắn làm ra khiến mọi người không thể phân biệt được đâu là thật đâu là giả, khiến thị trường đồ cổ quốc tế điên đảo, náo loạn. Trong một lần chạy trốn cảnh sát, hắn sảy chân ngã xuống vách núi khiến bản thân mình xuyên không về thời Tống làm một nhân tài sống trong phủ Quốc Công.', 17880, '2022-12-30 11:18:21.920')
INSERT INTO Truyen VALUES (17, 2, 1, 1, N'Hoa Sơn Tiên Môn', 'hoa-son-tien-mon', 'hoa-son-tien-mon.jpg', N'Lục Nguyên, một đệ tử bình thường của Bắc Phong Hoa Sơn Tiên Môn, vốn cho rằng mình có thể nhàn rỗi bình yên cả đời nhưng vì sư phó thọ nguyên không nhiều, đủ loại khiêu chiến ập đến hắn không thể không liều một phen. Trong lúc vô tình, hắn đã lĩnh ngộ kiếm ý trong kiếm, về sau luyện thành Chung Cực Kiếm ý, hóa thành Vân Long thập hình.', 34290, '2022-12-30 11:19:31.313')
INSERT INTO Truyen VALUES (18, 4, 8, 2, N'Truy Tiềm Kí Ức', 'truy-tim-ky-uc', 'truy-tim-ky-uc.jpg', N'Câu chuyện đầy màu sắc với bút tích bay bổng cùng những nhân vật kiệt xuất, giấc mơ là sự phản chiếu thế giới hiện thực. Giấc mơ là sự lưu đầy của tiềm thức. Nhưng nếu cô từng yêu tha thiết một người, từng vì anh mà đau đớn khôn cùng, vậy thì tại sao những năm qua, cô lại chẳng nhớ gì đến anh? Tại sao cô lại quên sạch mọi ký ức về anh.', 47980, '2020-12-30 11:22:51.990')
INSERT INTO Truyen VALUES (19, 6, 5, 1, N'Luật Ngầm', 'luat-ngam', 'luat-ngam.jpg', N'Một câu chuyện kể về cuộc đời của nữ chính, không ai biết cô ai là, trong mọi câu chuyện cô đều xưng là tôi, cô bí ẩn giống như cuộc đời của cô vậy. Câu chuyện được mở đầu bằng những mảng kí ức của nữ chính về gia đình và những người thân...Tất cả lại chỉ bao phủ bởi sương mù. Điều đó đã thôi thúc cô đi tìm hiểu mọi thứ. Chân tướng sự thật ra sao? Cha cô là ai? Là người mà cô vẫn hay nhìn thấy...', 19929, '2022-12-30 11:24:41.293')
INSERT INTO Truyen VALUES (20, 1, 9, 2, N'Đại Quốc Tặc', 'dai-quoc-tac', 'dai-quoc-tac.jpg', N'Đang trong sự truy giết của đám hắc bang, lại nổi máu anh hùng ra tay giết bọn cướp của hiếp đáp phụ nữ ngay trên địa bàn của chúng, mười mấy khẩu súng vây quanh… Chết chắc! Linh hồn Giang Long còn đang vất vưởng lang thang đến phát bực thì bỗng nhiên bị gọi dậy, nhưng… trong một thân thể khác, ở một thời đại khác!', 12908, '2021-10-30 11:11:47.663')

INSERT INTO Truyen VALUES (21, 1, 7, 1, N'Mộng Hồng Trần', 'mong-hong-tran', 'mong-hong-tran.jpg', N'Nam chính tên là Việt Hoàng vốn còn đang đi học chỉ mới 17 tuổi, rất mê những bộ truyện manga và Light Novel,cứ hay ảo tưởng mình được xuyên vào đó và trở thành bá chủ thế giới. Mọi chuyện vẫn diễn ra bình thường cho tới khi hắn đi du lịch cùng bạn bè....', 15430, '2022-10-03 20:33:11.260')
INSERT INTO Truyen VALUES (22, 6, 2, 2, N'Đào Mộ Bút Ký', 'dao-mo-but-ky', 'dao-mo-but-ky.jpg', N'Truyện biết cách tạo nên sức hút từ việc xây dựng cá tính và hoàn cảnh của từng nhân vật, các cuộc phiêu lưu đầy nguy hiểm, những tình thế hiểm nghèo và sức mạnh bí ẩn của những thế lực huyền bí...Năm mươi năm trước, một nhóm kẻ trộm mộ trên Trường Sa đào được một bộ sách lụa Chiến quốc, trên quyển sách đã hư hỏng có ghi chép lại vị trí một khu mộ cổ Chiến quốc rất kì lạ, nhưng những kẻ trộm này lại gặp phải chuyện kì quái trong lòng đất, hầu như toàn bộ đều chết sạch. Năm mươi năm sau, cháu trai của một trong số những kẻ trộm mộ đó phát hiện bí mật này từ ghi chép để lại của ông nội cậu. Cậu cùng một nhóm trộm mộ cao thủ tiến vào tìm bảo vật. Nhưng không ai ngờ, cổ mộ này lại có nhiều chuyện nhiều chuyện quái dị như vậy: Thất tinh nghi quan, Thanh nhãn hồ thi, Cửu đầu xà bách…', 32340, '2023-02-06 20:37:33.827')
INSERT INTO Truyen VALUES (23, 4, 3, 2, N'Thiên Hạ Vô Song', 'thien-ha-vo-song', 'thien-ha-vo-song.jpg', N'Thiên Hạ Vô Song là một truyện Dị Giới tiêu biểu. Truyện dẫn dắt bạn vào một vùng không gian hoang vu, huyền bí, nơi bị đồn đãi là một vùng đất đã bị nguyền rủa. Nhưng, có thật là thế không? Đây là truyện dị giới độc đáo có thiên ma, binh pháp, có những yếu tố ảo tưởng nhưng được tác giả Nhâm Oán thể hiện rất sống động không làm cho người đọc cảm thấy hư ảo quá mực, cách miêu tả cảnh vật cũng như con người và những sự kiện rất mới, đa dạng. Nhưng đối với Mạnh Hàn mà nói, thế giới này thực cũng không đáng sợ như người ta nói lắm, cũng không quá mức phức tạp vì đây là nơi hắn cùng với mấy tình nhân đánh mạt chược mà thôi. Nhưng liệu có phải quá đơn giản như hắn nói không hay thực sự là có điều gì đó bí ẩn? Đọc truyện và khám phá nhé!', 42160, '2019-12-03 20:31:38.873')
INSERT INTO Truyen VALUES (24, 5, 6, 1, N'Nguyên Long', 'nguyen-long', 'nguyen-long.jpg', N'Một thế giới khác hẳn địa cầu. Thế giới của nguyên hồn, nơi linh hồn tu luyện và vươn lên đỉnh cao. Một thế giới thần kì và đầy yếu tố huyền huyễn. Nơi đây có các tôn môn lừng lẫy kiêu ngạo, những gia tộc ẩn cư lâu đời. Nơi đây, chỉ tôn sùng kẻ mạnh, chỉ cần ngươi có thực lực, ngươi có quyền lên tiếng. Cao thủ như mây, nắm đấm ai to hơn thì có tiếng nói có trọng lượng hơn. Vương Thắng, một lính đặc chủng tài ba, một xạ thủ siêu cấp. trong một lần thi hành nhiệm vụ đã vô tình xuyên qua đến thế giới này. Nhận được nguyên hồn cá chép không trọn vẹn cùng một cô vợ hờ. Đối với thế giới này, con cá chép nhỏ đó không hề được coi trọng. Liệu Vương Thắng có thể bỏ ngoài tai những lời xỉ nhục để vững bước hiên ngang không? Đứng trên đỉnh cao, tuyên bố với những kẻ cười nhạo, cho bọn chúng biết, thế nào là cá chép hóa rồng.', 16219, '2022-12-04 20:33:41.890')
INSERT INTO Truyen VALUES (25, 3, 4, 2, N'Lê Hấp Đường Phèn', 'le-hap-duong-phen', 'le-hap-duong-phen.jpg', N'Truyện Lê Hấp Đường Phèn là tựa truyện hay, đặc sắc và thú vị thuộc thể loại ngôn tình. Một câu chuyện tình yêu nhẹ nhàng, trong sáng và đáng yêu của hai cô cậu học trò. Bạn cùng bàn của cô tên là Lê Ngữ Băng, một cậu bé vô cùng đáng ghét. Tại sao cô lại ghét cậu ấy? Bởi vì ông nội hứa với cô, nếu kết quả thi của cô xếp thứ nhất lớp thì ông sẽ đưa cô đi Disneyland chơi.', 13818, '2023-01-30 09:11:47.663')

