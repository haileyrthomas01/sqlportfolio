SELECT
    decode(disgisdb.substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid,
    disgisdb.capacitor_evw.loc_num,
    disgisdb.capacitor_evw.owned_by,
    decode(disgisdb.capacitor_evw.voltage, '89', '23', '75', '12', '54', '4') as voltage,
    disgisdb.capacitor_evw.location,
    disgisdb.capacitor_evw.kvar,
    decode(disgisdb.capacitor_evw.dagroup_globalid, NULL, 'N', 'Y') AS SCADA,
    decode(disgisdb.capacitor_evw.ctrl, 'NOC', 'Fixed', 'Switched') as CONTROL_TYPE
FROM
    (
    disgisdb.getaway_evw 
    INNER JOIN disgisdb.subunit_evw ON disgisdb.getaway_evw.subunit_globalid = disgisdb.subunit_evw.globalid
    )
    INNER JOIN disgisdb.substation_evw ON disgisdb.subunit_evw.substation_globalid = disgisdb.substation_evw.globalid
    INNER JOIN disgisdb.capacitor_evw ON disgisdb.getaway_evw.feederid = disgisdb.capacitor_evw.feederid
WHERE
    disgisdb.getaway_evw.last_we = 'N' and
    disgisdb.capacitor_evw.owned_by = 'MPC'
ORDER BY
    division,
    disgisdb.substation_evw.substation_name,
    disgisdb.getaway_evw.feederid