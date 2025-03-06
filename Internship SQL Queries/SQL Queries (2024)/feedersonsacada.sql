SELECT
    decode(disgisdb.substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid,
    disgisdb.recloser_evw.loc_num,
    decode(disgisdb.recloser_evw.dagroup_globalid, NULL, 'N', 'Y') AS SCADA
FROM
    (
    disgisdb.getaway_evw 
    INNER JOIN disgisdb.subunit_evw ON disgisdb.getaway_evw.subunit_globalid = disgisdb.subunit_evw.globalid
    )
    INNER JOIN disgisdb.substation_evw ON disgisdb.subunit_evw.substation_globalid = disgisdb.substation_evw.globalid
    INNER JOIN disgisdb.recloser_evw ON disgisdb.getaway_evw.feederid = disgisdb.recloser_evw.feederid
WHERE   
    disgisdb.recloser_evw.subtypecd = '105' 
    and disgisdb.recloser_evw.facility_status = 'E'
ORDER BY
    division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid,
    disgisdb.recloser_evw.loc_num