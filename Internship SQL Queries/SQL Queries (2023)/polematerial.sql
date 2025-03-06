SELECT
    COUNT(*) as poles,
    disgisdb.pole_evw.matl AS material
FROM
    disgisdb.pole_evw
GROUP BY
    disgisdb.pole_evw.matl