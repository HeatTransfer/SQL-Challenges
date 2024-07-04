select * from users;
select * from logins;


-- USERS WHO DIDN'T LOGIN IN LAST 5 MONTHS.

select user_id, max(LOGIN_TIMESTAMP) as last_login
from logins
group by user_id
having max(LOGIN_TIMESTAMP) < dateadd(month, -5, getdate());


-- CALCULATE NO. OF USERS AND NO. OF SESSIONS AT EACH QUARTER ORDER BY NEWEST TO OLDEST QUARTER.

select 
	convert(date, datetrunc(quarter, min(login_timestamp))) as qtr_first_login, 
	count(distinct user_id) as no_of_users, 
	count(session_id) as no_of_sessions
from
	logins
group by datepart(quarter, login_timestamp)
order by qtr_first_login desc;


-- USERS WHO LOGGED IN JAN'24 BUT NOT IN NOV'23

with nov23_users as
(select user_id
from logins
where login_timestamp between '2023-11-01' and '2023-11-30')

select distinct user_id 
from logins
where login_timestamp between '2024-01-01' and '2024-01-31' 
and user_id not in (select * from nov23_users);


-- CALCULATE %CHANGE IN NO. OF SESSIONS FROM LAST QUARTER.

with session_count as
(select 
	convert(date, datetrunc(quarter, min(login_timestamp))) as qtr_first_login, 
	count(session_id) as no_of_sessions
from
	logins
group by datepart(quarter, login_timestamp)
)

select *, 
	coalesce(lag(no_of_sessions) over(order by qtr_first_login),0) as prev_session_cnt,
	cast(coalesce(round(
		(no_of_sessions - lag(no_of_sessions) over(order by qtr_first_login)) * 100.0/(lag(no_of_sessions) over(order by qtr_first_login))
	,2),0) as decimal(10,2)) as percent_change
from session_count;

-- DISPLAY USERS HAVING HIGHEST SESSION SCORE FOR EACH DAY

select top 5 * from logins;

with cte as(
select cast(login_timestamp as date) as login_date, user_id, sum(session_score) as session_score
from logins
group by user_id, cast(login_timestamp as date))

select * from (
	select *, dense_rank() over(partition by login_date order by session_score desc) as d_rn from cte
) D
where D.d_rn = 1
order by D.login_date;


-- IDENTIFY OUR BEST USERS (WHO HAD A SESSION ON EVERY DAY SINCE THEIR FIRST LOGIN)

select user_id from (
	select user_id, min(login_timestamp) as first_login, max(login_timestamp) as last_login,
	datediff(day, min(login_timestamp), max(login_timestamp))+1 as diff,
	count(distinct cast(login_timestamp as date)) as login_days
	from logins
	group by user_id) d
where d.diff = d.login_days;


-- ON WHICH DATES THERE'S NO LOGIN AT ALL

with max_date as 
(select cast(max(login_timestamp) as date) as last_date
from logins),

dates as (
	select cast(min(login_timestamp) as date) as login_date from logins
	union all
	select dateadd(day, 1, login_date) from dates 
		where login_date <= (select last_date from max_date)
)

select login_date as no_user_login
from dates
where login_date not in (select cast(login_timestamp as date) from logins)
option (maxrecursion 500);

