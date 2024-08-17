use challenges_db;

create table call_start_logs(phone_number varchar(10),start_time datetime);
insert into call_start_logs values
('PN1','2022-01-01 10:20:00'),('PN1','2022-01-01 16:25:00'),('PN2','2022-01-01 12:30:00'),
('PN3','2022-01-02 10:00:00'),('PN3','2022-01-02 12:30:00'),('PN3','2022-01-03 09:20:00');

create table call_end_logs(phone_number varchar(10),end_time datetime);
insert into call_end_logs values
('PN1','2022-01-01 10:45:00'),('PN1','2022-01-01 17:05:00'),('PN2','2022-01-01 12:55:00'),
('PN3','2022-01-02 10:20:00'),('PN3','2022-01-02 12:50:00'),('PN3','2022-01-03 09:40:00');


select S.phone_number, S.start_time, E.end_time, datediff(minute, S.start_time, E.end_time) as duration
from
(select *, row_number() over(partition by phone_number order by start_time) as rn from call_start_logs) S
join
(select *, row_number() over(partition by phone_number order by end_time) as rn from call_end_logs) E
on S.phone_number = E.phone_number and S.rn = E.rn;

