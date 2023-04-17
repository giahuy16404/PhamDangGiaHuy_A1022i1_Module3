USE furama_casestady;


-- Câu 2:
SELECT * FROM nhan_vien 
WHERE ho_ten 
LIKE 'K%' OR ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' 
AND length(ho_ten) <= 15;

-- Câu 3:
SELECT * FROM khach_hang
WHERE TIMESTAMPDIFF(YEAR,ngay_sinh,CURDATE()) BETWEEN 18 AND 50
AND (dia_chi = 'Da Nang' OR dia_chi = 'Quang Tri');

-- Câu 4:

