SELECT
    decode(substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    substation_evw.substation_name,
    getaway_evw.feederid
FROM
    (
             getaway_evw
        INNER JOIN subunit_evw ON getaway_evw.subunit_globalid = subunit_evw.globalid
    )
    INNER JOIN substation_evw ON subunit_evw.substation_globalid = substation_evw.globalid
WHERE
    getaway_evw.last_we = 'N'
ORDER BY
    division,
    substation_evw.substation_name,
    getaway_evw.feederid
