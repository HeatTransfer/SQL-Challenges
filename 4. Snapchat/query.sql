select T2.age_bucket, 
round( sum( case when activity_type = 'send' then time_spent end )/sum( time_spent ) * 100.0, 2 ) as send_perc,
round( sum( case when activity_type = 'open' then time_spent end )/sum( time_spent ) * 100.0, 2 ) as open_perc
from activities T1
join age_breakdown T2
on T1.user_id = T2.user_id
where T1.activity_type in ( 'send','open' )
group by T1.user_id;