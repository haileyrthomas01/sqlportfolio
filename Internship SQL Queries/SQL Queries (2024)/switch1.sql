SELECT
    decode(disgisdb.substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid,
    disgisdb.switch_evw.loc_num,
    disgisdb.switch_evw.recloser_globalid
FROM 
    (
    disgisdb.getaway_evw 
    INNER JOIN disgisdb.subunit_evw ON disgisdb.getaway_evw.subunit_globalid = disgisdb.subunit_evw.globalid
    )
    INNER JOIN disgisdb.substation_evw ON disgisdb.subunit_evw.substation_globalid = disgisdb.substation_evw.globalid
    INNER JOIN disgisdb.switch_evw ON disgisdb.getaway_evw.feederid = disgisdb.switch_evw.feederid
WHERE
    disgisdb.getaway_evw.last_we = 'N' and
    disgisdb.switch_evw.owned_by = 'MPC' and
    disgisdb.switch_evw.subtypecd = '126' and
    disgisdb.switch_evw.recloser_globalid is NULL
ORDER BY
    division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid