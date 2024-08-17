-- Find the Promotion Status of every employee
-- N.B. Good example of Full Outer Join

select isnull(e1.id, e2.id) as emp_id,
	case when e1.desig != e2.desig then 'promoted'
		 when e1.desig is null then 'new'
		 when e2.desig is null then 'resigned'
	end as comment
from emp_2020 e1
full outer join emp_2021 e2 on e1.id = e2.id
where isnull(e1.desig,'abc') != isnull(e2.desig,'xyz');