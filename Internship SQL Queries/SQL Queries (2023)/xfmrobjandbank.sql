select disgisdb.transformer_obj_evw.objectid, 
(disgisdb.transformer_evw.mapx || ', ' || disgisdb.transformer_evw.mapy) as coordinates,
disgisdb.transformer_evw.feederid, disgisdb.transformer_obj_evw.kva_rating as "SIZE", disgisdb.transformer_obj_evw.type
from disgisdb.transformer_evw inner join disgisdb.transformer_obj_evw on
    (disgisdb.transformer_evw.globalid = disgisdb.transformer_obj_evw.transformer_globalid)
