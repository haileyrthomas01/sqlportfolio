SELECT
    decode(disgisdb.substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid,
    disgisdb.customer_count.customers,
    disgisdb.fuse_evw.loc_num,
    disgisdb.fuse_evw.frate,
    disgisdb.fuse_evw.ftype
FROM
    (
    disgisdb.getaway_evw 
    INNER JOIN disgisdb.subunit_evw ON disgisdb.getaway_evw.subunit_globalid = disgisdb.subunit_evw.globalid
    )
    INNER JOIN disgisdb.substation_evw ON disgisdb.subunit_evw.substation_globalid = disgisdb.substation_evw.globalid
    INNER JOIN disgisdb.fuse_evw ON disgisdb.getaway_evw.feederid = disgisdb.fuse_evw.feederid
    INNER JOIN disgisdb.customer_count ON disgisdb.getaway_evw.feederid = disgisdb.customer_count.switch_loc_num
WHERE
    disgisdb.getaway_evw.last_we = 'N'
    and disgisdb.fuse_evw.frate >= 100
ORDER BY
    division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid