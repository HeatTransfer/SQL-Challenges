-- selecting the DB
USE challenges;

-- table creation
CREATE TABLE ab_business_city(
	business_date DATE, city_id INT
);
INSERT INTO ab_business_city VALUES ('2020-01-02',3),('2020-07-01',7),('2021-01-01',3),
('2021-02-03',19),('2022-12-01',3),('2022-12-15',3),('2022-02-28',12);

-- validation
SELECT * FROM ab_business_city;