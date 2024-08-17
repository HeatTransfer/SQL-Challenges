use challenges_db;

CREATE TABLE city_population (
    state VARCHAR(50),
    city VARCHAR(50),
    population INT
);

-- Insert the data
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'ambala', 100);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'panipat', 200);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'gurgaon', 300);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'amritsar', 150);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'ludhiana', 400);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'jalandhar', 250);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'mumbai', 1000);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'pune', 600);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'nagpur', 300);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'bangalore', 900);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mysore', 400);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mangalore', 200);

select * from city_population;

with cte as (
	select *,
		FIRST_VALUE(city) over(partition by state order by population desc) as most_populated_city,
		FIRST_VALUE(city) over(partition by state order by population asc) as least_populated_city
	from city_population
)
select distinct state, most_populated_city, least_populated_city
from cte;


with cte as (
	select *, 
		max(population) over(partition by state) as mx, 
		min(population) over(partition by state) as mn
	from city_population
)
select state, 
	max(case when population=mx then city end) as most_populated_city,
	max(case when population=mn then city end) as least_populated_city
from cte
group by state;


select state, 
	max(case when mx=1 then city end) as most_populated_city,
	max(case when mn=1 then city end) as least_populated_city
from(
select *, 
	row_number() over(partition by state order by population desc) as mx, 
	row_number() over(partition by state order by population) as mn
from city_population) d
group by d.state;
