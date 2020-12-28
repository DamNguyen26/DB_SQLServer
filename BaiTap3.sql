CREATE DATABASE QuanlyNV 
CREATE TABLE Nhanvien 
(
	MaNV char(10) NOT NULL PRIMARY KEY,
	HoTen nvarchar (30) NOT NULL,
	NgaySinh date NULL,
	DiaChi nvarchar (30) NULL,
	MaP char(10) NOT NULL,
	Luong float (30) NOT NULL,
	MaTP char(10) NOT NULL
)
INSERT INTO NHANVIEN ('185117140','Nguyễn Văn A','2000/01/01','Hà Nội','A123','25','CSE123');
