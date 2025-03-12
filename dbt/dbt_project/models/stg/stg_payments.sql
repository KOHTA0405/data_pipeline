{{
  config(
    materialized = "table"
  )
}}

with source as (
    select * from {{ source('jaffle_shop', 'raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,
        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount,
        current_datetime('Asia/Tokyo') as loaded_at_jst

    from source

)

select * from renamed