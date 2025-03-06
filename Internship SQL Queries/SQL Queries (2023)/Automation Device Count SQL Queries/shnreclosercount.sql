select 
    count(recloser_evw.objectid) as count
from
    recloser_evw
where
    recloser_evw.shn_name is NOT NULL
