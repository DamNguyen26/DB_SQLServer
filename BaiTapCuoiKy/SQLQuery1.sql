CREATE DATABASE QLDoAn
CREATE TABLE tblTaiKhoan(
    MaSV char(10) NOT NULL PRIMARY KEY,
    Email nvarchar(30) NOT NULL,
    Pass nvarchar(30) NOT NULL,
    FOREIGN KEY (MaSV) REFERENCES tblSV(MaSV)
)
INSERT INTO tblTaiKhoan(MaSV, Email, Pass) VALUES
    ('SV001', 'damnguyen26@gmail.com', 'abcabc'),
    ('SV002', 'tungblack2512@gmail.com', '12345678'),
    ('SV003', 'thanhtung2kvip@gmail.com', 'abcabc'),
    ('SV004', 'dammit2909@gmail.com', 'abcabc'),
    ('SV005', 'nguyen2512@gmail.com', '12345678'),
    ('SV006', 'tungle2909@gmail.com', '12345678');
CREATE TABLE tblSV(
    MaSV char(10) NOT NULL,
    MaLop char(10) NOT NULL,
    PRIMARY KEY(
        MaSV, 
        MaLop
    ),
    TenSV nvarchar(30) NOT NULL, 
    NamSinh date NOT NULL,
    GioiTinh nvarchar(3)CHECK ( GioiTinh=N'Nam' or GioiTinh=N'Nữ'  ),  
    Email nvarchar(30) NOT NULL, 
    SDT int NOT NULL,
    FOREIGN KEY (MaLop) REFERENCES tblLop(MaLop)
)
INSERT INTO tblSV(MaSV, MaLop, TenSV, NamSinh, GioiTinh, Email, SDT) VALUES
    ('SV001', '60TH1', 'Vũ Minh', '2000', 'Nam', 'damnguyen26@gmail.com', '03985716'),
    ('SV002', '60TH1', 'Trần Công Tín', '2000', 'Nam', 'tungblack2512@gmail.com', '0458837'),
    ('SV003', '60PM2', 'Đàm Khôi Nguyên', '2000', 'Nam', 'thanhtung2kvip@gmail.com', '04889982'),
    ('SV004', '60PM2', 'Lê Thanh Tùng', '2000', 'Nam', 'dammit2909@gmail.com', '03123456'),
    ('SV005', '60PM1', 'Đào Hoàng Long', '2000', 'Nữ', 'nguyen2512@gmail.com', '03456981'),
    ('SV006', '60PM1', 'Vũ Bá Thọ', '2000', 'Nữ', 'tungle2909@gmail.com','03126527');
CREATE TABLE tblLop(
    MaLop char(10) NOT NULL,
    MaGV char(10) NOT NULL,
    PRIMARY KEY(
        MaLop, 
        MaGV
    ),
    TenLop nvarchar(30) NOT NULL,
    KhoaDaoTao int NOT NULL,
    BacDaoTao nvarchar(30) NOT NULL,
    SoSV int NOT NULL,
    FOREIGN KEY (MaGV) REFERENCES tblGV(MaGV)
)
INSERT INTO tblLop(MaLop, MaGV, TenLop, KhoaDaoTao, BacDaoTao, SoSV) VALUES
    ('60TH1', '001', 'TH1', '60', 'Đại học', '6'),
    ('60TH1', '002', 'TH1', '60', 'Đại học', '7'),
    ('60PM2', '003', 'PM2', '60', 'Đại học', '5'),
    ('60PM2', '004', 'PM2', '60', 'Đại học', '8'),
    ('60PM1', '005', 'PM1', '60', 'Đại học', '4'),
    ('60PM1', '006', 'PM1', '60', 'Đại học', '9');
CREATE TABLE tblGV(
    MaGV char(10) NOT NULL PRIMARY KEY, 
    TenGV nvarchar(30) NOT NULL, 
    ViTriDay nvarchar(30) NOT NULL, 
    Email nvarchar(30) NOT NULL, 
    SDT int NOT NULL, 
    HocVi nvarchar(30) NOT NULL
)
INSERT INTO tblGV(MaGV, TenGV, ViTriDay, Email, SDT, HocVi) VALUES
    ('001', 'Nguyễn Mạnh Hiển', 'Kinh tế và quản lý', 'Nmhien1234@tlu.edu.vn', '09876543', 'Giáo sư'),
    ('002', 'Nguyễn Mạnh Hiển', 'Kinh tế và quản lý', 'Nmhien@tlu.edu.vn', '07895678', 'Giáo sư'),
    ('003', 'Kiều Tuấn Dũng', 'Công nghệ phần mềm', 'ktdung@tlu.edu.vn', '01234567', 'Phó giáo sư'),
    ('004', 'Kiều Tuấn Dũng', 'Công nghệ phần mềm', 'ktdung123@tlu.edu.vn', '05678312', 'Phó giáo sư'),
    ('005', 'Lương Thị Hồng Lan', 'Công nghệ thông tin', 'LthLan@tlu.edu.vn', '09845123', 'Giáo sư'),
    ('006', 'Lương Thị Hồng Lan', 'Công nghệ thông tin', 'LthLan1234@tlu.edu.vn', '09246815', 'Giáo sư');
