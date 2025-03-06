select
    disgisdb.pole_evw.owned_by,
    count(disgisdb.pole_evw.objectid) as "COUNT"
from
    disgisdb.pole_evw
where 
    disgisdb.pole_evw.owned_by IN ('MPC', 'ATT')
group by
    owned_by