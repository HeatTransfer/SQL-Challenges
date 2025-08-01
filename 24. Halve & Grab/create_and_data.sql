CREATE TABLE emp1 (
    id INT,
    name VARCHAR(50)
);
CREATE TABLE emp2 (
    id INT,
    year INT,
    sal INT,
    hrs_worked INT
);

insert into emp1 values (1,'Alice'),(2,'Bob'),(3, 'Charlie');
insert into emp2 values 
(1,2020,5000,160),(1,2021,6000,170),(1,2022,5500,180),
(2,2017,6000,140),(2,2018,7000,150),(2,2019,3500,140),(2,2020,4000,150),(2,2021,4500,160),(2,2022,4700,170),
(3,2022,5000,180);

SELECT * FROM emp1;
SELECT * FROM emp2;
