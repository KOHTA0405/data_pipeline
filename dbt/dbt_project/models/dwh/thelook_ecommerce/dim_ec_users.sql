select
    id as user_id,
    first_name,
    last_name,
    concat(first_name, ' ', last_name) as full_name,
    email,
    age,
    gender,
    state,
    city,
    postal_code,
    country,
    traffic_source,
    created_at
from {{ ref('stg_ec_users') }}

