SELECT
    COUNT(*),
    light_evw.siz   AS  "LIGHT SIZE",
    light_evw.ltype AS "LUMINAIRE TYPE"
FROM
    light_evw
GROUP BY
    light_evw.siz,
    light_evw.ltype
