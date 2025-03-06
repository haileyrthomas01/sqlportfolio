select 
    regulator_evw.feederid
from
    regulator_evw
where
    regulator_evw.owned_by = 'MPC' 
    and regulator_evw.facility_status = 'E'
    and regulator_evw.dagroup_globalid is NOT NULL
    and regulator_evw.feederid Not In ('KC','S2546','S2566','S2576')
