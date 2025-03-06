SELECT
    COUNT(*),
    disgisdb.light_evw.ltype AS ltype1
FROM
    disgisdb.light_evw
GROUP BY
    disgisdb.light_evw.ltype