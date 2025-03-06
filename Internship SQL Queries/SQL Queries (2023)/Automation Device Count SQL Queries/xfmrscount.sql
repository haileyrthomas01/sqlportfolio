select
    count(disgisdb.transformer_obj_evw.objectid) as COUNT
from
    disgisdb.transformer_obj_evw inner join disgisdb.transformer_evw
    on disgisdb.transformer_obj_evw.transformer_globalid = disgisdb.transformer_evw.globalid
where 
    disgisdb.transformer_evw.loc_num is NULL 
    or disgisdb.transformer_evw.loc_num <> 'TCMS DUMMY'