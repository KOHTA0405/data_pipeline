select distinct
    status as order_status,
    status as order_status_description
from {{ ref('stg_ec_order_items') }}
where status is not null
order by status

