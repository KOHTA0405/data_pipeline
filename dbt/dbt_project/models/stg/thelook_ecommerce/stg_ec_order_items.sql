with source as (

    select * from {{ source('thelook_ecommerce', 'order_items') }}

),

renamed as (

    select * from source

)

select * from renamed
