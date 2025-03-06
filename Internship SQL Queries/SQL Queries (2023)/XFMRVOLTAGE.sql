SELECT
    disgisdb.transformer_obj_evw.hi_volt,
    disgisdb.transformer_obj_evw.kva_rating,
    COUNT(disgisdb.transformer_obj_evw.objectid) AS "XFMR COUNT"
FROM
    disgisdb.transformer_evw INNER JOIN disgisdb.transformer_obj_evw 
        ON (disgisdb.transformer_evw.globalid = disgisdb.transformer_obj_evw.transformer_globalid)
WHERE 
    disgisdb.transformer_obj_evw.hi_volt IN ('13.2','7.2')
         AND disgisdb.transformer_obj_evw.type IN ('CON', 'CSP', 'UAR') 
         AND disgisdb.transformer_evw.owned_by = 'MPC'
         AND disgisdb.transformer_evw.facility_status = 'E'
GROUP BY
    disgisdb.transformer_obj_evw.hi_volt,
    disgisdb.transformer_obj_evw.kva_rating
ORDER BY
    disgisdb.transformer_obj_evw.hi_volt,
    disgisdb.transformer_obj_evw.kva_rating
    