USE ss02_quanlybanhang;
 ALTER TABLE orders MODIFY ototailprice INT NOT NULL;
 ALTER TABLE product MODIFY pprice INT NOT NULL;
SHOW TABLES;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM product;
SELECT * FROM orderdetail;
BEGIN;
ROLLBACK;
COMMIT;
DELETE FROM orders;
DELETE FROM customer;
UPDATE customer set cname = 'Vy' WHERE cid = 5;
ALTER TABLE customer auto_increment = 1;
ALTER TABLE orders auto_increment = 1;

SELECT c.cid , c.cname, p.pid 
FROM customer c JOIN product p ON c.cid = p.pid;
