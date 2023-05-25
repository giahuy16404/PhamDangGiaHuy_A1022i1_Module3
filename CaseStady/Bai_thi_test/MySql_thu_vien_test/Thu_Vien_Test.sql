CREATE DATABASE thu_vien_test;
USE thu_vien_test;

CREATE TABLE sach(
	ma_sach INT PRIMARY KEY NOT NULL,
    ten_sach VARCHAR(45) NOT NULL,
    tac_gia VARCHAR(45) NOT NULL,
    mo_ta VARCHAR(45) NOT NULL,
    so_luong INT NOT NULL
);

CREATE TABLE hoc_sinh(
	ma_hoc_sinh INT PRIMARY KEY NOT NULL,
    ho_ten VARCHAR(45) NOT NULL,
    lop VARCHAR(45) NOT NULL
);

CREATE TABLE the_muon_sach(
	ma_muon_sach INT PRIMARY KEY NOT NULL,
    ma_sach INT,
    ma_hoc_sinh INT,
    trang_thai BOOLEAN NOT NULL,
    ngay_muon DATE NOT NULL,
    ngay_tra DATE NOT NULL,
    FOREIGN KEY(ma_sach) REFERENCES sach(ma_sach),
    FOREIGN KEY(ma_hoc_sinh) REFERENCES hoc_sinh(ma_hoc_sinh)
);
SELECT * FROM sach;

INSERT INTO sach(ma_sach,ten_sach,tac_gia,mo_ta,so_luong) VALUES(1,'Sach A','Tac Gia A','Mo ta 1',12);
INSERT INTO sach(ma_sach,ten_sach,tac_gia,mo_ta,so_luong) VALUES(2,'Sach B','Tac Gia B','Mo ta 2',31);
INSERT INTO sach(ma_sach,ten_sach,tac_gia,mo_ta,so_luong) VALUES(3,'Sach C','Tac Gia C','Mo ta 3',11);
INSERT INTO sach(ma_sach,ten_sach,tac_gia,mo_ta,so_luong) VALUES(4,'Sach D','Tac Gia D','Mo ta 4',0);

INSERT INTO the_muon_sach(ma_muon_sach, ma_sach, ma_hoc_sinh, trang_thai, ngay_muon, ngay_tra)
VALUES
    (5, 2, 2, TRUE, 2023-05-22,2023-05-22 );
    SELECT * FROM the_muon_sach;
    


INSERT INTO hoc_sinh(ma_hoc_sinh,ho_ten,lop) VALUES(1,'Pham Dang Gia Huy','12/2');
INSERT INTO hoc_sinh(ma_hoc_sinh,ho_ten,lop) VALUES(2,'Ho Ngoc Oanh','11/3');
INSERT INTO hoc_sinh(ma_hoc_sinh,ho_ten,lop) VALUES(3,'Pham Dang Gia Vy','10/6');

SELECT sach.ma_sach from sach WHERE ten_sach = ?;

UPDATE the_muon_sach SET the_muon_sach.trang_thai = TRUE WHERE the_muon_sach.ma_muon_sach = 1;
DELETE from the_muon_sach where the_muon_sach.ma_muon_sach = ?;



SELECT hoc_sinh.ma_hoc_sinh from hoc_sinh WHERE ho_ten = 'Pham Dang Gia Huy';

SELECT hoc_sinh.ma_hoc_sinh, sach.ten_sach, sach.tac_gia, hoc_sinh.ho_ten , hoc_sinh.lop, the_muon_sach.ngay_muon, the_muon_sach.ngay_tra 
FROM hoc_sinh JOIN the_muon_sach ON hoc_sinh.ma_hoc_sinh = the_muon_sach.ma_hoc_sinh
JOIN sach ON sach.ma_sach = the_muon_sach.ma_sach;

 SELECT the_muon_sach.ma_muon_sach, sach.ten_sach, sach.tac_gia, hoc_sinh.ho_ten , hoc_sinh.lop, the_muon_sach.ngay_muon, the_muon_sach.ngay_tra
    FROM hoc_sinh JOIN the_muon_sach ON hoc_sinh.ma_hoc_sinh = the_muon_sach.ma_hoc_sinh JOIN sach ON sach.ma_sach = the_muon_sach.ma_sach WHERE the_muon_sach.trang_thai = TRUE;
    
   UPDATE sach SET so_luong = ? WHERE ma_sach = ?;
    UPDATE sach SET so_luong = so_luong -1 WHERE ma_sach = ?;

SELECT the_muon_sach.ma_muon_sach, sach.ten_sach, sach.tac_gia, hoc_sinh.ho_ten , hoc_sinh.lop, the_muon_sach.ngay_muon, the_muon_sach.ngay_tra FROM hoc_sinh JOIN the_muon_sach ON hoc_sinh.ma_hoc_sinh = the_muon_sach.ma_hoc_sinh JOIN sach ON sach.ma_sach = the_muon_sach.ma_sach;
SELECT the_muon_sach.ma_muon_sach, sach.ten_sach, sach.tac_gia, hoc_sinh.ho_ten , hoc_sinh.lop, the_muon_sach.ngay_muon, the_muon_sach.ngay_tra FROM hoc_sinh JOIN the_muon_sach ON hoc_sinh.ma_hoc_sinh = the_muon_sach.ma_hoc_sinh JOIN sach ON sach.ma_sach = the_muon_sach.ma_sach;