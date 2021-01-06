CREATE DATABASE QLDoAn
CREATE TABLE tblTaiKhoan(
    MaSV, KEY
    Email,
    Pass
) 
CREATE TABLE tblSV(
    MaSV, KEY
    MaLop, KEY
    TenSV, 
    NamSinh, 
    Email, 
    SDT 
)
CREATE TABLE tblLop(
    MaLop, KEY
    MaGV, KEY
    TenLop,
    KhoaDaoTao,
    BacDaoTao,
    SoSV
)
CREATE TABLE tblGV(
    MaGV, 
    TenGV, 
    ViTriDay, 
    Email, 
    SDT, 
    HocVi
)
CREATE TABLE tblHoiDong(
    MaHoiDong, KEY
    ChuTichHD, 
    SoLuong
)
CREATE TABLE tblDoAn(
    MaDoAn, KEY
    MaHoiDong, KEY
    TenDoAn, 
    Nam 
)
CREATE TABLE tblDoAn_SV(
    MaSV, 
    MaGV,
    MaDoAn, 
    Diem
)








