SELECT
    COUNT(*) AS poles,
    disgisdb.pole_evw.county
FROM
    disgisdb.pole_evw
GROUP BY
    disgisdb.pole_evw.county