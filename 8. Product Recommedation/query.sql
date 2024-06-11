/* Question : Find the products that have been frequently bought together.
		      Also find the buying frequency of those pairs. 
*/

-- Solution
with cte AS
(select O.order_id, P.name
from recomm_sys_orders O
join recomm_sys_products P on O.product_id = P.id),
cte2 as
(select T1.order_id, T1.name pd_name1, T2.name pd_name2
from cte T1
join cte T2 on T1.order_id = T2.order_id and T1.name < T2.name)

select concat(pd_name1, ', ', pd_name2) as pair, count(1) as freq
from cte2
group by pd_name1, pd_name2;