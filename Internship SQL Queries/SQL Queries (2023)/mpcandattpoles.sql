select
    pole_evw.owned_by,
    count(pole_evw.objectid) as "COUNT"
from
    pole_evw
where 
    pole_evw.owned_by IN ('MPC', 'ATT')
group by
    owned_by
