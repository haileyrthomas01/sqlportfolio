select 
    recloser_evw.objectid,
    recloser_evw.latitude,
    recloser_evw.longitude
from
    recloser_evw
where
    recloser_evw.subtypecd = '544'
    and recloser_evw.owned_by = 'MPC' 
    and recloser_evw.facility_status = 'E'
    and recloser_evw.feederid Not In ('KC','S2546','S2566','S2576')
