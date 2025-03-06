SELECT
    count(customer_count.customers) as "SHN FEEDER COUNT"
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
