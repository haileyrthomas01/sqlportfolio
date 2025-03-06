select
    count(disgisdb.transformer_evw.objectid) as COUNT
from
    disgisdb.transformer_evw
where 
    disgisdb.transformer_evw.loc_num is NULL 
    or disgisdb.transformer_evw.loc_num <> 'TCMS DUMMY'