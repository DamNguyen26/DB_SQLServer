CREATE DATABASE QuanLyNhanVien
CREATE TABLE Phong(
    MaP CHAR(10) NOT NULL PRIMARY KEY,
    TenP NVARCHAR(30) NOT NULL
)
INSERT into Phong VALUES(N'C124',N'Hoi dong')
INSERT into Phong VALUES(N'A124',N'Khảo thí')
INSERT into Phong VALUES(N'A126',N'Kiểm định')
INSERT into Phong VALUES(N'B124',N'Nhà ăn')
INSERT into Phong VALUES(N'D124',N'Họp')
INSERT into Phong VALUES (N'A128',N'Mô hình')
INSERT into Phong VALUES (N'A130',N'Danh sách')
INSERT into Phong VALUES (N'A127',N'KT')

CREATE TABLE Nhanvien
(
    MaNV char(10) not null primary key ,
    HoTen nvarchar(30)not null,
    NgaySinh date null,
    DiaChi nvarchar(30)null,
    MaP char(10) not null,
    Luong float(30) not null,
    MaTP char(10) not null
)