CREATE DATABASE ss02_erd_conversion;
USE ss02_erd_conversion;
CREATE TABLE phieuxuat(
	idpx INT AUTO_INCREMENT PRIMARY KEY,
    ngayxuat date NOT NULL
    );
    
CREATE TABLE vattu(
	idvattu INT AUTO_INCREMENT PRIMARY KEY,
    namevattu NVARCHAR(50) NOT NULL
    );
CREATE TABLE phieunhap(
	idphieunhap INT AUTO_INCREMENT PRIMARY KEY,
    ngaynhap DATE NOT NULL
    );
CREATE TABLE dondathang(
	idsodathang INT AUTO_INCREMENT PRIMARY KEY,
    idnhacungcap INT,
    ngaydathang DATE NOT NULL,
    FOREIGN KEY (idnhacungcap) REFERENCES nhacungcap(idnhacungcap)
    );
CREATE TABLE nhacungcap(
	idnhacungcap INT AUTO_INCREMENT PRIMARY KEY,
    tennhacungcap NVARCHAR(50) NOT NULL,
    diachi NVARCHAR(50) NOT NULL
    );
CREATE TABLE chitietphieuxuat(
	idpx INT,
    idvattu INT,
    donxuat NVARCHAR(50) NOT NULL,
    soluongxuat int NOT NULL,
    FOREIGN KEY (idpx) REFERENCES phieuxuat(idpx),
    FOREIGN KEY (idvattu) REFERENCES vattu(idvattu)
    );
CREATE TABLE chitietphieunhap(
	idvattu INT,
    idphieunhap INT,
	donnhap NVARCHAR(50) NOT NULL,
    soluongnhap INT NOT NULL,
    FOREIGN KEY (idvattu) REFERENCES vattu(idvattu),
    FOREIGN KEY (idphieunhap) REFERENCES phieunhap(idphieunhap)
    );
CREATE TABLE chitietdondathang(
	idvattu INT,
    idsodathang INT,
    FOREIGN KEY (idvattu) REFERENCES vattu(idvattu),
    FOREIGN KEY (idsodathang) REFERENCES dondathang(idsodathang)
    );
CREATE TABLE cungcap(
	idsodathang INT,
    idnhacungcap INT,
	FOREIGN KEY (idsodathang) REFERENCES dondathang(idsodathang),
	FOREIGN KEY (idnhacungcap) REFERENCES nhacungcap(idnhacungcap)
    );
CREATE TABLE sdtnhacungcap(
	idnhacungcap INT,
    sdt INT,
	FOREIGN KEY (idnhacungcap) REFERENCES nhacungcap(idnhacungcap)
    );
SHOW TABLES;
