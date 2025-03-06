SELECT
    disgisdb.light_evw.objectid,
    disgisdb.light_evw.type_fixture,
    decode(disgisdb.light_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division,
    disgisdb.light_evw.hgt_decpole,
    disgisdb.light_evw.siz,
    disgisdb.light_evw.ltype
FROM
    disgisdb.light_evw
GROUP BY
    disgisdb.light_evw.objectid,
    disgisdb.light_evw.type_fixture,
    disgisdb.light_evw.hgt_decpole,
    disgisdb.light_evw.siz,
    disgisdb.light_evw.ltype,
    disgisdb.light_evw.org_id
ORDER BY
    division