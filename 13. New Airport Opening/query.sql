-- Problem Statement:
/*
Find the no. of new airports opened each year.
*/
WITH biz_years AS(
SELECT YEAR(business_date) AS biz_year, city_id
FROM ab_business_city)

SELECT T1.biz_year, COUNT(CASE WHEN T2.city_id IS NULL THEN T1.city_id END) AS no_of_new_airports
FROM biz_years T1
LEFT JOIN biz_years T2 
ON T1.city_id = T2.city_id AND T1.biz_year > T2.biz_year
GROUP BY T1.biz_year;