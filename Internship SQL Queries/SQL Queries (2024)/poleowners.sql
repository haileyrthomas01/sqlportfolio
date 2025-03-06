SELECT
    COUNT(*),
    disgisdb.pole_evw.owned_by AS owned_by1
FROM
    disgisdb.pole_evw
GROUP BY
    disgisdb.pole_evw.owned_by
ORDER BY
    owned_by1