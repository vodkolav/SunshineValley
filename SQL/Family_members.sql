select pony_id, fml_memb
from pony_fact pf
join (select  last_name,  count(pony_id) -1 as fml_memb
			from pony_fact
			group by last_name) fml
			on pf.last_name = fml.last_name
			