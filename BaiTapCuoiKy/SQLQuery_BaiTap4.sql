CREATE DATABASE QLDoAn
CREATE TABLE tblTaiKhoan(
    MaSV NOT NULL PRIMARY KEY,
    Email NOT NULL,
    Pass NOT NULL,
    FOREIGN KEY (MaSV) REFERENCES tblSV(MaSV)
) 
CREATE TABLE tblSV(
    MaSV NOT NULL,
    MaLop NOT NULL,
    PRIMARY KEY(
        MaSV, 
        MaLop
    ),
    TenSV NOT NULL, 
    NamSinh NOT NULL,
    GioiTinh NOT NULL,
    Email NOT NULL, 
    SDT NOT NULL,
    FOREIGN KEY (MaLop) REFERENCES tblLop(MaLop)
)
CREATE TABLE tblLop(
    MaLop NOT NULL,
    MaGV NOT NULL,
    PRIMARY KEY(
        MaLop, 
        MaGV
    ),
    TenLop NOT NULL,
    KhoaDaoTao NOT NULL,
    BacDaoTao NOT NULL,
    FOREIGN KEY (MaGV) REFERENCES tblGV(MaGV)
)
CREATE TABLE tblGV(
    MaGV NOT NULL PRIMARY KEY, 
    TenGV NOT NULL, 
    ViTriDay NOT NULL, 
    Email NOT NULL, 
    SDT NOT NULL, 
    HocVi NOT NULL
)
CREATE TABLE tblHoiDong(
    MaHoiDong NOT NULL PRIMARY KEY,
    ChuTichHD NOT NULL, 
    SoLuong NOT NULL
)
CREATE TABLE tblDoAn(
    MaDoAn NOT NULL,
    MaHoiDong NOT NULL,
    PRIMARY KEY(
        MaDoAn, 
        MaHoiDong
    ),
    TenDoAn NOT NULL, 
    Nam NOT NULL,
    FOREIGN KEY (MaHoiDong) REFERENCES tblHoiDong(MaHoiDong)
)
CREATE TABLE tblDoAnSV(
    MaSV NOT NULL, 
    MaLop NOT NULL,
    MaDoAn NOT NULL, 
    PRIMARY KEY(
        MaSV, 
        MaLop,
        MaDoAn
    ),
    Diem NOT NULL,
    FOREIGN KEY (MaSV) REFERENCES tblSV(MaSV),
    FOREIGN KEY (MaLop) REFERENCES tblLop(MaLop),
    FOREIGN KEY (MaDoAn) REFERENCES tblDoAn(MaDoAn)
)
INSERT INTO tblTaiKhoan(MaSV, Email, Pass) VALUES
    ('a', 'b', 'c'),
    ('a', 'b', 'c'),
    ('a', 'b', 'c'),
    ('a', 'b', 'c'),
    ('a', 'b', 'c');
INSERT INTO tblSV(MaSV, MaLop, TenSV, NamSinh, Email, SDT) VALUES
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f');
INSERT INTO tblLop(MaLop, MaGV, TenLop, KhoaDaoTao, BacDaoTao, SoSV) VALUES
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f');

-- đếm số sinh viên tham gia bảo vệ đồ án
CREATE PROCEDURE sp_SoSV
AS
BEGIN
SELECT COUNT(*) FROM tblSV
END

-- đếm số sinh viên là nữ hoặc nam 
CREATE PROCEDURE sp_GioiTinhNam
AS 
BEGIN 
SELECT COUNT(*) FROM tblSV
WHERE GioiTinh = 'Nam'
END

-- đếm số sinh viên là nữ 
CREATE PROCEDURE sp_GioiTinhNu
AS 
BEGIN 
SELECT COUNT(*) FROM tblSV
WHERE GioiTinh = 'Nu'
END

-- thống kê danh sách sinh viên thực hiện đồ án theo lớp và giáo viên 
CREATE PROCEDURE sp_ThongKe 
AS
BEGIN
	SELECT tblSV.MaSV, tblSV.TenSV, tblSV.GioiTinh, tblSV.NamSinh, tblSV.MaLop, tblSV.Email, tblLop.KhoaDaoTao, tblGV.TenGV, tblDoAnSV.Diem
    FROM tblDoAnSV 
    INNER JOIN tblSV ON tblDoAnSV.MaSV = tblSV.MaSV
    INNER JOIN tblLop ON tblDoAnSV.MaLop = tblLop.MaLop
    INNER JOIN tblDoAn ON tblDoAnSV.MaDoAn = tblDoAn.MaDoAn
END