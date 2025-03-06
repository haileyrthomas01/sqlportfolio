SELECT
    count(getaway_evw.feederid) as "COUNT"
FROM
    getaway_evw 
WHERE   
    getaway_evw.dagroup_globalid IS NOT NULL
    and getaway_evw.last_we = 'N'
ORDER BY
    "COUNT"
