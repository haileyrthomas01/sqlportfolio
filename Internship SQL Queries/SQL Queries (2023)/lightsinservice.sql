SELECT
    COUNT(*) AS lights,
    light_evw.inservice_ind
FROM
    light_evw
GROUP BY
    light_evw.inservice_ind
