SELECT
    count(disgisdb.getaway_evw.feederid) as "COUNT"
FROM
    disgisdb.getaway_evw 
WHERE   
    disgisdb.getaway_evw.dagroup_globalid IS NOT NULL
    and disgisdb.getaway_evw.last_we = 'N'
ORDER BY
    "COUNT"