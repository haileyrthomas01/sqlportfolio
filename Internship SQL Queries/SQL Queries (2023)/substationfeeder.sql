SELECT
    decode(disgisdb.substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid
FROM
    (
             disgisdb.getaway_evw
        INNER JOIN disgisdb.subunit_evw ON disgisdb.getaway_evw.subunit_globalid = disgisdb.subunit_evw.globalid
    )
    INNER JOIN disgisdb.substation_evw ON disgisdb.subunit_evw.substation_globalid = disgisdb.substation_evw.globalid
WHERE
    disgisdb.getaway_evw.last_we = 'N'
ORDER BY
    division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid