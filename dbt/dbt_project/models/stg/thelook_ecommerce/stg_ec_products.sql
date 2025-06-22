with source as (

    select * from {{ source('thelook_ecommerce', 'products') }}

),

renamed as (

    select * from source

)

select * from renamed
