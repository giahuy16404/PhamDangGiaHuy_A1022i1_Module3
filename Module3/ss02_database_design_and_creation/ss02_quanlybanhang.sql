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
    INSERT INTO customer(cname,cage)
    VALUES (N'HUY','2004-04-16');
    INSERT INTO customer(cname,cage)
    VALUES (N'OANH','2004-03-23');
    INSERT customer(cname,cage)
    VALUE (N'BO','2011-07-20');

    INSERT INTO product(pname,pprice)
    VALUES (n'BÀNPHÍM',120000);
    INSERT INTO product(pname,pprice)
    VALUES (N'CHUỘT',50000);

SHOW TABLES;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM product;
SELECT * FROM orderdetail;
BEGIN;
ROLLBACK;
COMMIT;
DELETE FROM customer WHERE cid = 1;
UPDATE customer set cname = 'Vy' WHERE cid = 5;


