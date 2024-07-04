select * from ashu_cab;
select * from ashu_customers;
select * from ashu_order_details;

-- 1. possible customer pairs who can travel together irrespective of rent

select C1.id, C1.name,C2.id, C2.name
from ashu_customers C1
join ashu_customers C2 on 
(C1.from_state = C2.from_state) and (C1.name != C2.name) and (C1.id < C2.id);


-- 2. identify duplicates (different id, same city & charge)

select C1.id id1, C1.city city1, C1.charge chrg1, C2.id id2, C2.city city2, C2.charge chrg2
from ashu_cab C1
join ashu_cab C2
on C1.city = C2.city and C1.charge = C2.charge and C1.id != C2.id;


-- 3. list other cabs we can suggest to customers as an alternative(cust from same state can travel together)

select cust_id, string_agg(cab_id, ' ,') as alternative_cabs from
(
	select T1.id cust_id, T1.from_state, T2.id cab_id, T2.state
	from ashu_customers T1
	left join ashu_cab T2
	on T1.from_state = T2.state and (T2.charge between T1.min_rent and T1.max_rent)
	left join ashu_order_details T3
	on (T2.id = T3.cab_id) and (T2.id != T3.cab_id) where (T2.id not in (select cab_id from ashu_order_details))
) d
group by cust_id;