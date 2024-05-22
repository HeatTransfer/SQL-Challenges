SELECT * FROM lift;

-- Query
WITH cte AS (
    SELECT lp.*, 
           SUM(lp.weight_kg) OVER(PARTITION BY lp.lift_id ORDER BY lp.weight_kg) AS cum_weight,
           capacity_kg 
    FROM lift_passengers lp
    JOIN lift l
    ON lp.lift_id = l.id
    ORDER BY l.id, lp.weight_kg
)

SELECT lift_id, GROUP_CONCAT(passenger_name SEPARATOR ', ') AS passengers
FROM cte
WHERE cum_weight <= capacity_kg
GROUP BY lift_id;