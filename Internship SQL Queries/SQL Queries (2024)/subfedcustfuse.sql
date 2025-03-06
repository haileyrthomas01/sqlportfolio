SELECT
    decode(substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    substation_evw.substation_name,
    getaway_evw.feederid,
    customer_count.customers,
    fuse_evw.loc_num,
    fuse_evw.frate,
    fuse_evw.ftype
FROM
    (
    getaway_evw 
    INNER JOIN subunit_evw ON getaway_evw.subunit_globalid = subunit_evw.globalid
    )
    INNER JOIN substation_evw ON subunit_evw.substation_globalid = substation_evw.globalid
    INNER JOIN fuse_evw ON getaway_evw.feederid = fuse_evw.feederid
    INNER JOIN customer_count ON getaway_evw.feederid = customer_count.switch_loc_num
WHERE
    getaway_evw.last_we = 'N'
    and fuse_evw.frate >= 100
ORDER BY
    division,
    substation_evw.substation_name,
    getaway_evw.feederid
