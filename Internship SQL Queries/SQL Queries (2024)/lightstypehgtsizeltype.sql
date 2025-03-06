SELECT
    light_evw.objectid,
    light_evw.type_fixture,
    decode(light_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    light_evw.hgt_decpole,
    light_evw.siz,
    light_evw.ltype
FROM
    light_evw
GROUP BY
    light_evw.objectid,
    light_evw.type_fixture,
    light_evw.hgt_decpole,
    light_evw.siz,
    light_evw.ltype,
    light_evw.org_id
ORDER BY
    division
