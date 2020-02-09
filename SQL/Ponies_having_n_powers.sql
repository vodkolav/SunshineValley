select powers, count(powers) as ponies_having_n_powers
from(
select f.pony_id, count(power_id) as powers
from pony_fact f
left join pony_power p on f.pony_id = p.pony_id
group by f.pony_Id
order by powers desc)
group by powers
order by powers desc
