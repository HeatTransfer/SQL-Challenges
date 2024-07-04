
select * from Loans;
select * from Customers;

-- 1. Identify customers who have defaulted on their loans.
select C.customerID, C.CustomerName
from Loans L
join Customers C
on L.CustomerID = C.CustomerID
where DefaultStatus = 'Yes';

--2. Calculate the average loan amount for each customer segment based on age group.
with age_groups as (
select customerID, Age, 
	case when Age between 20 and 30 then '20s'
		 when Age between 31 and 40 then '30s'
		 when Age between 41 and 50 then '40s'
	     when Age > 50 then 'Seniors'
	end as 'Age_Group'
from Customers)

select A.Age_Group, round( cast(avg(L.LoanAmount) as decimal(10,2)), 2 ) as avg_loan
from age_groups A
join Loans L on A.CustomerID = L.CustomerID
group by A.Age_Group;

--3. Create a Power BI report to visualize the default rate by loan type and customer demographics.

-- loan default rate by loan-type
select LoanType, count(*) as total_loans,
	sum(case when DefaultStatus='Yes' then 1 else 0 end) as default_loan,
	cast( sum(case when DefaultStatus='Yes' then 1 else 0 end)*100.0/count(*) as decimal(10,2) ) as default_rate
from Loans
group by LoanType;

-- loan default rate by customer demographics (here age)
with age_groups as (
select customerID, Age, 
	case when Age between 20 and 30 then '20s'
		 when Age between 31 and 40 then '30s'
		 when Age between 41 and 50 then '40s'
	     when Age > 50 then 'Seniors'
	end as 'Age_Group'
from Customers)

select A.Age_Group, count(*) as total_loans,
	sum(case when DefaultStatus='Yes' then 1 else 0 end) as default_loan,
	cast( sum(case when DefaultStatus='Yes' then 1 else 0 end)*100.0/count(*) as decimal(10,2) ) as default_rate
from age_groups A
join Loans L on A.CustomerID = L.CustomerID
group by A.Age_Group;

