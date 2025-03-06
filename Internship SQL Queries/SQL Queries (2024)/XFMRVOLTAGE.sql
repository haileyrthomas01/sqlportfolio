SELECT
    transformer_obj_evw.hi_volt,
    transformer_obj_evw.kva_rating,
    COUNT(transformer_obj_evw.objectid) AS "XFMR COUNT"
FROM
    transformer_evw INNER JOIN transformer_obj_evw 
        ON (transformer_evw.globalid = transformer_obj_evw.transformer_globalid)
WHERE 
    transformer_obj_evw.hi_volt IN ('13.2','7.2')
         AND transformer_obj_evw.type IN ('CON', 'CSP', 'UAR') 
         AND transformer_evw.owned_by = 'MPC'
         AND transformer_evw.facility_status = 'E'
GROUP BY
    transformer_obj_evw.hi_volt,
    transformer_obj_evw.kva_rating
ORDER BY
    transformer_obj_evw.hi_volt,
    transformer_obj_evw.kva_rating
    
