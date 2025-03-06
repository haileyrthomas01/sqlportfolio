select transformer_obj_evw.objectid, 
transformer_evw.latitude, transformer_evw.longitude,
transformer_evw.feederid, transformer_obj_evw.kva_rating as "SIZE", transformer_obj_evw.type
from transformer_evw inner join transformer_obj_evw on
    (transformer_evw.globalid = transformer_obj_evw.transformer_globalid)

