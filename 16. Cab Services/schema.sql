CREATE TABLE ashu_cab(id integer,state VARCHAR(200),city varchar(200),seater integer,charge integer); 

INSERT INTO ashu_cab(id,state,city,seater,charge) VALUES
(1,'Jharkhand','Jamshedpur',4,3000),
(2,'Bihar','Purnea',3,2250),
(3,'Jharkhand','Jamshedpur',4,3000),
(4,'West Bengal','Kolkata',2,1750),
(5,'West Bengal','Siliguri',4,3500),
(6,'Jharkhand','Ranchi',4,3000),
(7,'Bihar','Sasaram',3,2100);

drop table if exists ashu_customers;
CREATE TABLE ashu_customers(id integer,namee VARCHAR(200),from_state VARCHAR(200),min_seater integer,min_rent integer,max_rent integer); 

INSERT INTO ashu_customers(id,namee,from_State,min_seater,min_rent,max_rent) 
VALUES(1,'Ram','Jharkhand',3,2500,3200),
(2,'Shyam','West Bengal',2,1500,2500),
(3,'Suresh','West Bengal',4,2500,4000),
(4,'Mahesh','Bihar',3,2200,2500),
(5,'Raj','Bihar',3,1800,2300);

drop table if exists ashu_order_details;
CREATE TABLE ashu_order_details(id integer,date date,cust_id integer,cab_id integer); 

INSERT INTO ashu_order_details(id,date,cust_id,cab_id) 
 VALUES (1,'05-07-2022',1,1),
(2,'05-07-2022',2,4),
(3,'05-07-2022',3,5),
(4,'05-07-2022',4,2);

select * from ashu_cab;
select * from ashu_customers;
select * from ashu_order_details;

EXEC sp_rename 'ashu_customers.namee', 'name', 'COLUMN';