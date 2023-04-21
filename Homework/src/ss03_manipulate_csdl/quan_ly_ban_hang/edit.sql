USE quan_ly_ban_hang;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT * FROM orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT customer.cid, customer.cname, product.pname  FROM customer 
 JOIN orders ON customer.cid = orders.cid
 JOIN orderdetail ON orders.oid = orderdetail.oid
 JOIN product ON orderdetail.pid = product.pid;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT customer.cid,customer.cname FROM customer
LEFT JOIN orders ON customer.cid = orders.cid
WHERE orders.oid IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT orders.oid, orders.odate, SUM(orderdetail.odqty * product.pprice) 
FROM orders
JOIN orderdetail ON orders.oid = orderdetail.oid
JOIN product ON orderdetail.pid = product.pid
GROUP BY orders.oid, orderdetail.oid;




