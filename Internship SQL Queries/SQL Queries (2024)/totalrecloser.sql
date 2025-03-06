select 
    count(recloser_evw.objectid) as count
from
    recloser_evw
where
    recloser_evw.subtypecd = '105'
    and recloser_evw.owned_by = 'MPC' 
    and recloser_evw.facility_status = 'E'
    and recloser_evw.feederid Not In ('KC','S2546','S2566','S2576')
