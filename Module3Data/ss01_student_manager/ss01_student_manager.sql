CREATE DATABASE ss01_student_manager;
use ss01_student_manager;
CREATE TABLE class(
	id int auto_increment primary key,
    name nvarchar(40) not null
    );
INSERT INTO class(name)
value("Huy");
select * from class;
create table teacher(
	id int auto_increment primary key,
    name nvarchar(40) not null,
    age int check(age > 0 && age < 100),
    coutry nvarchar(50)
    );
insert into teacher(name,age,coutry)
value('Huy',19,'DaNang');
select * from teacher;
begin;
commit;
rollback;