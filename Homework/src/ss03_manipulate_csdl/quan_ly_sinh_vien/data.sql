USE quan_ly_sinh_vien;

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, student_address, student_phone, Status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, student_address, Status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, student_address, student_phone, Status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       INSERT INTO subject
VALUES (5, 'CF', 7, 1),
       (6, 'C', 2, 1),
       (7, 'HDJ', 8, 1),
       (8, 'RDBMS', 9, 1);

       INSERT INTO Mark (sub_id, student_id, mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
        INSERT INTO Mark (sub_id, student_id, mark, ExamTimes)
VALUES (5, 3, 8, 1),
       (4, 1, 10, 2),
       (3 ,2, 12, 1);
       
       SELECT * FROM subject;