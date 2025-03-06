SELECT
    COUNT(*),
    disgisdb.light_evw.siz   AS  "LIGHT SIZE",
    disgisdb.light_evw.ltype AS "LUMINAIRE TYPE"
FROM
    disgisdb.light_evw
GROUP BY
    disgisdb.light_evw.siz,
    disgisdb.light_evw.ltype