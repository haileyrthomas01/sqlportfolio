select 
    capacitor_evw.objectid,
    capacitor_evw.latitude,
    capacitor_evw.longitude
from 
    capacitor_evw
where 
    capacitor_evw.owned_by = 'MPC' 
    and capacitor_evw.feederid Not In ('KC','S2546','S2566','S2576')
