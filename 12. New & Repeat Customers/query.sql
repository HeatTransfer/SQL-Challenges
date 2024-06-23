-- Problem Statement:
/*
Find the new and repeat customers.
*/

WITH first_order AS(
	SELECT customer_id, MIN(order_date) AS first_order_date
	FROM ab_customer_orders
    GROUP BY customer_id
),
all_orders AS(
	SELECT C.customer_id, C.order_date, F.first_order_date,
		IF(C.order_date = F.first_order_date, 'Y', 'N') AS is_first_order
	FROM ab_customer_orders C
	JOIN first_order F ON C.customer_id = F.customer_id
)
SELECT order_date,
	SUM(IF(is_first_order='Y', 1, 0)) AS new_customer,
    SUM(IF(is_first_order='N', 1, 0)) AS repeat_customer
FROM all_orders
GROUP BY order_date;