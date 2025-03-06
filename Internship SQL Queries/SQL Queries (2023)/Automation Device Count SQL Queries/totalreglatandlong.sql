select 
    disgisdb.regulator_evw.objectid,
    disgisdb.regulator_evw.latitude,
    disgisdb.regulator_evw.longitude
from
    disgisdb.regulator_evw
where
    disgisdb.regulator_evw.owned_by = 'MPC' 
    and disgisdb.regulator_evw.facility_status = 'E'
    and disgisdb.regulator_evw.feederid Not In ('KC','S2546','S2566','S2576')