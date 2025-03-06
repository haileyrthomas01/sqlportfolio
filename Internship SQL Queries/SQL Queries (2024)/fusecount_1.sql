select 
    count(disgisdb.fuse_evw.objectid) as count
from
    disgisdb.fuse_evw
where
    disgisdb.fuse_evw.owned_by = 'MPC' 
    and disgisdb.fuse_evw.facility_status = 'E'
    and disgisdb.fuse_evw.feederid Not In ('KC','S2546','S2566','S2576')