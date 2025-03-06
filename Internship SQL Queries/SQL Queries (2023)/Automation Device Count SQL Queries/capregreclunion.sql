select *
from (
    -- Capacitors
    select 
        disgisdb.capacitor_evw.feederid
    from 
        disgisdb.capacitor_evw
    where 
        disgisdb.capacitor_evw.owned_by = 'MPC' 
        and disgisdb.capacitor_evw.dagroup_globalid is NOT NULL
        and disgisdb.capacitor_evw.feederid Not In ('KC','S2546','S2566','S2576')
    UNION
    -- Reclosers
    select 
        disgisdb.recloser_evw.feederid
    from
        disgisdb.recloser_evw
    where
        disgisdb.recloser_evw.subtypecd = '105'
        and disgisdb.recloser_evw.owned_by = 'MPC' 
        and disgisdb.recloser_evw.facility_status = 'E'
        and disgisdb.recloser_evw.dagroup_globalid is NOT NULL
        and disgisdb.recloser_evw.feederid Not In ('KC','S2546','S2566','S2576')
    UNION
    -- Regulators
    select 
        disgisdb.regulator_evw.feederid
    from
        disgisdb.regulator_evw
    where
        disgisdb.regulator_evw.owned_by = 'MPC' 
        and disgisdb.regulator_evw.facility_status = 'E'
        and disgisdb.regulator_evw.dagroup_globalid is NOT NULL
        and disgisdb.regulator_evw.feederid Not In ('KC','S2546','S2566','S2576')
    UNION
    -- Switch Gears
    select 
        disgisdb.switch_evw.feederid
    from
        disgisdb.switch_evw
    where
        disgisdb.switch_evw.dagroup_globalid is NOT NULL)
order by feederid
    
    