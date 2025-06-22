with source as (

    select * from {{ source('thelook_ecommerce', 'inventory_items') }}

),

renamed as (

    select * from source

)

select * from renamed
