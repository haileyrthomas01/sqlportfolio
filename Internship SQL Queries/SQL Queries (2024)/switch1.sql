SELECT
    decode(substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    substation_evw.substation_name,
    getaway_evw.feederid,
    switch_evw.loc_num,
    switch_evw.recloser_globalid
FROM 
    (
    getaway_evw 
    INNER JOIN subunit_evw ON getaway_evw.subunit_globalid = subunit_evw.globalid
    )
    INNER JOIN substation_evw ON subunit_evw.substation_globalid = substation_evw.globalid
    INNER JOIN switch_evw ON getaway_evw.feederid = switch_evw.feederid
WHERE
    getaway_evw.last_we = 'N' and
    switch_evw.owned_by = 'MPC' and
    switch_evw.subtypecd = '126' and
    switch_evw.recloser_globalid is NULL
ORDER BY
    division,
    substation_evw.substation_name,
    getaway_evw.feederid
