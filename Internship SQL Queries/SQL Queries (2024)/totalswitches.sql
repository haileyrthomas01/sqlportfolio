select 
    count(switch_evw.objectid) as count
from
    switch_evw
where
    switch_evw.owned_by = 'MPC' 
    and switch_evw.facility_status = 'E'
    and switch_evw.feederid Not In ('KC','S2546','S2566','S2576')
