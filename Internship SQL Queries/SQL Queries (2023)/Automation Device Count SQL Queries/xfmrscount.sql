select
    count(transformer_obj_evw.objectid) as COUNT
from
    transformer_obj_evw inner join transformer_evw
    on transformer_obj_evw.transformer_globalid = transformer_evw.globalid
where 
    transformer_evw.loc_num is NULL 
    or transformer_evw.loc_num <> 'TCMS DUMMY'
