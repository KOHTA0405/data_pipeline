{% snapshot snapshot_product_add_last_updated_at %}

{{
    config(
      target_schema='landing',
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at_jst',
    )
}}

select
    id,
    name,
    created_at_jst,
    updated_at_jst,
    current_datetime('Asia/Tokyo') as snapshot_last_updated_at
from {{ ref("product") }}

{% endsnapshot %}