--cau1
--a
CREATE DATABASE QLSV
ON PRIMARY (
Name=QLSV_data,
Filename='E:\HQTCSDL\DamNguyenPM1\QLSV_data.mdf',
Size=10MB,
MaxSize=50MB,
FileGrowth=2MB
)
Log On
(
Name=QLSV_log,
filename='E:\HQTCSDL\DamNguyenPM1\QLSV_log.ldf',
Size=5MB,
MaxSize=20MB,
FileGrowth=1MB
)
--b
ALTER DATABASE QLSV
MODIFY FILE(Name=QLSV_data , Size=15MB)
--c
ALTER DATABASE QLSV
MODIFY FILE(Name=QLSV_log , FileGrowth=0MB)
--d
USE QLSV
DBCC SHRINKFILE(Name=QLSV_data,5)
--e
ALTER DATABASE QLSV
ADD FILE 
(
Name=QLSV_dataBackup,
Filename='E:\HQTCSDL\DamNguyenPM1\QLSV_dataBackup.mdf',
Size=10MB,
FileGrowth=5MB
)
--f
ALTER DATABASE QLSV
MODIFY FILE(Name=QLSV_dataBackup , Size=0MB)


ALTER DATABASE QLSV
REMOVE FILE QLSV_dataBackup
--g
USE QLSV
CREATE TABLE SinhVien
(
ID INT not null IDENTITY (1,1) PRIMARY KEY,
MaSV CHAR(10) not null UNIQUE,
HoTen NVARCHAR(50) not null,
NgaySinh DATE not null,
GioiTinh NVARCHAR(3) not null CHECK (GioiTinh=N'Nam' or GioiTinh=N'Nu'),
DiaChi NVARCHAR(50) not null,
Email NVARCHAR(50) not null UNIQUE
);
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
Insert into SinhVien Values(N'1851171686',N'Dam Nguyen','26/6/2000',N'Nam',N'Ha Noi',N'dammit2525@gmail.com');
--h 
USE QLSV
CREATE TABLE MonHoc
(
ID INT not null IDENTITY (1,1) PRIMARY KEY,
MaMon NVARCHAR(50) not null UNIQUE,
TenMon NVARCHAR(50) not null UNIQUE,
MoTa NVARCHAR(50) not null
);
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
Insert into MonHoc Values(N'CSE486',N'HeQuanTriCoSoDuLieu',N'Mon Nay Vui Lam');
--i 
USE QLSV
CREATE TABLE KetQua
(
IDSV INT not null ,
IDMon INT not null,
PRIMARY KEY
(
IDSV,IDMon
),
Diem FLOAT(5) not null,
FOREIGN KEY (IDSV) REFERENCES SinhVien(ID),
FOREIGN KEY (IDMon) REFERENCES MonHoc(ID)
);
Insert into MonHoc Values('1','1','1.5');
Insert into MonHoc Values('1','1','1.5');
Insert into MonHoc Values('1','1','1.5');
Insert into MonHoc Values('1','1','1.5');
Insert into MonHoc Values('1','1','1.5');
Insert into MonHoc Values('1','1','1.5');
Insert into MonHoc Values('1','1','1.5');
Insert into MonHoc Values('1','1','1.5');
--Cau2
--a
CREATE DATABASE QLKH
ON PRIMARY (
Name=QLSV_data,
Filename='E:\HQTCSDL\QuanLyKhachHang\QLKH_data.mdf',
Size=10MB,
MaxSize=50MB,
FileGrowth=2MB
)
Log On
(
Name=QLSV_log,
filename='E:\HQTCSDL\QuanLyKhachHang\QLKH_log.ldf',
Size=5MB,
MaxSize=20MB,
FileGrowth=1MB
)