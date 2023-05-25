CREATE DATABASE furama;
USE furama;

CREATE TABLE employee(
	employee_id			INT PRIMARY KEY NOT NULL,
    employee_name		VARCHAR(45) NOT NULL,
    employee_birthday	DATE NOT NULL,
    employee_id_card	VARCHAR(45),
    employee_salary		DOUBLE,
    employee_phone 		VARCHAR(45),
    employee_email		VARCHAR(45),
    username			VARCHAR(255)
);
SELECT * FROM employee;

CREATE TABLE customer(
	customer_id		    INT PRIMARY KEY NOT NULL,
    customer_name		VARCHAR(45) NOT NULL,
    customer_birthday	DATE NOT NULL,
    customer_gender		BIT(1) NOT NULL,
    customer_id_card	VARCHAR(45) NOT NULL,
    customer_phone		VARCHAR(45) NOT NULL,
    customer_email		VARCHAR(45),
    customer_address	VARCHAR(45)
);

CREATE TABLE contract(
	contract_id			    INT PRIMARY KEY NOT NULL,
    contract_start_date     DATETIME NOT NULL,
    contract_end_date	    DATETIME NOT NULL,
    contract_deposit		DOUBLE,
    contract_total_money	DOUBLE
);


CREATE TABLE service(
	service_id				INT PRIMARY KEY NOT NULL,
    service_name			VARCHAR(45) NOT NULL,
    service_area 			INT,
    service_cost			DOUBLE NOT NULL,
    service_max_people		INT,
    standard_room			VARCHAR(45),
    description_other_convenience	VARCHAR(45),
    pool_area				DOUBLE,
    number_of_floors		INT
);

CREATE TABLE positionn(
	position_id			INT PRIMARY KEY NOT NULL,
    position_name		VARCHAR(45)
);

ALTER TABLE employee 
ADD COLUMN position_id INT;
ALTER TABLE employee 
ADD FOREIGN KEY (position_id) REFERENCES positionn(position_id);

CREATE TABLE education_degree(
	education_degree_id		INT PRIMARY KEY NOT NULL,
    education_degree_name   VARCHAR(45)
);

ALTER TABLE employee 
ADD COLUMN education_degree_id INT;

ALTER TABLE employee
ADD FOREIGN KEY (education_degree_id) REFERENCES education_degree(education_degree_id);

CREATE TABLE division(
	division_id 		INT PRIMARY KEY NOT NULL,
    division_name		VARCHAR(45)
);

ALTER TABLE employee
ADD COLUMN division_id INT;

ALTER TABLE employee
ADD FOREIGN KEY (division_id) REFERENCES division(division_id);

CREATE TABLE user(
	username		VARCHAR(45) NOT NULL PRIMARY KEY,
    password		VARCHAR(255)
);

ALTER TABLE employee ADD FOREIGN KEY (username) REFERENCES user(username);

CREATE TABLE role (
	role_id			INT PRIMARY KEY,
    role_name		VARCHAR(45) 
);

CREATE TABLE user_role(
	role_id			INT,
    username		VARCHAR(255),
    PRIMARY KEY(role_id,username)
);
ALTER TABLE user_role ADD FOREIGN KEY (username) REFERENCES user(username);
ALTER TABLE user_role ADD FOREIGN KEY (role_id) REFERENCES role(role_id);

CREATE TABLE customer_type(
	customer_type_id		INT PRIMARY KEY,
    customer_type_name 		VARCHAR(45)
);

ALTER TABLE customer ADD COLUMN customer_type_id INT;
ALTER TABLE customer ADD FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id);

CREATE TABLE service_type(
	service_type_id		INT PRIMARY KEY NOT NULL,
    service_type_name	VARCHAR(45)
);

ALTER TABLE service ADD COLUMN service_type_id INT;
ALTER TABLE service ADD FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id);

ALTER TABLE contract ADD COLUMN employee_id INT;
ALTER TABLE contract ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE contract ADD COLUMN customer_id INT;
ALTER TABLE contract ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE contract ADD COLUMN service_id INT;
ALTER TABLE contract ADD FOREIGN KEY (service_id) REFERENCES service(service_id);

CREATE TABLE rent_type(
	rent_type_id 			INT PRIMARY KEY NOT NULL,
    rent_type_name 			VARCHAR(45),
    rent_type_cost			DOUBLE
);

ALTER TABLE service ADD COLUMN rent_type_id INT;
ALTER TABLE service ADD FOREIGN KEY (rent_type_id) REFERENCES rent_type(rent_type_id);

CREATE TABLE contract_detail(
	contract_detail_id 		INT PRIMARY KEY NOT NULL,
    contract_id				INT,
    attach_service_id		INT,
    quantity				INT
);

ALTER TABLE contract_detail ADD FOREIGN KEY (contract_id) REFERENCES contract(contract_id);

CREATE TABLE attach_service (
	attach_service_id 		INT PRIMARY KEY NOT NULL,
    attach_service_name		VARCHAR(45) NOT NULL,
    attach_service_cost		DOUBLE NOT NULL,
    attach_service_unit 	INT NOT NULL,
    attach_service_status	VARCHAR(45)
);

ALTER TABLE contract_detail ADD FOREIGN KEY (attach_service_id) REFERENCES attach_service(attach_service_id);








	












