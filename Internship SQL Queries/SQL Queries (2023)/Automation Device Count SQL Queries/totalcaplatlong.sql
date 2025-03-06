select 
    disgisdb.capacitor_evw.objectid,
    disgisdb.capacitor_evw.latitude,
    disgisdb.capacitor_evw.longitude
from 
    disgisdb.capacitor_evw
where 
    disgisdb.capacitor_evw.owned_by = 'MPC' 
    and disgisdb.capacitor_evw.feederid Not In ('KC','S2546','S2566','S2576')