{{
    config(
        materialized='table'
    )
}}


select
orderid,
orderdate,
shipdate,
shipmode,
o.customerid,
o.productid,
ordersellingprice,
ordercostprice,
customername,
segment,
country,
category,
productname,
subcategory,
ordersellingprice - ordercostprice as orderprofit
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid