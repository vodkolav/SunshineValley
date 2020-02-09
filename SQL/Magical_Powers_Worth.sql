
--magical powers worth

select * , max(0,(5-abs(5-age))*20)*pwrs/4  as Magical_Powers_Worth
from (
			select fct.pony_id, count(power_name) as pwrs ,  strftime('%Y', 'now') - strftime('%Y', date_of_birth) as age
			from pony_fact fct 
			left join pony_power pwr on fct.pony_id = pwr.pony_id
			group by fct.pony_id

			) popoag
order by Magical_Powers_Worth  desc

--pmax(integer(31),1-abs(5-g$age)/5)*g$pwrs/4

--max(0,1-abs(5-age)/5)*pwrs/4