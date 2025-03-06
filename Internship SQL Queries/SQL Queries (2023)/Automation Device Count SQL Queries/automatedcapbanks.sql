select 
    count(disgisdb.capacitor_evw.objectid) as count
from 
    disgisdb.capacitor_evw
where 
    disgisdb.capacitor_evw.owned_by = 'MPC' 
    and disgisdb.capacitor_evw.dagroup_globalid is NOT NULL
    and disgisdb.capacitor_evw.feederid Not In ('KC','S2546','S2566','S2576')