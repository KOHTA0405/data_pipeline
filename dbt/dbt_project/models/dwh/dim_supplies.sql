select
    supply_id,
    supply_name,
    supply_cost,
    is_perishable_supply
from {{ ref('stg_supplies') }}
