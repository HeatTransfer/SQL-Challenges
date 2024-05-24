WITH cte1 AS (
    SELECT *, ROW_NUMBER() OVER() AS r_num FROM phone_records_1
),
cte2 AS (
    SELECT *, ROW_NUMBER() OVER() AS r_num FROM phone_records_2
)
SELECT
    T1.phone_number,
    T1.start_time,
    T2.end_time,
    TIMESTAMPDIFF(MINUTE, T1.start_time, T2.end_time) AS Duration
FROM
    cte1 AS T1
JOIN
    cte2 AS T2
ON
    T1.r_num = T2.r_num;
