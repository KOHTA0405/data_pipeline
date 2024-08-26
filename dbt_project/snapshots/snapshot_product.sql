{% snapshot snapshot_product %}

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
    updated_at_jst
from {{ ref("product") }}

{% endsnapshot %}