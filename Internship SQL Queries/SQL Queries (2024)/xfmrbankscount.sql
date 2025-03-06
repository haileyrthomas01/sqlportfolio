select
    count(transformer_evw.objectid) as COUNT
from
    transformer_evw
where 
    transformer_evw.loc_num is NULL 
    or transformer_evw.loc_num <> 'TCMS DUMMY'
