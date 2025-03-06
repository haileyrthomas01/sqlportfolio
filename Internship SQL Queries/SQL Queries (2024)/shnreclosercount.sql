select 
    count(disgisdb.recloser_evw.objectid) as count
from
    disgisdb.recloser_evw
where
    disgisdb.recloser_evw.shn_name is NOT NULL