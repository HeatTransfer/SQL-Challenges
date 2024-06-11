use challenges;
create table recomm_sys_orders
(order_id int, customer_id int, product_id int);

insert into recomm_sys_orders VALUES 
(1, 1, 1),(1, 1, 2),(1, 1, 3),(2, 2, 1),(2, 2, 2),(2, 2, 4),(3, 1, 5);

create table recomm_sys_products (id int, name varchar(10));
insert into recomm_sys_products VALUES (1, 'A'),(2, 'B'),(3, 'C'),(4, 'D'),(5, 'E');

select * from recomm_sys_orders;
select * from recomm_sys_products;