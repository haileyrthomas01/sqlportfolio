select 
    count(disgisdb.swgroup_evw.objectid) as count
from
    disgisdb.swgroup_evw
where
    disgisdb.swgroup_evw.dagroup_globalid is NOT NULL
