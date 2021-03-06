CREATE DATABASE QuanlyNV

CREATE TABLE Nhanvien
(
	MaNV char(10) not null primary key ,
	HoTen nvarchar(30)not null,
	NgaySinh date null,
	DiaChi nvarchar(30)null,
	MaP char(10) not null,
	Luong float(30) not null,
	MaTP char(10) not null
);
 
 CREATE TABLE Phong
(
	MaP char(10) not null primary key,
	TenP nvarchar(30) not null
);

CREATE TABLE Duan
(
	MaDA char(10) not null PRIMARY KEY,
	Ngaybatdau date	not null,
	Ngayketthuc date not null
);

CREATE TABLE NV_DA
(
	MaDA char(10) not null,
	MaNV char(10) not null,
	PRIMARY KEY
	(
	MaDA, MaNV
	),
	FOREIGN KEY (MaDA) REFERENCES Duan(MaDA),
	FOREIGN KEY (MaNV) REFERENCES Nhanvien(MaNV)
);	

INSERT into Nhanvien VALUES (N'185117140',N'Nguyễn Văn A','01/01/2000',N'Hà Nội',N'A123',N'25',N'CSE123');
INSERT into Nhanvien VALUES (N'18511714',N'Nguyễn Văn B','01/02/2000',N'Hai Phong',N'A124',N'251',N'CSE1232');
INSERT into Nhanvien VALUES (N'185117141',N'Nguyễn Văn C','02/02/2000',N'Hưng Yên',N'A125',N'252',N'CSE122');
INSERT into Nhanvien VALUES (N'185117142',N'Lê Thanh Tùng','04/03/2000',N'Hai Phong',N'A126',N'253',N'CSE232');
INSERT into Nhanvien VALUES (N'185117143',N'Phạm Như A','03/06/2000',N'Hai Phong',N'A127',N'254',N'CSE1232');
INSERT into Nhanvien VALUES (N'185117144',N'Nguyễn Văn D','05/07/2000',N'Hưng Yên',N'A128',N'255',N'CSE132');
INSERT into Nhanvien VALUES (N'185117145',N'Nguyễn Văn E','05/05/2000',N'Hai Phong',N'A129',N'256',N'CSE1232');
INSERT into Nhanvien VALUES (N'185117146',N'Tào Thị Phóng','01/03/2000',N'Hải Dương',N'A130',N'257',N'CSE123');
INSERT into Nhanvien VALUES (N'185117147',N'Nguyễn Văn F','01/09/2000',N'Hai Phong',N'B124',N'258',N'CSE1432');
INSERT into Nhanvien VALUES (N'185117148',N'Nguyễn Văn G','04/08/2000',N'Hà Nam',N'C124',N'259',N'CSE1232');
INSERT into Nhanvien VALUES (N'185117149',N'Nguyễn Văn H','07/01/2000',N'Hải Hưng',N'D124',N'260',N'CSE1732');
INSERT into Nhanvien VALUES (N'18511715',N'Nguyễn Văn I','09/02/2000',N'Hà Nội',N'E124',N'221',N'CSE1222');
INSERT into Nhanvien VALUES (N'185117111',N'Đàm Khôi Nguyên','07/09/2000',N'Hồ chí minh',N'A127',N'257',N'CSE1234');
INSERT into Nhanvien VALUES (N'185117155',N'Phạm hữu đình','08/06/2000',N'Hà nội',N'A127',N'259',N'CSE128');

INSERT into Phong VALUES (N'C124',N'Hoi dong');
INSERT into Phong VALUES (N'A124',N'Khảo thí');
INSERT into Phong VALUES (N'A126',N'Kiểm định');
INSERT into Phong VALUES (N'B124',N'Nhà ăn');
INSERT into Phong VALUES (N'D124',N'Họp');
INSERT into Phong VALUES (N'A128',N'Mô hình');
INSERT into Phong VALUES (N'A130',N'Danh sách');
INSERT into Phong VALUES (N'A127',N'KT');

--câu 1: Hiển thị danh sách nhân viên của 1 phòng nào đó. 
go
CREATE PROC sp_DSNV_Phong
 (@TenP nvarchar(30))
 
 AS
 BEGIN

 DECLARE @MaP char(10)
 SELECT @MaP = Phong.MaP from Phong where Phong.TenP = @TenP
  
 SELECT * FROM Nhanvien where Nhanvien.MaP = @MaP
 set @TenP = N'KT';
 END
 
 execute sp_DSNV_Phong N'KT'
 
--câu 2: viết SP tính tổng số nhân viên của 1 phòng nào đó. Tổng số nhân viên lưu vào output
go
CREATE PROC sp_tongNV_phong
 (@SL char(10))
 
 AS
 BEGIN

 DECLARE @MaP char(10)
 DECLARE @TenP char(10)
 SELECT @MaP = Phong.MaP from Phong where Phong.TenP = @TenP
 
 SELECT COUNT(DISTINCT @SL)
  FROM Nhanvien
  WHERE Nhanvien.MaP = @MaP
 END
 
 execute sp_tongNV_phong N'3'
 	