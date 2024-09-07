{{
  config(
    materialized = "table"
  )
}}

with source as (
    select * from {{ source('dev', 'raw_orders') }}

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        current_datetime('Asia/Tokyo') as loaded_at_jst

    from source

)

select * from renamed