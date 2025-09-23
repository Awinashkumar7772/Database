use dac_dbt_2022;
create table course_1(course_id1 int primary key,course_name1 varchar(20));
start transaction;
insert into course_1(course_id1,course_name1) values(1,"DBT"),(2,"OS"),(3,"JAVA"),(4,"DSA");
savepoint insertion;

delete from course_1 where course_name1="DBT";
delete from course_1 where course_name1="OS";
savepoint deletion;
insert into course_1(course_id1,course_name1) values(5,"Algo");
rollback to insertion;
rollback;
select * from course_1;