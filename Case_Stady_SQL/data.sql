USE furama_casestady;

-- Vị trí trong khu nghỉ dưỡng
INSERT INTO vi_tri(ma_vi_tri,ten_vi_tri) 
VALUE   (1,'Le tan'),
		(2,'Phuc vu'),
		(3,'Chuyen vien'),
		(4,'Giam sat'),
		(5,'Quan ly'),
		(6,'Giam doc');
DELETE FROM vi_tri;
SELECT * FROM vi_tri;
        
        
-- Trình độ cấp bậc con người trong resort
INSERT INTO trinh_do(ma_trinh_do,ten_trinh_do) 
VALUE	(1,'Trung cap'),
		(2,'Cao dang'),
		(3,'Dai hoc'),
		(4,'Sau dai hoc');
DELETE FROM trinh_do;
SELECT * FROM trinh_do;


-- Bộ phân trong resort
INSERT INTO bo_phan(ma_bo_phan,ten_bo_phan) 
VALUE	(1,'Sale - Marketing'),
		(2,'Hanh chinh'),
		(3,'Phuc vu'),
		(4,'Quan ly');
DELETE FROM bo_phan ;
SELECT * FROM bo_phan;

-- Các nhân viên trong resort
INSERT INTO nhan_vien(ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) 
VALUE 	(1,'Pham Dang Gia Huy','2004-04-16','201893320',9999999.99,'0974524210','phamhuy1642004@gmail.com','Da Nang',6,4,4),
        (2,'Hồ Ngọc Oanh','2004-03-23','241234123',9999999.99,'0978633041','oanh2303@gmail.com','Da Nang',6,4,4),
        (3,'Davolio	Nancy','1968-12-08','31231',2312.99,'2141231231','qfqfqư@gmail.com','Hue',3,2,3),
        (4,'Leverling Janet','1952-02-19','5123123123',3231.99,'12412312412','sdfqưqư@gmail.com','Ha Noi',1,2,2),
        (5,'Buchanan Steven','1955-03-04','5123',123.99,'5325235','nnfnfg@gmail.com','Ho Chi Minh',3,2,3),
        (6,'Suyama Michael','1963-07-02','1412',21313.99,'23525','qeafasfk@gmail.com','Quang Nam',2,2,1),
        (7,'King Robert','1960-05-26','51252',867876.99,'235235','235235@gmail.com','Vinh',3,1,3),
        (8,'Callahan Laura','1958-01-09','51512',15125.99,'125125','erterg@gmail.com','Nghe An',5,3,2),
        (9,'Dodsworth Anne','1969-07-02','546456',23523.99,'523515','mgfgfn@gmail.com','Khanh Hoa',4,2,2),
        (10,'West Adam','1928-09-19','1512512',125123.99,'141241','gdfgsafdsf@gmail.com','Hoi An',2,3,3);
SELECT * FROM nhan_vien;

-- Loại khách hàng của resort
INSERT INTO loai_khach(ma_loai_khach,ten_loai_khach) 
VALUE	(1,'Diamond'),
		(2,'Platinium'),
        (3,'Gold'),
        (4,'Silver'),
        (5,'Member');
SELECT * FROM loai_khach;

-- Các khách hàng của resort
INSERT INTO khach_hang(ma_khach_hang,ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)
VALUE	(1,1,'Pham Van Phuoc','1981-09-16',1,'10218123','0905756744','phamvanphuoc@gmail.com','Da Nang'),
		(2,2,'Dang Thi Thanh Thanh','1979-09-20',0,'5152252','0762688465','dangthithanhthanh@gmail.com','Da Nang'),
        (3,3,'Alfreterkiste','1968-12-08',1,'12312','16126126','rqwrqwc@gmail.com','Hoi An'),
		(4,2,'Berglundbbköp','1963-08-30',0,'12512','1261261261','qwecqweqw@gmail.com','Cao Bang'),
		(5,5,'Blauerkatessen','1958-09-19',1,'345345','1261615654','qweqweqw@gmail.com','Son la'),
		(6,1,'Famil rquibaldo','1955-03-04',0,'36262','546457726','trtegfd@gmail.com','Vung Tau'),
        (7,2,'Island Trading','1963-07-02',1,'72363','523523525','dfgdfgw@gmail.com','Nha Trang'),
		(8,3,'Maison Dewey','1960-05-29',0,'567567','645456546','dgsdgb@gmail.com','Thanh Hoa'),
        (9,4,'Hanna Moos','1958-01-09',1,'23424','12412412','gdfger@gmail.com','Nghe An'),
		(10,4,'Martín Sommer','1960-05-29',0,'5152252','546456','ergerg@gmail.com','Quang Nam');
DELETE FROM khanh_hang;
SELECT * FROM khach_hang;

-- Kiểu Thuê
INSERT INTO kieu_thue(ma_kieu_thue,ten_kieu_thue)
VALUE 	(1,'Nam'),
		(2,'Thang'),
        (3,'Ngay'),
        (4,'Gio');
SELECT * FROM kieu_thue;

-- Loai dịch vụ của resort
INSERT INTO loai_dich_vu(ma_loai_dich_vu,ten_loai_dich_vu)
VALUE 	(1,'Villa'),
		(2,'House'),
        (3,'Room');
SELECT * FROM loai_dich_vu;

-- Dịch vụ
INSERT INTO dich_vu(ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,
ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang)
VALUE 	(1,'Villa Dao Tien',30,999.00,20,2,1,'Phong Vvip','tien nghi khac',20,5),
		(2,'Room flass',12,129.00,5,4,3,'Phong thuong','',20,1),
        (3,'Room ones',12,329.00,5,2,3,'Phong Vvip','',20,1),
        (4,'House Family Tien',10,429.00,20,3,2,'Phong Vvip','tien nghi khac','',2),
        (5,'Villa Dang Cap',30,999.00,20,1,1,'Phong Vvip','tien nghi khac',20,6),
        (6,'Villa thien dan',30,999.00,20,4,1,'Phong thuong','tien nghi khac',20,7),
        (7,'House two',20,439.00,20,3,2,'Phong Vvip','tien nghi khac','',4),
        (8,'House class',20,549.00,20,2,2,'Phong Vvip','tien nghi khac','',3),
        (9,'Room thuong',12,209.00,20,2,3,'Phong thuong','','',2),
        (10,'Room tien nu giang tran',12,299.00,20,3,3,'Phong Vvip','','',3);
DELETE FROM dich_vu;
SELECT * FROM dich_vu;
				







       


        

		