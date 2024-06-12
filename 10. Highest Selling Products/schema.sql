use challenges;

create table tech_next_orders(custid int,productname varchar(50),txnmonth varchar(50));
insert into tech_next_orders values(1,'Mobile','Jan'); 
insert into tech_next_orders values(2,'Mobile','Jan'); 
insert into tech_next_orders values(2,'TV','Jan');

insert into tech_next_orders values(1,'Shoes','Feb'); 
insert into tech_next_orders values(1,'Clothes','Feb'); 
insert into tech_next_orders values(2,'Mobile','Feb');

insert into tech_next_orders values(1,'TV','Mar'); 
insert into tech_next_orders values(1,'Mobile','Mar'); 
insert into tech_next_orders values(3,'Mobile','Mar'); 
insert into tech_next_orders values(3,'TV','Mar');