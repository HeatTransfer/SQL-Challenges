/* Question : Create a points table for all the participating teams.
Data is up to Jun 12, 2024 Aus-Namibia match
*/

-- Solution
select * from icc_T20_2024;

select `Group`, team1 as team, count(1) as T, sum(win_flag) as W, 
	count(1) - sum(win_flag) - sum(draw_flag) as L, 
	sum(draw_flag) as D,
	sum(win_flag)*2 + sum(draw_flag)*1 as P
from
(select grp as `Group`, team1,
case when winner = team1 then 1 else 0 end as win_flag,
case when winner = 'draw' then 1 else 0 end as draw_flag
from icc_T20_2024
union all
select grp, team2,
case when winner = team2 then 1 else 0 end as win_flag,
case when winner = 'draw' then 1 else 0 end as draw_flag
from icc_T20_2024) d
group by `Group`, team
order by `Group`, P desc;