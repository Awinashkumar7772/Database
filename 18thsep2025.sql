SELECT * FROM dac_dbt_2025.emp;
use dac_dbt_2025;
select empname,deptcode from emp;
select empname from emp where supcode IS NULL;
select empname from emp where supcode = '7839';
select empname,joindate from emp 
order by joindate asc
limit 1;
select deptcode , count(*) from emp where deptcode in ('ACCT','PRCH','PERS')
group by deptcode;
