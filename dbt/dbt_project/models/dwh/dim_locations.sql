select
    location_id,
    location_name,
    tax_rate,
    opened_date
from {{ ref('stg_locations') }}
