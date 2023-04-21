USE furama_casestady;


-- Câu 2:
SELECT SUBSTRING_INDEX(nhan_vien.ho_ten,' ', -1) FROM nhan_vien
WHERE ho_ten 
LIKE  'H%' OR ho_ten OR 'T%' OR ho_ten LIKE 'K%'
AND LENGTH(ho_ten) <=15;

-- Câu 3:
SELECT * FROM khach_hang
WHERE TIMESTAMPDIFF(YEAR,ngay_sinh,CURDATE()) BETWEEN 18 AND 50
AND (dia_chi = 'Da Nang' OR dia_chi = 'Quang Tri');

-- Câu 4:
SELECT ho_ten, COUNT(hop_dong.ma_khach_hang) SoLanDat FROM khach_hang 
JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
JOIN hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
WHERE ten_loai_khach = 'Diamond'
GROUP BY khach_hang.ho_ten
ORDER BY SoLanDat ASC;

-- Câu 5
SELECT DISTINCT khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.ma_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,
SUM((dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong) * dich_vu_di_kem.gia)  
FROM khach_hang 
LEFT JOIN loai_khach ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
LEFT JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_hop_dong
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY khach_hang.ma_khach_hang,hop_dong.ma_hop_dong, loai_khach.ten_loai_khach, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc;

-- Câu 6
SELECT dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
FROM dich_vu
JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE dich_vu.ma_dich_vu NOT IN(SELECT dich_vu.ma_dich_vu FROM dich_vu JOIN hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu WHERE hop_dong.ngay_lam_hop_dong >= '2021-01-01' )
ORDER BY dich_vu.ma_dich_vu;

-- Câu 7
SELECT dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu 
FROM dich_vu
JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
JOIN hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
WHERE hop_dong.ma_hop_dong IN (SELECT hop_dong.ma_hop_dong 
FROM hop_dong 
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2020)
AND hop_dong.ma_hop_dong
NOT IN ( SELECT hop_dong.ma_hop_dong 
FROM hop_dong
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021
);

-- Câu 8
-- Cách 1.
SELECT DISTINCT khach_hang.ho_ten FROM khach_hang;

-- cách 2.
SELECT khach_hang.ho_ten FROM khach_hang
GROUP BY khach_hang.ho_ten;

-- cách 3.

-- Câu 9
DELIMITER //
CREATE FUNCTION count_order_in_month(month INT)
RETURNS INT
BEGIN
	DECLARE count INT;
    SELECT COUNT(DISTINCT khach_hang.ma_khach_hang)
    INTO count
    FROM khach_hang
    JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
    WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021 AND MONTH(hop_dong.ngay_lam_hop_dong) = month;
    RETURN count;
END//
DELIMITER ;
SELECT count_order_in_month(1);
DROP FUNCTION count_order_in_month;
SHOW FUNCTION STATUS;

-- Câu 10
SELECT hop_dong.ma_hop_dong,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,hop_dong.tien_dat_coc, hop_dong_chi_tiet.so_luong
FROM hop_dong 
JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong;

-- Câu 11
SELECT * FROM khach_hang 
JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE loai_khach.ten_loai_khach LIKE 'Diamond' AND (khach_hang.dia_chi LIKE 'Vinh' OR khach_hang.dia_chi LIKE 'Quang Ngai');

-- Câu 12
SELECT hop_dong.ma_hop_dong,nhan_vien.ho_ten,khach_hang.ho_ten,dich_vu.ten_dich_vu,hop_dong_chi_tiet.so_luong,hop_dong.tien_dat_coc
FROM hop_dong 
JOIN nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien 
JOIN khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
WHERE hop_dong.ngay_lam_hop_dong 
IN (
	SELECT hop_dong.ma_hop_dong 
	FROM hop_dong 
	WHERE MONTH(hop_dong.ngay_lam_hop_dong) IN (10,11,12)
	AND YEAR(hop_dong.ngay_lam_hop_dong) = 2020
  ) 
AND hop_dong.ngay_lam_hop_dong 
NOT IN (
	SELECT hop_dong.ma_hop_dong 
    FROM hop_dong
    WHERE MONTH(hop_dong.ngay_lam_hop_dong) IN(1,2,3,4,5,6) 
    AND YEAR(hop_dong.ngay_lam_hop_dong) = 2021);
    
