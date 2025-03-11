{{
  config(
    materialized="incremental",
    unique_key=["id"],
  )
}}

select
    id,
    name,
    created_at,
    updated_at
from {{ source("test_source", "raw_products") }}
{% if is_incremental() %}
where
    updated_at > (select max(updated_at) from {{ this }})
{% endif %}
