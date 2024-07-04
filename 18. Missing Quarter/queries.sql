-- Find missing quarters for each store
WITH qtrs AS (
	SELECT DISTINCT store, qt 
    FROM stores CROSS JOIN
	(SELECT 1 AS qt UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) d
),
all_quarter_stores AS (
	SELECT S.store AS St1, Q.store AS St2, RIGHT(S.qtr,1) AS qtr, Q.qt 
	FROM stores S
	RIGHT JOIN qtrs Q ON (S.store = Q.store) AND (RIGHT(S.qtr,1) = Q.qt)),
final AS (
	SELECT St2 AS Store, CONCAT("Q",qt) AS Missing_Quarter
	FROM all_quarter_stores
	WHERE qtr IS NULL
	ORDER BY Store, Missing_Quarter
)
SELECT DISTINCT S.store, GROUP_CONCAT(DISTINCT IFNULL(F.Missing_Quarter, "No Missing Quarter")) AS Missing_Quarter
FROM stores S
LEFT JOIN final F
ON S.store = F.store
GROUP BY S.store;