select 
    disgisdb.cust_data.ppid,
    disgisdb.cust_data.objectid,
    disgisdb.cust_data.name,
    disgisdb.cust_data.address,
    disgisdb.cust_data.account_num,
    disgisdb.cust_data.account_type,
    disgisdb.cust_data.phone,
    disgisdb.cust_data.oper_cntr,
    disgisdb.cust_data.meter_num
from 
    disgisdb.cust_data
order by
    disgisdb.cust_data.oper_cntr