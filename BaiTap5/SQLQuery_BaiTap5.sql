
CREATE DATABASE QLNV
--câu 1
CREATE TABLE Phong
(
	MaP char(10) not null primary key,
	TenP nvarchar(30) not null
);
insert into Phong values('001','KT')
insert into Phong values('002','QL')
insert into Phong values('003','NV')
insert into Phong values('004','GD')
INSERT into Phong VALUES ('005',N'Nhà ăn');
INSERT into Phong VALUES ('006',N'Họp');
INSERT into Phong VALUES ('007',N'Mô hình');
INSERT into Phong VALUES ('008',N'Danh sách');

CREATE TABLE NHANVIEN
(
	MaNV char(10) not null primary key ,
	HoTen nvarchar(30)not null,
	NgaySinh date null,
	DiaChi nvarchar(30)null,
	MaP char(10) not null,
	FOREIGN KEY (MaP) REFERENCES Phong(MaP),
);
insert into NHANVIEN values('01',N'Nguyễn Văn Tuấn','1999/8/7',N'Hà Nội','001')
insert into NHANVIEN values('02',N'Lê Thanh Tùng','2000/8/7',N'Hưng Yên','002')
insert into NHANVIEN values('03',N'Lê Thị Huyền','1999/7/8',N'Hải Dương','003')
insert into NHANVIEN values('04',N'Nguyễn Thúy Hằng','2000/9/9',N'Thanh Hóa','004')
insert into NHANVIEN values('05',N'Nguyễn hoa Thúy Hằng','2000/2/2',N'Thanh Hoa','004')
insert into NHANVIEN values('06',N'Nguyễn hoa Thúy kiều','2000/3/3',N'Hưng yên','005')
insert into NHANVIEN values('07',N'Nguyễn hoa Thúy Hằng','2000/2/2',N'Thanh Hoa','004')
insert into NHANVIEN values('08',N'Nguyễn hoa Thúy Hằng','2000/2/2',N'Thanh Hoa','006')
insert into NHANVIEN values('09',N'Nguyễn hoa Thúy Hằng','2000/2/2',N'Thanh Hoa','007')
insert into NHANVIEN values('10',N'Nguyễn hoa Thúy Hằng','2000/2/2',N'Thanh Hoa','008')
select * from NHANVIEN
CREATE TABLE NGUOITHAN
(
	MaNV char(10) not null primary key,
	FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV),
	HotenNT nvarchar(30) null
);	
insert into NGUOITHAN values('01','Nguyễn Văn Bản')
insert into NGUOITHAN values('02','Lê Văn Lương')
insert into NGUOITHAN values('03','Lê Thị Loan')
insert into NGUOITHAN values('04','')
 
CREATE TABLE DUAN
(
	MaDA char(10) not null PRIMARY KEY,
	TenDA nvarchar(30) not null
);
insert into DUAN values('A1','BDS','5')
insert into DUAN values('B1',N'Nhà đất','7')
insert into DUAN values('A2',N'Hồ nước','12')
insert into DUAN values('B2',N'Đập','9')
insert into DUAN values('A3',N'Chung cư','10')
insert into DUAN values('01',N'Ao cá','15')
CREATE TABLE NHANVIEN_DUAN
(
	MaDA char(10) not null,
	MaNV char(10) not null,
	PRIMARY KEY
	(
	MaDA, MaNV
	),
	FOREIGN KEY (MaDA) REFERENCES DUAN(MaDA),
	FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
);
insert into NHANVIEN_DUAN values('A1','01')
insert into NHANVIEN_DUAN values('B1','02')
insert into NHANVIEN_DUAN values('A2','03')
insert into NHANVIEN_DUAN values('B2','04')
insert into NHANVIEN_DUAN values('A3','01')
insert into NHANVIEN_DUAN values('01','01')

--câu 2
CREATE trigger check_ngay
	on NHANVIEN
		after insert
as
	if((SELECT NgaySinh from inserted)>getdate())
		begin
		print('Ngay sinh nhân viên không lớn hơn ngày hiện tại')			
		end
insert into NHANVIEN values('05',N'Nguyễn Thị Thúy Hằng','2021/1/1',N'Thanh Hóa','005')
--câu 3
ALTER TABLE NHANVIEN ADD STT int identity(1,1);

--câu 4
ALTER TABLE DUAN ADD Songaylam nvarchar(30);

--câu 5
ALTER TABLE NHANVIEN
ADD GioiTinh nvarchar(3) CHECK ( GioiTinh=N'Nam' or GioiTinh=N'Nữ'  );

--câu 6 Sử dụng INNER JOIN để cho biết MaNV, Hoten, MaDA
/*SELECT MaNV, HoTen, MaDA
FROM NHANVIEN
INNER JOIN DUAN
ON NHANVIEN.MaNV = DUAN.MaDA*/
SELECT NHANVIEN.MaNV, HoTen, NHANVIEN_DUAN.MaDA
FROM NHANVIEN_DUAN
INNER JOIN NHANVIEN
ON NHANVIEN_DUAN.MaDA = NHANVIEN.MaNV;

--câu 7 
SELECT MaNV, HoTen, MaDA
FROM NHANVIEN
LEFT JOIN DUAN
ON NHANVIEN.MaNV = DUAN.MaDA
/*SELECT NHANVIEN.MaNV, HoTen, NHANVIEN_DUAN.MaDA
FROM NHANVIEN_DUAN
LEFT JOIN NHANVIEN
ON NHANVIEN_DUAN.MaDA = NHANVIEN.MaNV;*/
--câu 8
/*SELECT NHANVIEN.MaNV
FROM NGUOITHAN, NHANVIEN
WHERE NGUOITHAN.MaNV=NHANVIEN.MaNV AND HotenNT = ''*/
SELECT * FROM NGUOITHAN
WHERE HotenNT = ''
--Câu 9
SELECT NGUOITHAN.MaNV FROM NGUOITHAN, NHANVIEN_DUAN
WHERE HotenNT != ''
AND MaDA != ''
/*SELECT NHANVIEN.MaNV
FROM NGUOITHAN, NHANVIEN
WHERE NGUOITHAN.MaNV=NHANVIEN.MaNV*/

--câu 10
select NHANVIEN.MaNV, HoTen, NGUOITHAN.MaNV, HotenNT, NHANVIEN_DUAN.MaDA  
from NGUOITHAN, NHANVIEN, NHANVIEN_DUAN
where HotenNT != '' or MaDA != '' or HotenNT != '' and MaDA != ''

--câu 11
select COUNT(MaNV) from NHANVIEN
where NHANVIEN.MaP = select * from Phong

