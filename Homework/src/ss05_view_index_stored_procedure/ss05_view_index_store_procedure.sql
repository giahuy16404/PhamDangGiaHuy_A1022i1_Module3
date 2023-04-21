CREATE DATABASE demo;
USE demo;

CREATE TABLE Products (
Id 					 INT  AUTO_INCREMENT PRIMARY KEY,
productCode			 VARCHAR(50) NOT NULL,
productName 		 VARCHAR(255) NOT NULL,
productPrice   		 DOUBLE(10,2) NOT NULL,
productAmount 		 INT NOT NULL,
productDescription   TEXT,
productStatus 		 VARCHAR(50)
);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
ALTER TABLE Products ADD UNIQUE INDEX idx_productCode (productCode);


-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
ALTER TABLE Products ADD INDEX idx_productNamePrice (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM Products WHERE productName = 'iPhone' AND productPrice > 1000;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Tiến hành sửa đổi view
ALTER VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productAmount
FROM Products;

-- Tiến hành xoá view
DROP VIEW ProductInfo;


-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
 CREATE PROCEDURE get_all_product()
  BEGIN
	SELECT * FROM Products;
 END//
 DELIMITER ;
CALL get_all_product();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_product(
new_productCode			 VARCHAR(50) ,
new_productName 		 VARCHAR(255) ,
new_productPrice   		 DOUBLE(10,2) ,
new_productAmount 		 INT ,
new_productDescription   TEXT,
new_productStatus 		 VARCHAR(50)
)
	BEGIN
		INSERT INTO Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
        VALUE(new_productCode,new_productName,new_productPrice,new_productAmount,new_productDescription,new_productStatus);
	END//
DELIMITER ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE edit_product(
edit_Id 						INT,
edit_productCode			 VARCHAR(50) ,
edit_productName 		 VARCHAR(255) ,
edit_productPrice   		 DOUBLE(10,2) ,
edit_productAmount 		 INT ,
edit_productDescription   TEXT,
edit_productStatus 		 VARCHAR(50)
)
	BEGIN
		UPDATE Products
        SET
        productCode			 =  edit_productCode,
		productName 		 =  edit_productName,
		productPrice   		 =	edit_productPrice,
		productAmount 		 =	edit_productAmount,
		productDescription   =	edit_productDescription,
		productStatus 		 =	edit_productStatus
        WHERE Id = edit_Id;
	END//
DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE remove_product( remove_Id 		INT)
	BEGIN
		DELETE FROM Products
        WHERE Id = remove_Id;
	END//
DELIMITER ;

	