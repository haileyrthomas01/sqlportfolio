select 
    count(disgisdb.switch_evw.objectid) as count
from
    disgisdb.switch_evw
where
    disgisdb.switch_evw.owned_by = 'MPC' 
    and disgisdb.switch_evw.facility_status = 'E'
    and disgisdb.switch_evw.feederid Not In ('KC','S2546','S2566','S2576')