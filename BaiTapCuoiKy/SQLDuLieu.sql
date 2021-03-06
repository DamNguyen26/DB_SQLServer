﻿CREATE DATABASE QLDoAn
CREATE TABLE TaiKhoan(
	Id int Identity(1,1) PRIMARY KEY,
    MaSV char(10) NOT NULL,
	MaGV char(10) NOT NULL,
    Email nvarchar(30) NOT NULL,
    Pass nvarchar(30) NOT NULL,
    FOREIGN KEY (MaSV) REFERENCES SV(MaSV),
	FOREIGN KEY (MaSV) REFERENCES SV(MaSV)
)
INSERT INTO TaiKhoan(MaSV, MaGV, Email, Pass) VALUES
    ('SV001', '001', 'damnguyen26@gmail.com', 'abcabc'),
    ('SV002', '002', 'tungblack2512@gmail.com', '12345678'),
    ('SV003', '003', 'thanhtung2kvip@gmail.com', 'abcabc'),
    ('SV004', '004', 'dammit2909@gmail.com', 'abcabc'),
    ('SV005', '005', 'nguyen2512@gmail.com', '12345678'),
    ('SV006', '006', 'tungle2909@gmail.com', '12345678');

CREATE TABLE SV(
    MaSV char(10) NOT NULL PRIMARY KEY,
    TenSV nvarchar(30) NOT NULL, 
    NamSinh date NOT NULL,
    GioiTinh nvarchar(6) not null CHECK ( GioiTinh=N'Male' or GioiTinh=N'Female' ),  
    Email nvarchar(30) NOT NULL, 
    SDT int NOT NULL
)
INSERT INTO SV(MaSV, TenSV, NamSinh, GioiTinh, Email, SDT) VALUES
    ('SV001', 'Vũ Minh', '2000', 'Male', 'damnguyen26@gmail.com', '03985716'),
    ('SV002', 'Trần Công Tín', '2000', 'Male', 'tungblack2512@gmail.com', '0458837'),
    ('SV003', 'Đàm Khôi Nguyên', '2000', 'Male', 'thanhtung2kvip@gmail.com', '04889982'),
    ('SV004', 'Lê Thanh Tùng', '2000', 'Male', 'dammit2909@gmail.com', '03123456'),
    ('SV005', 'Đào Hoàng Long', '2000', 'Female', 'nguyen2512@gmail.com', '03456981'),
    ('SV006', 'Vũ Bá Thọ', '2000', 'Female', 'tungle2909@gmail.com','03126527');

CREATE TABLE Lop(
    MaLop char(10) NOT NULL PRIMARY KEY,
    MaGV char(10) NOT NULL,
    MaSV char(10) NOT NULL,
    TenLop nvarchar(30) NOT NULL,
    KhoaDaoTao int NOT NULL,
    BacDaoTao nvarchar(30) NOT NULL,
    SoSV int NOT NULL,
    FOREIGN KEY (MaSV) REFERENCES SV(MaSV),
	FOREIGN KEY (MaGV) REFERENCES GV(MaGV)
)
INSERT INTO Lop(MaLop, MaGV, MaSV, TenLop, KhoaDaoTao, BacDaoTao, SoSV) VALUES
    ('60TH1', '001', 'SV001', 'TH1', '60', 'Đại học', '6'),
    ('60TH2', '002', 'SV002', 'TH1', '60', 'Đại học', '7'),
    ('60PM1', '003', 'SV003', 'PM2', '60', 'Đại học', '5'),
    ('60PM2', '004', 'SV004', 'PM2', '60', 'Đại học', '8'),
    ('60TH3', '005', 'SV005', 'PM1', '60', 'Đại học', '4'),
    ('60TH4', '006', 'SV006', 'PM1', '60', 'Đại học', '9');

