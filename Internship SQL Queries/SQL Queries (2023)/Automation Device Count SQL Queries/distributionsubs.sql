SELECT
    count(DISTINCT substation_evw.substation_name) AS count
FROM
    getaway_evw 
    INNER JOIN subunit_evw ON getaway_evw.subunit_globalid = subunit_evw.globalid
    INNER JOIN substation_evw ON subunit_evw.substation_globalid = substation_evw.globalid
WHERE
    getaway_evw.last_we = 'N'
