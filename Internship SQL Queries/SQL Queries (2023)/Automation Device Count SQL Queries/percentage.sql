select 
(SELECT
    SUM(customer_count.customers) AS customers
FROM
         customer_count
    INNER JOIN getaway_evw ON customer_count.feederid = getaway_evw.feederid
WHERE
    customer_count.parent_ptag IS NULL
    and getaway_evw.shn_name IS NOT NULL
    and getaway_evw.last_we = 'N' )
    
/ (SELECT
    SUM(customer_count.customers) AS customers
FROM
         customer_count
    INNER JOIN getaway_evw ON customer_count.feederid = getaway_evw.feederid
WHERE
    customer_count.parent_ptag IS NULL
    AND getaway_evw.last_we = 'N' ) * 100 as percentage
from customer_count
