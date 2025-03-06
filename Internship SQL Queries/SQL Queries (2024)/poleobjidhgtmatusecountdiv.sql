SELECT
    disgisdb.pole_evw.objectid,
    disgisdb.pole_evw.height,
    disgisdb.pole_evw.matl,
    disgisdb.pole_evw.pole_use,
    disgisdb.pole_evw.county,
    decode(disgisdb.pole_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division
FROM
    disgisdb.pole_evw
ORDER BY
    disgisdb.pole_evw.county