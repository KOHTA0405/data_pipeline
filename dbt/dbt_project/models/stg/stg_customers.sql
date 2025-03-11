{{
  config(
    materialized = "table"
  )
}}

with source as (
    select * from {{ source('jaffle_shop', 'raw_customers') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        current_datetime('Asia/Tokyo') as loaded_at_jst

    from source

)

select * from renamed