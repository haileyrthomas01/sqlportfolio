SELECT
    count(customer_count.customers) AS "TOTAL FEEDERS"
FROM
         customer_count
    INNER JOIN getaway_evw ON customer_count.feederid = getaway_evw.feederid
WHERE
    customer_count.parent_ptag IS NULL
    AND getaway_evw.last_we = 'N'