-- Câu 13
SELECT dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem,dich_vu_di_kem.gia,dich_vu_di_kem.don_vi,dich_vu_di_kem.trang_thai FROM dich_vu_di_kem
JOIN hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem, hop_dong_chi_tiet.so_luong
HAVING SUM(hop_dong_chi_tiet.so_luong)
ORDER BY hop_dong_chi_tiet.so_luong DESC
LIMIT 1;

-- Câu 14
SELECT  hop_dong.ma_hop_dong,loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem,hop_dong_chi_tiet.so_luong
FROM hop_dong
JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE hop_dong_chi_tiet.so_luong =1
GROUP BY  hop_dong.ma_hop_dong, dich_vu.ten_dich_vu,dich_vu_di_kem.ten_dich_vu_di_kem,hop_dong_chi_tiet.so_luong;

-- Câu 15
SELECT nhan_vien.ma_nhan_vien, nhan_vien.ho_ten,trinh_do.ten_trinh_do,bo_phan.ten_bo_phan,nhan_vien.so_dien_thoai,nhan_vien.dia_chi
FROM nhan_vien
JOIN trinh_do ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
JOIN bo_phan ON nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
JOIN hop_dong ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
WHERE YEAR(hop_dong.ngay_lam_hop_dong) =2020
GROUP BY nhan_vien.ma_nhan_vien
HAVING COUNT(1) <=3
ORDER BY nhan_vien.ma_nhan_vien;

-- Câu 16
DELETE  FROM nhan_vien WHERE nhan_vien.ma_nhan_vien
NOT IN
( 
SELECT hop_dong.ma_nhan_vien FROM hop_dong
WHERE YEAR(hop_dong.ngay_lam_hop_dong) BETWEEN 2019 AND CURDATE()) 
AND nhan_vien.ma_nhan_vien
NOT IN
 (
 SELECT hop_dong.ma_nhan_vien FROM hop_dong
 WHERE
 YEAR(hop_dong.ngay_lam_hop_dong)  <= 2019
);

-- Câu 17
CREATE TEMPORARY TABLE temp_khach_hang
SELECT khach_hang.ma_khach_hang FROM khach_hang
JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021 AND
loai_khach.ten_loai_khach = 'Platinium' AND
hop_dong.tien_dat_coc > 100;


UPDATE khach_hang 
JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
SET loai_khach.ten_loai_khach = 'Diamond'
WHERE khach_hang.ma_khach_hang 
IN(
	SELECT * FROM temp_khach_hang
);

-- Câu 18
DELETE khach_hang FROM khach_hang 
JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
WHERE YEAR(hop_dong.ngay_lam_hop_dong) < 2021;

DELETE hop_dong FROM hop_dong 
JOIN khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
WHERE YEAR(hop_dong.ngay_lam_hop_dong) < 2021;

DELETE hop_dong_chi_tiet FROM hop_dong_chi_tiet 
JOIN hop_dong ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
WHERE hop_dong.ma_khach_hang IN (
	SELECT khach_hang.ma_khach_hang 
	FROM khach_hang
    JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
	WHERE YEAR(hop_dong.ngay_lam_hop_dong) < 2021
);


-- Câu 19
UPDATE dich_vu_di_kem
SET dich_vu_di_kem.gia = dich_vu_di_kem.gia *  dich_vu_di_kem.gia
WHERE dich_vu_di_kem.ma_dich_vu_di_kem 
	IN	(
		SELECT hop_dong_chi_tiet.ma_dich_vu_di_kem
        FROM hop_dong_chi_tiet
        GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
        HAVING SUM(hop_dong_chi_tiet.so_luong) > 10
		);

-- Câu 20
SELECT nhan_vien.ma_nhan_vien, khach_hang.ma_khach_hang, nhan_vien.ho_ten, nhan_vien.email, nhan_vien.so_dien_thoai, nhan_vien.ngay_sinh, nhan_vien.dia_chi
FROM nhan_vien
JOIN khach_hang ON nhan_vien.ma_nhan_vien = khach_hang.ma_khach_hang;





















