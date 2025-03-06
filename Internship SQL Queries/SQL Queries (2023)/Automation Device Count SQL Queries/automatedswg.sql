select 
    count(swgroup_evw.objectid) as count
from
    swgroup_evw
where
    swgroup_evw.dagroup_globalid is NOT NULL
