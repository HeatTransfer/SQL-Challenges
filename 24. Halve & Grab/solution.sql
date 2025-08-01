WITH summary_tbl AS (
    SELECT *, 
        row_number() OVER (PARTITION BY id ORDER BY year) AS row_num,
        count(*) OVER (PARTITION BY id) AS rec_count,
        sum(hrs_worked) OVER (PARTITION BY id) AS total_hrs_worked
    FROM emp2
),
select_rows AS (
    SELECT *
    FROM summary_tbl
    WHERE 
        (rec_count % 2 = 1 AND row_num = (rec_count + 1) / 2) OR
        (rec_count % 2 = 0 AND row_num IN (rec_count / 2, rec_count))
)
SELECT 
    s.id, e.name, s.sal, s.total_hrs_worked
FROM select_rows s
JOIN emp1 e ON s.id = e.id;
