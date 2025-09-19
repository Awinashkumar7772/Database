show databases;
use dac_dbt_2022;

//Q27
select s.empcode as supervisorcode, s.empname as supervisor ,count(e.empcode) as count 
from emp e join emp s
on s.empcode = e.supcode
group by s.empname, s.empcode
having count>=1
order by count asc;


select gradecode, max(basic), min(basic) from grade
group by gradecode;

//30
select s.empname as supervisor, e.empname as employee
from emp e join emp s on 
s.empcode = e.supcode
group by s.empname, e.empname
order by s.empname;

select * from dept;
select * from emp;

//Q35
select d.budget, d.deptname, sum(e.basicpay) as total from emp e join dept d 
on e.deptcode = d.deptcode
group by d.deptname, d.budget;



//Q37
select e.empname,
sum(s.basic + s.allow - s.deduct) as total
from emp e join salary s on
e.empcode = s.empcode
group by e.empname
having sum(s.basic + s.allow - s.deduct)>38380;

//Q38
select e.empname, sum(s.basic + s.allow - s.deduct) as total 
from emp e join salary s on e.empcode = s.empcode
group by e.empname
having total < 30000 or
total > 40000;

//Q39
select e.empname ,avg(s.basic+ s.allow - s.deduct) as average
from emp e join salary s on e.empcode = s.empcode
where (s.basic+ s.allow - s.deduct) > (select avg(basic+ allow - deduct)
from salary)
group by e.empname;


//Q40 
select e.empname, sum(s.basic + s.allow - s.deduct) as total
from emp e join salary s on e.empcode = s.empcode
where (s.basic + s.allow - s.deduct) >= all(select (basic + allow - deduct) 
from salary)
group by e.empname;


//Q41
select e.empname, sum(s.basic + s.allow - s.deduct) as total
from emp e join salary s on e.empcode = s.empcode
group by e.empname
having total < 99700;


//Q42
SELECT e.empname, e.deptcode, e.basicpay
FROM emp e
WHERE e.basicpay = (
    SELECT MAX(basicpay)
    FROM emp
    WHERE deptcode = e.deptcode
);







select avg(s.basic+ s.allow - s.deduct) as average from emp e 
join salary s on e.empcode = s.empcode;

select * from salary;

select * from salary;

select * from emp;
