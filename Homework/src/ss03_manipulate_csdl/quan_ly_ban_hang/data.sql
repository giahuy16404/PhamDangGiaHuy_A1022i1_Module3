USE quan_ly_ban_hang;
INSERT INTO customer(cname, cage) VALUES (N'Minh Quan', '2004-09-10');
INSERT INTO customer(cname, cage) VALUES (N'Ngoc Oanh', '2004-03-23');
INSERT INTO customer(cname, cage) VALUES (N'Hong Ha', '2007-09-10');
SELECT *FROM customer;

ALTER TABLE orders MODIFY ototailprice DECIMAL NULL;
INSERT INTO orders(cid,odate,ototailprice) VALUES (1,'2006-03-21',NULL);
INSERT INTO orders(cid,odate,ototailprice) VALUES (2,'2006-03-23',NULL);
INSERT INTO orders(cid,odate,ototailprice) VALUES (1,'2006-03-16',NULL);

INSERT INTO product(pname,pprice) VALUES ('May Giat',3);
INSERT INTO product(pname,pprice) VALUES ('Tu Lanh',5);
INSERT INTO product(pname,pprice) VALUES ('Dieu Hoa',7);
INSERT INTO product(pname,pprice) VALUES ('Quat',1);
INSERT INTO product(pname,pprice) VALUES ('Bep Dien',2);
SELECT * FROM product;

INSERT INTO orderdetail(oid, pid,odqty) VALUES (1,1,3);
INSERT INTO orderdetail(oid, pid,odqty) VALUES (1,3,7);
INSERT INTO orderdetail(oid, pid,odqty) VALUES (1,4,2);
INSERT INTO orderdetail(oid, pid,odqty) VALUES (2,1,1);
INSERT INTO orderdetail(oid, pid,odqty) VALUES (3,1,8);
INSERT INTO orderdetail(oid, pid,odqty) VALUES (2,5,4);
INSERT INTO orderdetail(oid, pid,odqty) VALUES (2,3,3);
SELECT * FROM orderdetail;
