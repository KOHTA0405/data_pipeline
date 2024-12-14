{% snapshot snapshot_timestamp %}

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
    updated_at
from {{ source("test_source", "raw_products") }}

{% endsnapshot %}