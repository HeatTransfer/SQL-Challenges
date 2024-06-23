-- Problem Statement:
/*
For each region find house which has won the maximum no of battles. Display region, house and no of wins.
*/

SELECT * FROM king;
SELECT * FROM battle;

with cte as
(select *, 
case when attacker_outcome = 1 then attacker_king else defender_king end as winner
from battle),

winners as
(select C.region, K.house, count(K.house) as no_of_wins
from cte C
join King K on C.winner = K.k_no
group by C.region, K.house)

select region, house, no_of_wins
from
(select *, dense_rank() over(partition by region order by no_of_wins desc) as rn
from winners) d
where d.rn = 1;