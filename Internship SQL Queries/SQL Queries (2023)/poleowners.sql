SELECT
    COUNT(*),
    pole_evw.owned_by AS owned_by1
FROM
    pole_evw
GROUP BY
    pole_evw.owned_by
ORDER BY
    owned_by1
