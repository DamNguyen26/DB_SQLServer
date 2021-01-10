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
    SoSV NOT NULL,
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
CREATE TABLE tblDoAn_SV(
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
insert into tblTaiKhoan(MaSV, Email, Pass) values
    ('a', 'b', 'c'),
    ('a', 'b', 'c'),
    ('a', 'b', 'c'),
    ('a', 'b', 'c'),
    ('a', 'b', 'c');
insert into tblSV(MaSV, MaLop, TenSV, NamSinh, Email, SDT) values
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f');
insert into tblLop(MaLop, MaGV, TenLop, KhoaDaoTao, BacDaoTao, SoSV) values
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f'),
    ('a', 'b', 'c', 'd', 'e', 'f');
