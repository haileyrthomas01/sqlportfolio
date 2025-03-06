SELECT
    COUNT(*) AS poles,
    pole_evw.county
FROM
    pole_evw
GROUP BY
    pole_evw.county
