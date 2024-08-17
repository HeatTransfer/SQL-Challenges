use challenges_db;

create table ab_employees(emp_name varchar(30),dept_id int, salary int);
insert into ab_employees values('Shiva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000);
select * from ab_employees;

-- Window Function - FIRST_VALUE()
select distinct dept_id, 
	first_value(emp_name) over(partition by dept_id order by salary desc) as emp_max_sal,
	first_value(emp_name) over(partition by dept_id order by salary asc) as emp_min_sal
from ab_employees;

-- Window Function - RANK()
with cte as (
select *,
	rank() over(partition by dept_id order by salary desc) as rn_max
   ,rank() over(partition by dept_id order by salary) as rn_min
from ab_employees)

select dept_id, 
	max(case when rn_max=1 then emp_name end) as emp_max_sal,
	max(case when rn_min=1 then emp_name end) as emp_min_sal
from cte
group by dept_id;

-- Using JOIN
with cte as (
select dept_id, min(salary) as mn, max(salary) as mx
from ab_employees
group by dept_id)

select x.dept_id,
	max(case when x.salary=y.mx then x.emp_name end) as emp_max_sal,
	max(case when x.salary=y.mn then x.emp_name end) as emp_min_sal
from ab_employees x
join cte y 
on (x.dept_id = y.dept_id)
group by x.dept_id;
