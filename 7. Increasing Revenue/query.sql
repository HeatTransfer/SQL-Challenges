/* Question : Find the companies whose revenue is increasing year on year for the whole period
of time present in the dataset */

-- Solution
with cte as
(
	select *, 
	lead(revenue) over(partition by company order by year) - revenue as diff
	from pwc_revenue
)
select distinct company 
from cte
where company not in (select company from cte where diff < 0);