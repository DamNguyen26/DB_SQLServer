CREATE DATABASE QLDoAn
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

-- đếm số sinh viên là nữ hoặc nam  
SELECT COUNT(*) FROM SV
WHERE GioiTinh = 'Male'

-- đếm số sinh viên là nữ 
SELECT COUNT(*) FROM SV
WHERE GioiTinh = 'Female'

-- thống kê danh sách sinh viên thực hiện đồ án theo lớp và giáo viên 
CREATE VIEW ThongKe 
AS
	SELECT SV.Email, SV.GioiTinh, SV.MaSV, SV.NamSinh, SV.SDT, SV.TenSV, Lop.BacDaoTao, Lop.KhoaDaoTao, Lop.TenLop, DoAn.TenDoAn, DoAnSV.Diem
    FROM DoAnSV 
    INNER JOIN SV ON DoAnSV.MaSV = SV.MaSV
    INNER JOIN Lop ON DoAnSV.MaLop = Lop.MaLop
    INNER JOIN DoAn ON DoAnSV.MaDoAn = DoAn.MaDoAn
SELECT * FROM ThongKe

--Hàm tính tổng số sinh viên theo khóa
GO
CREATE FUNCTION f_tongsv(@khoadt NVARCHAR(50))
RETURNS @bangthongke TABLE(	
	khoa NVARCHAR(50),
	sosv INT
)
AS
BEGIN 
	INSERT INTO @bangthongke
	SELECT Lop.KhoaDaoTao, COUNT(SV.MaSV) AS TongSoSV
	FROM Lop inner join SV ON Lop.MaSV = SV.MaSV 
	WHERE Lop.KhoaDaoTao = @khoadt
	GROUP BY Lop.KhoaDaoTao 
	RETURN
END

-- Thủ tục cập nhật số sinh viên theo từng lớp
GO
CREATE PROCEDURE sp_SoSV
AS
BEGIN
DECLARE contro CURSOR
scroll
for
select Lop.MaLop,count(MaSV)
	from Lop inner join SV on Lop.MaSV = SV.MaSV group by Lop.MaLop
open contro
declare @malop nvarchar(50), @sosv int
fetch next from contro into @malop, @sosv
while(@@FETCH_STATUS = 0)
begin
	update Lop
	set SoSV = @sosv
	where MaLop = @malop
	fetch next from contro into @malop, @sosv
end
close contro
deallocate contro
end



--Thủ tục thống kê danh sách sinh viên thực hiện đồ án theo lớp và giáo viên
create procedure sp_ThongKe
as
begin
        	select SV.Email, SV.GioiTinh, SV.MaSV, SV.NamSinh, SV.SDT, SV.TenSV, Lop.BacDaoTao, Lop.KhoaDaoTao, Lop.TenLop, DoAn.TenDoAn, DoAnSV.Diem
	from DoAnSV
	INNER JOIN SV on DoAnSV.MaSV = SV.MaSV
	INNER JOIN Lop on DoAnSV.MaLop = Lop.MaLop
	INNER JOIN DoAn on DoAnSV.MaDoAn = DoAn.MaDoAn
end

--Thủ tục tìm kiếm xem sinh viên A đã làm những DoAn nào khi chỉ biết mã sinh viên của sinh viên đó
go
create proc sp_timkiemda (@masv nvarchar(50))
as
begin
declare @tongsv int
 	select @tongsv = count(masv) from SV
declare @dem int
 	set @dem = 0
declare contro_2 cursor
scroll
for
 	select masv
 	from SV
open contro_2
declare @cur_masv nvarchar(50)
fetch next from contro_2 into @cur_masv
while (@@FETCH_STATUS = 0)
begin
 	if @cur_masv = @masv
 	begin
 
       	select SV.MaSV, SV.TenSV, DoAn.TenDoAn, DoAnSV.Diem, DoAn.Nam
 	from SV        inner join DoAnSV on SV.MaSV = DoAnSV.MaSV
                  	inner join DoAn on DoAnSV.MaDoAn = DoAn.MaDoAn
                  	inner join Lop on DoAnSV.MaLop = Lop.MaLop
       	where SV.MaSV = @masv
       	break;
 	end
 	else
 	begin
       	set @dem = @dem + 1
       	fetch next from contro_2 into @cur_masv
       	if @dem = @tongsv
            	print N'không tìm thấy sinh viên'
 	end
end
 
close contro_2
deallocate contro_2
end

