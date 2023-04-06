CREATE DATABASE ss02_quanlybanhang;
USE ss02_quanlybanhang;
CREATE TABLE customer(
	cid INT AUTO_INCREMENT PRIMARY KEY,
    cname NVARCHAR(50) NOT NULL,
    cage DATE NOT NULL
    );
CREATE TABLE orders(
	oid INT AUTO_INCREMENT PRIMARY KEY,
    cid INT,
    odate DATE NOT NULL,
    ototailprice DECIMAL NOT NULL,
    FOREIGN KEY (cid) REFERENCES customer(cid)
    );
CREATE TABLE product(
	pid INT AUTO_INCREMENT PRIMARY KEY,
    pname NVARCHAR(50) NOT NULL,
    pprice DECIMAL NOT NULL
    );
CREATE TABLE orderdetail(
	oid INT,
    pid INT,
    odqty NVARCHAR(50) NOT NULL,
    PRIMARY KEY (oid,pid),
    FOREIGN  KEY (oid) REFERENCES orders(oid),
    FOREIGN KEY (pid) REFERENCES product(pid)
    );



