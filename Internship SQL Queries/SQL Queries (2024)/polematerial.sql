SELECT
    COUNT(*) as poles,
    pole_evw.matl AS material
FROM
    pole_evw
GROUP BY
    pole_evw.matl
