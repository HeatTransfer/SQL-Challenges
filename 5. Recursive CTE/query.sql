-- Printing Values from 1 to n(=10)
WITH RECURSIVE cte AS
(
	SELECT 1 AS n
    UNION ALL
    SELECT (n+1) AS n
    FROM cte WHERE n < 10
)
SELECT * FROM cte;

-- Find the hierarchy of employees under a given manager: "Asha"
WITH RECURSIVE cte AS
(
	SELECT id, name, manager_id, designation, 1 AS lvl
    FROM employee_details WHERE name = 'Asha'
    UNION ALL
    SELECT E.id, E.name, E.manager_id, E.designation, T.lvl+1 AS lvl
    FROM cte T JOIN employee_details E
    ON T.id = E.manager_id
)
SELECT * FROM cte;

-- Find the hierarchy of managers for a given employee: "David"
WITH RECURSIVE cte AS
(
	SELECT id, name, manager_id, designation, 1 AS lvl
    FROM employee_details WHERE name = 'David'
    UNION ALL
    SELECT E.id, E.name, E.manager_id, E.designation, T.lvl+1 AS lvl
    FROM cte T JOIN employee_details E
    ON T.manager_id = E.id
)
SELECT T1.Id, T1.Name, T2.name AS Manager, T1.Designation, T1.Lvl
FROM cte T1
LEFT JOIN employee_details T2
ON T1.manager_id = T2.id;