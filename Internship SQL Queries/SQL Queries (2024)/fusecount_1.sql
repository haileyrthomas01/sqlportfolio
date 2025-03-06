select 
    count(fuse_evw.objectid) as count
from
    fuse_evw
where
    fuse_evw.owned_by = 'MPC' 
    and fuse_evw.facility_status = 'E'
    and fuse_evw.feederid Not In ('KC','S2546','S2566','S2576')
