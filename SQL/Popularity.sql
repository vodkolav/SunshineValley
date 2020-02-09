
--popularity
select  pony_id, sum(coef) as Popularity
from (
		select p.pony_id, case relationship_type when 'Enemy' then  -1*intensity when 'Friend' then intensity when 'Frenemy' then friendly*intensity else 0 end as coef
		from pony_fact p
		left join pony_rltn f on f.source_pony_id = p.pony_id
		left join (select pony_id, case when sum(coef)>0 then 1 when sum(coef)<0 then -1 else  0 end as friendly
							 from
								(select pony_id,  case relationship_type when 'Enemy' then  -1*count(target_pony_id) when 'Friend' then count(target_pony_id) when 'Frenemy' then 0 end as coef
								from pony_fact p
								left join pony_rltn f on f.source_pony_id = p.pony_id
								group by pony_id, relationship_type 
								)
							group by pony_id) fr on fr.pony_id = p.pony_id
		) frn_coeff
group by pony_id
order by Popularity desc