CREATE TABLE tblHoiDong(
    MaHoiDong char(10) NOT NULL PRIMARY KEY,
    ChuTichHD nvarchar(30) NOT NULL, 
    SoLuong int NOT NULL
)
INSERT INTO tblHoiDong(MaHoiDong, ChuTichHD, SoLuong) VALUES
    ('HD001', 'Nguyễn Mạnh Hiển', '3'),
    ('HD002', 'Lương Thị Hồng Lan', '4'),
    ('HD003', 'Trần Thị Ngân', '2'),
    ('HD004', 'Kiều Tuấn Dũng', '5'),
    ('HD005', 'Nguyễn Tuấn Thành', '7'),
    ('HD006', 'Nguyễn Viết Xuân', '6');
CREATE TABLE tblDoAn(
    MaDoAn char(10) NOT NULL,
    MaHoiDong char(10) NOT NULL,
    PRIMARY KEY(
        MaDoAn, 
        MaHoiDong
    ),
    TenDoAn nvarchar(30) NOT NULL, 
    Nam date NOT NULL,
    FOREIGN KEY (MaHoiDong) REFERENCES tblHoiDong(MaHoiDong)
)
INSERT INTO tblDoAn(MaDoAn, MaHoiDong, TenDoAn, Nam) VALUES
	('DA001', 'HD001', 'XÂY DỰNG WEBSITE BÁN MÁY TÍNH QUA MẠNG', '2019'),
	('DA002', 'HD002', 'XÂY DỰNG WEBSITE BÁN QUẦN ÁO QUA MẠNG', '2019'),
	('DA003', 'HD003', 'THUẬT TOÁN THỦY VÂN ÁNH ÁP DỤNG CHO VĂN BẢN HÀNH CHÍNH', '2018'),
	('DA004', 'HD004', 'SQL QUẢN LÝ ĐỒ ÁN', '2018'),
	('DA005', 'HD005', 'SQL QUẢN LÝ THƯ VIỆN', '2020'),
	('DA006', 'HD006', 'TÌM HIỂU, NGHIÊN CỨU MỘT SỐ KIỂU TẤN CÔNG MẠNG', '2020');
CREATE TABLE tblDoAnSV(
    MaSV char(10) NOT NULL, 
    MaLop char(10) NOT NULL,
    MaDoAn char(10) NOT NULL, 
    PRIMARY KEY(
        MaSV, 
        MaLop,
        MaDoAn
    ),
    Diem int NOT NULL,
    FOREIGN KEY (MaSV) REFERENCES tblSV(MaSV),
    FOREIGN KEY (MaLop) REFERENCES tblLop(MaLop),
    FOREIGN KEY (MaDoAn) REFERENCES tblDoAn(MaDoAn)
)
INSERT INTO tblDoAnSV(MaSV, MaLop, MaDoAn, Diem) VALUES
	('SV001', '60TH1', 'DA001', '8'),
	('SV002', '60TH1', 'DA002', '6'),
	('SV003', '60PM2', 'DA003', '7'),
	('SV004', '60PM2', 'DA004', '9'),
	('SV005', '60PM1', 'DA005', '8'),
	('SV006', '60PM1', 'DA006', '9');



CREATE PROCEDURE sp_SoSV
AS
BEGIN

declare contro cursor
scroll
FOR
select tblLop.MaLop,count(MaSV)
	from tblLop inner join tblSV on tblLop.MaLop = tblSV.MaLop group by tblLop.MaLop
open contro
declare @malop nvarchar(50), @sosv int
fetch next from contro into @malop, @sosv
while(@@FETCH_STATUS = 0)
begin
	update tblLop
	set SoSV = @sosv
	where MaLop = @malop
	fetch next from contro into @malop, @sosv
end
close contro
deallocate contro
end

CREATE PROCEDURE sp_thongke1 (@malop nvarchar(50), @mamh nvarchar(50))
as
begin
	select tblSV.MaSV, tblSV.TenSV, tblSV.NamSinh, tblSV.MaLop, tblSV.Email, tblLop.KhoaDaoTao, tblBTL.TenBTL, tblMH.TenMH, tblGV.TenGV,tblBTL_SV.Diem, tblBTL.Nam
	from tblSV 
    inner join tblLop on tblSV.MaLop = tblLop.MaLop
    inner join tblBTL_SV on tblSV.MaSV = tblBTL_SV.MaSV
    inner join tblBTL on tblBTL_SV.MaBTL = tblBTL.MaBTL
    inner join tblGV on tblBTL_SV.MaGV = tblGV.MaGV
    inner join tblMH on tblBTL_SV.MaMH = tblMH.MaMH
	where tblLop.MaLop = @malop and tblMH.MaMH = @mamh
end