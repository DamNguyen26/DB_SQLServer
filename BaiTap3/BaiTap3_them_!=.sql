create database QLNV
create table Phong(
MaP nvarchar(10) NOT NULL primary key,
TenP nvarchar(30)
);
insert into Phong values('NV001','KT')
insert into Phong values('NV002','QL')
insert into Phong values('NV003','NV')
insert into Phong values('NV004','GD')
insert into Phong values('NV005','GD')

create table Nhanvien(
MaNV nvarchar(10) not null primary key, 
Hoten nvarchar(50),
Ngaysinh date,
DiaChi nvarchar(50),
MaP nvarchar(10) not null,
foreign key (MaP) references Phong(MaP),
Luong int
);
insert into Nhanvien values('01',N'Phùng Thu H??ng','2000/8/19',N'Hà N?i','NV001',1800)
insert into Nhanvien values('02',N'?oàn Quang Linh','1999/12/12',N'Phú Th?','NV001',1400)  
insert into Nhanvien values('03',N'T?ng ??ng ??t','2000/8/21',N'Hà N?i','NV002',1200) 
insert into Nhanvien values('04',N'Nguy?n Thanh Nhàn','2000/3/4',N'Thái Bình','NV004',1300)
insert into Nhanvien values('05',N'Phùng Thu Trang','2000/8/9',N'Hà N?i','NV001',1700)
insert into Nhanvien values('06',N'?oàn Quang Kiên','1999/2/12',N'Phú Th?','NV003',1400)  
insert into Nhanvien values('07',N'Tr?n Th? Anh','2000/8/15',N'Hà N?i','NV002',1200) 
insert into Nhanvien values('08',N'Nguy?n Tranmg Duyên','2000/5/4',N'Thái Bình','NV001',1300)
insert into Nhanvien values('09',N'Nguy?n Ti?t ??t','2000/10/10',N'B?c Ninh','NV003',1200) 
insert into Nhanvien values('010',N'Lê Hoài An','2000/9/4',N'Phú Th?','NV004',1300)
insert into Nhanvien values('023',N'Lê Hoài An','2000/9/4',N'Phú Th?','NV005',1300)

go
--câu 1 Ngaysinh,...).Vi?t m?t trigger ?? ??m b?o r?ng khi thêm m?t nhân viên m?i vào thì 
--		tu?i c?a nhân viên không ???c >=45
create trigger check_tuoi
on Nhanvien after insert as
if((select DATEDIFF(YYYY,NGAYSINH,GETDATE()) from inserted) >= 45)
    begin
        print 'Loi! Tuoi nhan vien khong duoc lon hon 45'
        rollback transaction
    end
else 
	print 'Them thanh cong'

insert into Nhanvien values('016',N'Nguy?n V?n An','1990/2/2',N'Hà N?i','NV001',1500)
insert into Nhanvien values('017',N'Nguy?n V?n An','1900/2/2',N'Hà N?i','NV001',1500)
go

--câu 2 T?o trigger ?? tránh xoá 2 b?n ghi trong b?ng Nhanvien ??ng th?i.
drop trigger xoa_nv 
create trigger xoa_nv 
on Nhanvien for delete as 
if((select count(MaNV) from deleted) >=2)
    begin
        print 'Khong the xoa 2 ban ghi dong thoi'
        rollback transaction
    end
go
delete from Nhanvien where Hoten=N'Lê Hoài An'
insert into Nhanvien values('020',N'Nguy?n V?n An','1990/2/2',N'Hà N?i','NV001',1500)
delete from Nhanvien where Hoten=N'Nguy?n V?n An'
go


--câu 3 T?o UPDATE trigger ??m b?o r?ng c?t l??ng không ???c l?n h?n 1000000 và
--		ngày sinh không l?n h?n ngày hi?n t?i.
create trigger update_nv 
on Nhanvien for update as
if((select Luong from inserted)>1000000 or (select Ngaysinh from inserted) > GETDATE())
    begin
        print 'khong cap nhat duoc'
        rollback transaction
    end
go

update Nhanvien set Luong=10000000 where MaNV='03'
update Nhanvien set Luong=1000, Ngaysinh= '2020/12/23' where MaNV='02'
update Nhanvien set Luong=1000, Ngaysinh= '2020/11/12' where MaNV='02'
go
 
 --câu 4 T?o m?t trigger không cho phép c?p nh?t c?t Ngaysinh trong b?ng Nhanvien.
create trigger update_Ngaysinh_nv 
on Nhanvien for update as
if update(Ngaysinh)
	begin
		print 'khong duoc cap nhat ngay sinh'
		rollback transaction
	end
go
 update Nhanvien set Ngaysinh= '2000/12/03' where MaNV = '03'
 go
 
 --câu 5 Hi?n th? các trigger trong b?ng Nhanvien
 SP_HELPTRIGGER Nhanvien
 go
 
 --câu 6 t?o trigger ?? ki?m tra d? li?u nh?p vào c?t MaP trong b?ng Nhanvien ph?i là
--       d? li?u ?ã t?n t?i trong c?t MaP c?a b?ng Phong
create trigger check_dl
on Nhanvien for insert as
if(select MaP from inserted) not in (select MaP from Phong)
	begin
		print('khong cap nhat dc du lieu')
		rollback transaction
	end
go


--câu 7 T?o m?t cascade trigger ?? khi xóa m?t phòng trong b?ng Phong thì toàn b?
--      nhân viên c?a phòng ?ó c?ng b? xóa. Sau ?ó trigger này s? kích ho?t ho?t hành ??ng
--      hi?n th? thông tin c?a nh?ng nhân viên còn l?i.
create trigger cascade_tg
on Phong instead of delete as
	begin 
		delete from Nhanvien where MaP IN (select MaP from deleted)
		select * from Nhanvien
	end
go
delete from Phong where MaP = 'NV001'
go 

-- câu 8 T?o m?t view View_Cau8 ch?a MaNV, Hoten, TenP. Th? th?c hi?n vi?c
--		 thêm/xóa/s?a trên trigger ?ó. T? ?ó vi?t instead of trigger ?? thay th? cho nh?ng 
--		 tác insert, update, delete nguyên th?y.
create view View_Cau8
as
	select MaNV, TenP , Hoten 
	from  Phong,Nhanvien