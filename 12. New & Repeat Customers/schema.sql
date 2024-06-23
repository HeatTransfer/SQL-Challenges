-- selecting the DB
USE challenges;

-- table creation
CREATE TABLE ab_customer_orders (
	order_id INT,
	customer_id INT,
	order_date DATE,
	order_amount INT
);

INSERT INTO ab_customer_orders VALUES
(1,100,'2022-01-01',2000),(2,200,'2022-01-01',2500),(3,300,'2022-01-01',2100),
(4,100,'2022-01-02',2000),(5,400,'2022-01-02',2200),(6,500,'2022-01-02',2700),
(7,100,'2022-01-03',3000),(8,400,'2022-01-03',1000),(9,600,'2022-01-03',3000);

-- validation
SELECT * FROM ab_customer_orders;