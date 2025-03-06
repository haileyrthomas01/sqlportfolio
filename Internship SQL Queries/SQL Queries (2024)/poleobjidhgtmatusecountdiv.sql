SELECT
    pole_evw.objectid,
    pole_evw.height,
    pole_evw.matl,
    pole_evw.pole_use,
    pole_evw.county,
    decode(pole_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division
FROM
    pole_evw
ORDER BY
    pole_evw.county
