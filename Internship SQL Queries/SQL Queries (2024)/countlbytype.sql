SELECT
    COUNT(*),
    light_evw.ltype AS ltype1
FROM
    light_evw
GROUP BY
    light_evw.ltype
