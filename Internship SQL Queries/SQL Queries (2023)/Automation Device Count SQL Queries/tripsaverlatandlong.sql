select 
    disgisdb.recloser_evw.objectid,
    disgisdb.recloser_evw.latitude,
    disgisdb.recloser_evw.longitude
from
    disgisdb.recloser_evw
where
    disgisdb.recloser_evw.subtypecd = '544'
    and disgisdb.recloser_evw.owned_by = 'MPC' 
    and disgisdb.recloser_evw.facility_status = 'E'
    and disgisdb.recloser_evw.feederid Not In ('KC','S2546','S2566','S2576')