CREATE TABLE GV(
    MaGV char(10) NOT NULL PRIMARY KEY, 
    TenGV nvarchar(30) NOT NULL, 
    ViTriDay nvarchar(30) NOT NULL, 
    Email nvarchar(30) NOT NULL, 
    SDT int NOT NULL, 
    HocVi nvarchar(30) NOT NULL,
)
INSERT INTO GV(MaGV, TenGV, ViTriDay, Email, SDT, HocVi) VALUES
    ('001', 'Nguyễn Mạnh Hiển', 'Kinh tế và quản lý', 'Nmhien1234@tlu.edu.vn', '09876543', 'Giáo sư'),
    ('002', 'Nguyễn Mạnh Hiển', 'Kinh tế và quản lý', 'Nmhien@tlu.edu.vn', '07895678', 'Giáo sư'),
    ('003', 'Kiều Tuấn Dũng', 'Công nghệ phần mềm', 'ktdung@tlu.edu.vn', '01234567', 'Phó giáo sư'),
    ('004', 'Kiều Tuấn Dũng', 'Công nghệ phần mềm', 'ktdung123@tlu.edu.vn', '05678312', 'Phó giáo sư'),
    ('005', 'Lương Thị Hồng Lan', 'Công nghệ thông tin', 'LthLan@tlu.edu.vn', '09845123', 'Giáo sư'),
    ('006', 'Lương Thị Hồng Lan', 'Công nghệ thông tin', 'LthLan1234@tlu.edu.vn', '09246815', 'Giáo sư');

CREATE TABLE HoiDong(
    MaHoiDong char(10) NOT NULL PRIMARY KEY,
    ChuTichHD nvarchar(30) NOT NULL, 
    SoLuong int NOT NULL
)
INSERT INTO HoiDong(MaHoiDong, ChuTichHD, SoLuong) VALUES
    ('HD001', 'Nguyễn Mạnh Hiển', '3'),
    ('HD002', 'Lương Thị Hồng Lan', '4'),
    ('HD003', 'Trần Thị Ngân', '2'),
    ('HD004', 'Kiều Tuấn Dũng', '5'),
    ('HD005', 'Nguyễn Tuấn Thành', '7'),
    ('HD006', 'Nguyễn Viết Xuân', '6');

CREATE TABLE DoAn(
    MaDoAn char(10) NOT NULL PRIMARY KEY,
    MaHoiDong char(10) NOT NULL,
    TenDoAn nvarchar(50) NOT NULL, 
    Nam date NOT NULL,
    FOREIGN KEY (MaHoiDong) REFERENCES HoiDong(MaHoiDong)
)

INSERT INTO DoAn(MaDoAn, MaHoiDong, TenDoAn, Nam) VALUES
	('DA001', 'HD001', 'XÂY DỰNG WEBSITE BÁN MÁY TÍNH QUA MẠNG', '2019'),
	('DA002', 'HD002', 'XÂY DỰNG WEBSITE BÁN QUẦN ÁO QUA MẠNG', '2019'),
	('DA003', 'HD003', 'THUẬT TOÁN THỦY VÂN ÁNH ÁP DỤNG CHO HÀNH CHÍNH', '2018'),
	('DA004', 'HD004', 'SQL QUẢN LÝ ĐỒ ÁN', '2018'),
	('DA005', 'HD005', 'SQL QUẢN LÝ THƯ VIỆN', '2020'),
	('DA006', 'HD006', 'NGHIÊN CỨU MỘT SỐ KIỂU TẤN CÔNG MẠNG', '2020');

CREATE TABLE DoAnSV(
	Id int IDENTITY(1,1) PRIMARY KEY,
	MaSV char(10) NOT NULL,
    MaLop char(10) NOT NULL,
    MaDoAn char(10) NOT NULL, 
    Diem int NOT NULL,
	FOREIGN KEY (MaSV) REFERENCES SV(MaSV),
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
    FOREIGN KEY (MaDoAn) REFERENCES DoAn(MaDoAn)
)
INSERT INTO DoAnSV(MaSV, MaLop, MaDoAn, Diem) VALUES
	('SV001', '60TH1', 'DA001', '8'),
	('SV002', '60TH1', 'DA002', '6'),
	('SV003', '60PM2', 'DA003', '7'),
	('SV004', '60PM2', 'DA004', '9'),
	('SV005', '60PM1', 'DA005', '8'),
	('SV006', '60PM1', 'DA006', '9');