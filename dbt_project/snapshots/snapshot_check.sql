{% snapshot snapshot_check %}

{{
    config(
      target_schema='data_lake',
      unique_key='id',
      strategy='check',
      check_cols=[
        'id',
        'name',
        'created_at',
        'updated_at'
      ],
    )
}}

select
    id,
    name,
    created_at,
    updated_at
from {{ source("test_source", "raw_products") }}

{% endsnapshot %}