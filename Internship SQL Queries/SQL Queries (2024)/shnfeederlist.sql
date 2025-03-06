SELECT
    decode(substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    substation_evw.substation_name,
    getaway_evw.feederid,
    customer_count.customers
FROM
    (
    getaway_evw 
    INNER JOIN subunit_evw ON getaway_evw.subunit_globalid = subunit_evw.globalid
    )
    INNER JOIN substation_evw ON subunit_evw.substation_globalid = substation_evw.globalid
    INNER JOIN customer_count ON getaway_evw.feederid = customer_count.feederid
WHERE
    getaway_evw.last_we = 'N'
    and customer_count.parent_ptag IS NULL
    and getaway_evw.shn_name IS NOT NULL
ORDER BY
    division,
    substation_evw.substation_name,
    getaway_evw.feederid
 