--Phan quyen
CREATE PROC sp_themlogin (@tk nvarchar(10),@mk nvarchar(50))
as
begin
	begin transaction
	declare @themlog nvarchar(300)
		set @themlog =' CREATE LOGIN ' + @tk + ' WITH PASSWORD=''' + @mk + ''', DEFAULT_DATABASE=[QuanLyDoAn]' 
	exec sp_executesql @themlog
	declare @themuser nvarchar(300)
		set @themuser ='use QuanLyDoAn '+'create user '+@tk+' for login '+@tk+''
	exec sp_executesql @themuser 
	commit transaction
end
--drop proc sp_themlogin
--exec sp_themlogin 'thang','123'
go
create trigger trigg_them_tk
on TaiKhoan
for insert, update
as
	declare @tk nvarchar(10), @mk nvarchar(50), @role nvarchar(50)
		select @tk = inserted.MaSV from inserted
		select @mk = inserted.Pass from inserted
		select @role = inserted.roles from inserted
	exec sp_themlogin @tk, @mk
	if @role = 'admin'
	begin 
		exec sp_addrolemember 'admin', @tk
		grant all on DoAn to admin
		grant all on DoAnSV to admin
		grant all on HoiDong to admin
		grant all on GV to admin
		grant all on SV to admin
		grant all on Lop to admin
		grant all on TaiKhoan to admin
	end
	else if @role = 'giaovien'
	begin
		exec sp_addrolemember 'giaovien', @tk
		grant select, insert, update on DoAn to giaovien
		grant select, insert, update on DoAnSV to giaovien
		grant select, insert, update on HoiDong to giaovien
		grant select, insert, update on GV to giaovien
		grant select, insert, update on SV to giaovien
		grant select, insert, update on Lop to giaovien
	end
	else if @role = 'sinhvien' or @role = null
	begin
		exec sp_addrolemember 'sinhvien', @tk
		grant select on DoAn to sinhvien
		grant select on v_dssv_doan to sinhvien
		--grant select on DoAnSV to sinhvien
		--grant select on HoiDong to sinhvien
		grant select on GV to sinhvien
		grant select on SV to sinhvien
		grant select on Lop to sinhvien
end
--drop trigger trigg_them_tk

create proc sp_xoa_quyen (@tk nvarchar(10))
as
begin
	begin transaction
	declare @xoauser nvarchar(300)
		set @xoauser =' DROP USER '+@tk
	exec sp_executesql @xoauser 
	declare @xoalog nvarchar(300)
		set @xoalog =' DROP LOGIN ' + @tk
	exec sp_executesql @xoalog
	commit transaction
end

go
create trigger trigg_xoa_tk
on TaiKhoan
for delete
as
	declare @tk nvarchar(10)
		select @tk = deleted.Ten from deleted
exec sp_xoa_quyen @tk

-- hàm tổng số sinh viên trong từng lớp
CREATE FUNCTION SoSV()
RETURNS @SoSinhVien table (malop nvarchar(50), sosv int)
as
begin
insert into @siso
select MaLop, COUNT(MaSV)
from tblSV
group by MaLop
return
end

--Hàm tính tổng số đồ án mà 1 sinh viên bất kì đã làm
go
create function f_tongsodoan (@masv nvarchar(50))
returns int
as
begin
	declare @tong int
		select @tong = count(MaDoAn)
		from DoAnSV
		where MaSV = @masv

	return @tong
end



--Trigger tự động cập nhật sĩ số sinh viên khi thêm , sửa, xóa sinh viên
go
create trigger trigg_update_siso
on SV
for insert, delete, update
as
	declare @malop nvarchar(50), @sosv int
	declare contro cursor
	scroll
	for
		select Lop.MaLop,count(MaSV)
		from Lop inner join SV on Lop.MaLop = SV.MaLop group by Lop.MaLop
	open contro
	fetch next from contro into @malop, @sosv

	while(@@FETCH_STATUS = 0)
	begin
		update Lop
		set SoSV = @sosv
		where MaLop = @malop
		fetch next from contro into @malop, @sosv
	end
	close contro
	deallocate contro
go

--Giao dịch không cho phép thêm thông tin sinh viên tham gia đồ án nếu đồ án đó đã có 5 người thực hiện
create proc sp_tran ( @masv nvarchar(50), @madoan nvarchar(50), @malop nvarchar(50), @diem int)
as
begin
	begin tran t1
	insert into DoAnSV values (@masv, @madoan, @malop, @diem)
	if (select count(MaSV) from DoAnSV where MaDoAn = @madoan) <= 5
	begin
		commit tran t1
		print N'thêm thành công'
	end
	else
	begin
		rollback tran t1
		print N'Số lượng sinh viên tham gia thực hiện btl này đã đủ'
	end
end

-- Giao dịch thực hiện xóa đồ án
begin tran xoa_doan
	delete from DoAn where MaDoAn = 'Chưa có'
	if exists (select MaDoAn from DoAnSV where MaDoAn = 'Chưa có')
	begin
		rollback tran xoa_doan
		print N'không thể xóa btl này'
	end
	else 
	begin
		commit tran xoa_doan
		print N'xóa thành công'
	end

--không cho phép xóa thông tin sinh viên có tuổi lớn hơn 18
create trigger UTG_AbortOlderThan18
on dbo.SV
for delete
as
begin
	declare @count int = 0
	
	select @count = COUNT(*) from deleted
	where YEAR(GETDATE()) - YEAR(Deleted.NamSinh) > 18
	
	if (@count >0)
	begin
	print N'Không được xóa người hơn 18 tuổi'
		rollback tran
	end
end	
select * from dbo.SV