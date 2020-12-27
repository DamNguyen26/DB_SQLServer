--1
CREATE DATABASE QLNV
CREATE TABLE NHANVIEN(
    MaNV CHAR(10) NOT NULL,
    Hoten NVARCHAR(30) NOT NULL,
    Ngaysinh DATE NOT NULL,
    Diachi NVARCHAR(30) NOT NULL,
    MaP CHAR(10) NOT NULL,
    PRIMARY KEY(
        MaNV
    ),
    FOREIGN KEY (MaP) REFERENCES PHONG(MaP)
)
CREATE TABLE PHONG(
    MaP CHAR(10) NOT NULL PRIMARY KEY,
    TenP NVARCHAR(30) NOT NULL
)
CREATE TABLE NGUOITHAN(
    MaNV CHAR(10) NOT NULL PRIMARY KEY,
    HotenNT NVARCHAR(30), -- có thể nhân viên không có người thân nên ko phải để ràng buộc not null 
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
)
CREATE TABLE DUAN(
    MaDA CHAR(10) NOT NULL PRIMARY KEY,
    TenDA NVARCHAR(30) NOT NULL
)
CREATE TABLE NHANVIEN_DUAN(
    MaNV CHAR(10) NOT NULL,
    MaDA CHAR(10) NOT NULL,
    PRIMARY KEY(
        MaNV,
        MaDA
    ),
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
)
--2
ALTER TABLE NHANVIEN 
ADD CONSTRAINT check_ngaysinh
    CHECK (Ngaysinh < GETDATE());
ALTER TABLE NHANVIEN 
WITH CHECK CHECK CONSTRAINT check_ngaysinh;
--3
ALTER TABLE NHANVIEN
   ADD STT INT NOT NULL IDENTITY(1, 1);
--4
ALTER TABLE DUAN
    ADD Songaylam DATE NOT NULL DEFAULT('2020-21-11');
    SELECT DATEDIFF(day, '2020-21-11', GETDATE()); 
--5
ALTER TABLE NHANVIEN
    ADD GioiTinh NVARCHAR(5) CHECK (GioiTinh = N'Nam' or GioiTinh = N'Nu')
--6 
SELECT NHANVIEN.MaNV, HoTen, NHANVIEN_DUAN.MaDA
FROM NHANVIEN_DUAN
INNER JOIN NHANVIEN
ON NHANVIEN_DUAN.MaDA = NHANVIEN.MaNV;
--7
SELECT NHANVIEN.MaNV, HoTen, NHANVIEN_DUAN.MaDA
FROM NHANVIEN_DUAN
LEFT JOIN NHANVIEN
ON NHANVIEN_DUAN.MaDA = NHANVIEN.MaNV;
-- LEFT JOIN và INNER JOIN khác nhau ở cách lấy dữ liệu theo khóa chính
-- LEFT JOIN sẽ lấy toàn bộ giá trị mà 2 bảng có không kể có null hay không
-- INNER JOIN sẽ chỉ lấy giá trị mà cả 2 bảng đều có 
--8
SELECT * FROM NGUOITHAN
WHERE HotenNT IS NULL;
--9
SELECT * FROM NGUOITHAn, NHANVIEN_DUAN
WHERE HotenNT != null;
-- do tất cả cách nhân viên được thêm vào database đều là nhân viên có tham gia vào dự án(biến tên dự án not null và trỏ vào trong bảng NHANVIEN) nên không cần check những nhân viên tham gia nữa
--10



