{% snapshot snapshot_timestamp_add_col %}

{{
    config(
      target_schema='data_lake',
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select
    id,
    name,
    created_at,
    updated_at,
    current_timestamp() as last_updated_at
from {{ source("test_source", "raw_product") }}

{% endsnapshot %}