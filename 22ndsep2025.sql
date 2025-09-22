use dac_dbt_2022;


delimiter //
create trigger before_insert1 before insert 
on emp
for each row
if timestampdiff(year,new.birthdate, curdate()) <18 then
signal sqlstate '50001' set message_text = 'employee must be older than 18';
end if; //
delimiter ;




insert into emp(empcode,empname,deptcode,birthdate,joindate,sex,desigcode,supcode,gradecode,gradelevel,basicpay) 
values ('2000', 'remo',  'ACCT', '2000-12-12', '2021-07-17', 'M', 'PRES',  null,  'GC1', 'GL1', 32000);

create table average_age1(average double);
insert into average_age1 select 
avg(timestampdiff(year,birthdate,curdate())) from emp;


delimiter //
create trigger average_age1 after insert
on emp
for each row 
update average_age1 set average = (select avg(timestampdiff(year,birthdate,curdate())) from emp); //
delimiter ;

select*from average_age1;

delimiter //
create trigger before_update1 before update
on emp
for each row
if timestampdiff(year,new.birthdate,curdate()) <18 then
signal sqlstate '50003' set message_text = 'must be older than 18';
end if; //
delimiter ;

update emp set birthdate = '2010-12-10' where empcode = '2000';

create table person_info(empcode varchar(20),empname varchar(40));
drop table person_info;


delimiter //
create trigger before_delete1 before delete 
on emp 
for each row 
insert into person_info(empcode,empname) values(old.empcode,old.empname); //
delimiter ;
delete from emp where empname = 'reddy';
select*from person_info;

delimiter //
create trigger after_delete after delete on emp
for each row 
update average_age1 set average = (select aveg(timestampdiff(year,birthdate,curdate())) from emp); //
delimiter ;
select*from emp;
select* from average_age1;
delete from emp where empcode = '7192';















