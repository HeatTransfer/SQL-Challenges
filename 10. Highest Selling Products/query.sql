/* 
Question : Find the highest selling products for each month. For same quantity sales, query all the products. 
*/

-- Solution
with mon_table as
(select 1 as mon_no, 'Jan' as mon union all select 2 as mon_no, 'Feb' as mon union all select 3 as mon_no, 'Mar' as mon
union all select 4 as mon_no, 'Apr' as mon union all select 5 as mon_no, 'May' as mon union all select 6 as mon_no, 'Jun' as mon
union all select 7 as mon_no, 'Jul' as mon union all select 8 as mon_no, 'Aug' as mon union all select 9 as mon_no, 'Sep' as mon
union all select 10 as mon_no, 'Oct' as mon union all select 11 as mon_no, 'Nov' as mon union all select 12 as mon_no, 'Dec' as mon
),

cte as
(select txnmonth, productname, count(productname) as cnt
from tech_next_orders
group by txnmonth, productname)

select txnmonth, group_concat(productname separator ', ') as max_sold_product
from
(select txnmonth, productname,
dense_rank() over(partition by txnmonth order by cnt desc) as rn
from cte) d
join mon_table m on d.txnmonth = m.mon
where d.rn = 1
group by txnmonth, m.mon_no
order by m.mon_no;