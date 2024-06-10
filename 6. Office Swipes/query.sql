-- Q : Find total in-office time in hours for each employee.

-- Solution
with cte as
(
	select emp_id, flag,
	sum(hour(swipe)) as total_swipe
	from clocked_hours
	group by emp_id, flag
)

select emp_id,
sum(case when flag = 'O' then total_swipe end) - sum(case when flag = 'I' then total_swipe end) as in_hours
from cte
group by emp_id;

-- Alternate Solution
with cte1 as
(select *, row_number() over(partition by emp_id, flag) as rn
from clocked_hours)

select emp_id, sum(in_hours) as in_hours from
(select emp_id, rn, hour(max(swipe) - min(swipe)) as in_hours
from cte1
group by emp_id, rn) d
group by d.emp_id;