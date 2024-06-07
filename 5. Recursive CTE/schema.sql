use practice_db;

create table employee_details
( 
id int primary key not null, name varchar(30), 
manager_id int, salary int, designation varchar(50)
);
insert into employee_details values
(1, 'Sripadh', null, 10000, 'CEO'),(2, 'Satya', 5, 1400, 'SWE'),
(3, 'Jia', 5, 500, 'DA'),(4, 'David', 5, 1800, 'DS'),
(5, 'Michael', 7, 3000, 'Manager'),(6, 'Arvind', 7, 2400, 'Architect'),
(7, 'Asha', 1, 4200, 'CTO'),(8, 'Maryam', 1, 3500, 'Manager'),
(9, 'Reshma', 8, 2000, 'BA'),(10, 'Akshay', 8, 2500, 'Developer');

select * from employee_details;