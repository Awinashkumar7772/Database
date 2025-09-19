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

//Q30
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
SELECT e.empname, e.dept, e.basicpay
FROM emp e
WHERE e.basicpay = (
    SELECT MAX(basicpay)
    FROM emp
    WHERE deptcode = e.deptcode
);

//Q43
select e.empname, e.basicpay
from emp e where basicpay= 
all(select max(basicpay) from emp where basicpay <
all(select max(basicpay) from emp));


//Q44
select e.empname, e.basicpay
from emp e where basicpay= 
all(select max(basicpay) from emp where basicpay <
all(select max(basicpay) from emp where basicpay < 
all(select max(basicpay) from emp where basicpay <
all(select max(basicpay) from emp where basicpay <
all(select max(basicpay) from emp)))));


SELECT empname, basicpay
FROM (
    SELECT empname, basicpay,
	DENSE_RANK() OVER (ORDER BY basicpay DESC) AS rnk
    FROM emp
) ranked
WHERE rnk = 5;

//Q45
select e.basicpay, d.deptname from emp e join dept d
on e.deptcode = d.deptcode
where basicpay = (select max(basicpay) from emp
where sex = 'F');

//Q46
select e.empname, e.basicpay from emp e join emp s
on e.empcode = s.empcode
where e.sex = 'M'
group by e.empname, e.basicpay
having e.basicpay > any(select basicpay from emp where sex = 'F');

//Q46
SELECT empname, basicpay
FROM emp
WHERE sex = 'M'
  AND basicpay > ANY (
      SELECT basicpay
      FROM emp
      WHERE sex = 'F'
  );


//Q47
select e.deptcode, avg(s.basic + s.allow - s.deduct) as average_sal from emp e join salary s
on e.empcode = s.empcode
group by e.deptcode
having average_sal > (select avg(basic + allow - deduct) from salary) ;

//Q48
SELECT e.empname, e.deptcode, SUM(s.basic + s.allow - s.deduct) AS total_salary
FROM emp e
JOIN salary s ON e.empcode = s.empcode
GROUP BY e.empcode, e.empname, e.deptcode
HAVING SUM(s.basic + s.allow - s.deduct) < (
    SELECT AVG(s.basic + s.allow - s.deduct)
    FROM emp e2
    JOIN salary s ON e2.empcode = s.empcode
    WHERE e2.deptcode = 'STOR'
);





select avg(s.basic+ s.allow - s.deduct) as average from emp e 
join salary s on e.empcode = s.empcode;


select * from salary;

select * from emp;
select * from dept;

