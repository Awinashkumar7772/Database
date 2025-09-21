use  school;
create table person(
roll_no int primary key,
name varchar(15) not null,
age int check(age>=18),
dept_id int);
insert into person(roll_no,name,age,dept_id) 
value(1,'Awinash',23,1),
(2,'Vikash',24,2),
(3,'Dinesh',24,3);
insert into person(roll_no,name,age,dept_id) values(4,'dinesh',18,4);
update person set age = 29
where roll_no = 4;
select * from person
where name like 'A%';
select distinct dept_id
from person;
select * from person
order by name asc;

alter table person add email varchar(30);
select *from person