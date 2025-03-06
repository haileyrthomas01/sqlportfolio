SELECT
    SUM(disgisdb.customer_count.customers) AS customers
FROM
         disgisdb.customer_count
    INNER JOIN disgisdb.getaway_evw ON disgisdb.customer_count.feederid = disgisdb.getaway_evw.feederid
WHERE
    disgisdb.customer_count.parent_ptag IS NULL
    AND disgisdb.getaway_evw.last_we = 'N'