SELECT
    decode(substation_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    substation_evw.substation_name,
    getaway_evw.feederid,
    capacitor_evw.loc_num,
    capacitor_evw.owned_by,
    decode(capacitor_evw.voltage, '89', '23', '75', '12', '54', '4') as voltage,
    capacitor_evw.location,
    capacitor_evw.kvar,
    decode(capacitor_evw.dagroup_globalid, NULL, 'N', 'Y') AS SCADA,
    decode(capacitor_evw.ctrl, 'NOC', 'Fixed', 'Switched') as CONTROL_TYPE
FROM
    (
    getaway_evw 
    INNER JOIN subunit_evw ON getaway_evw.subunit_globalid = subunit_evw.globalid
    )
    INNER JOIN substation_evw ON subunit_evw.substation_globalid = substation_evw.globalid
    INNER JOIN capacitor_evw ON getaway_evw.feederid = capacitor_evw.feederid
WHERE
    getaway_evw.last_we = 'N' and
    capacitor_evw.owned_by = 'MPC'
ORDER BY
    division,
    substation_evw.substation_name,
    getaway_evw.feederid
