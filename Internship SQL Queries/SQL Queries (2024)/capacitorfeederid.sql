select 
    capacitor_evw.feederid
from 
    capacitor_evw
where 
    capacitor_evw.owned_by = 'MPC' 
    and capacitor_evw.dagroup_globalid is NOT NULL
    and capacitor_evw.feederid Not In ('KC','S2546','S2566','S2576')
