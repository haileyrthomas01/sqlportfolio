SELECT
    decode(disgisdb.substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid,
    disgisdb.customer_count.customers
FROM
    (
    disgisdb.getaway_evw 
    INNER JOIN disgisdb.subunit_evw ON disgisdb.getaway_evw.subunit_globalid = disgisdb.subunit_evw.globalid
    )
    INNER JOIN disgisdb.substation_evw ON disgisdb.subunit_evw.substation_globalid = disgisdb.substation_evw.globalid
    INNER JOIN disgisdb.customer_count ON disgisdb.getaway_evw.feederid = disgisdb.customer_count.feederid
WHERE
    disgisdb.getaway_evw.last_we = 'N'
    and disgisdb.customer_count.parent_ptag IS NULL
    and disgisdb.getaway_evw.shn_name IS NOT NULL
ORDER BY
    division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid
 