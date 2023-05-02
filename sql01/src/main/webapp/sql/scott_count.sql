select count(*) from EMP
union all
select count(*) from dept
union all
select count(*) from salgrade
;

select * from salgrade;
select * from dept;
select * from emp;