--treatments

select * , sum(case treatment_type when 'physical' then 1 when 'psychological' then 2 end) * grat_pwr.Gratitude_Pwr as treat_cost
from pony_treatment_hist tr
left join (select fct.pony_id,  case power_name when 'Gratitude' then 0 else 1 end as Gratitude_Pwr 
					  from 	pony_fact fct	
					  left join pony_power  pwr on pwr.pony_id = fct.pony_id
					  group by fct.pony_id) grat_pwr
					  on tr.pony_id = grat_pwr.pony_id
group by tr.pony_id
order by treat_cost desc