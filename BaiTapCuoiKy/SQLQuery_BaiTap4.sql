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

