CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class(
	class_id 			INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    class_name 			VARCHAR(60) NOT NULL,
    class_start_date 	DATETIME NOT NULL,
    class_status	    BIT
    );
CREATE TABLE student(
	student_id   INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    student_address     VARCHAR(50),
    student_phone       VARCHAR(20),
    Status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
    );
    
    CREATE TABLE subject(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    sub_credit  TINYINT   NOT NULL DEFAULT 1 CHECK ( sub_credit >= 1 ),
    sub_status  BIT                  DEFAULT 1
);
CREATE TABLE mark(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES Subject (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
	