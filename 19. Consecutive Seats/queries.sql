-- METHOD 1: Self-join
WITH cte AS (
	SELECT T1.seat_id s1, T1.free f1, T2.seat_id s2, T2.free f2
	FROM cinema T1
	JOIN cinema T2 ON T2.seat_id-T1.seat_id=1
	WHERE T1.free = 1 AND T2.free = 1
)
SELECT * FROM (
	SELECT s1 seat FROM cte
	UNION
	SELECT s2 seat FROM cte
) D
ORDER BY seat;

-- METHOD 2: Wondow Function
SELECT seat_id FROM (
	SELECT *, LAG(free) OVER() AS prev_free, LEAD(free) OVER() AS next_free
	FROM cinema) D
WHERE D.free = 1 AND (D.prev_free=1 OR D.next_free=1)
ORDER BY seat_id;