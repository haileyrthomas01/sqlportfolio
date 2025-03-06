select 
    cust_data.ppid,
    cust_data.objectid,
    cust_data.name,
    cust_data.address,
    cust_data.account_num,
    cust_data.account_type,
    cust_data.phone,
    cust_data.oper_cntr,
    cust_data.meter_num
from 
    cust_data
order by
    cust_data.oper_cntr
