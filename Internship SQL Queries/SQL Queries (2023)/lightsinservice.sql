SELECT
    COUNT(*) AS lights,
    disgisdb.light_evw.inservice_ind
FROM
    disgisdb.light_evw
GROUP BY
    disgisdb.light_evw.inservice_ind