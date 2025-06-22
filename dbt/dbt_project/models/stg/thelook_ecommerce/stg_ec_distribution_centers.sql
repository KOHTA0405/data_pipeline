with source as (

    select * from {{ source('thelook_ecommerce', 'distribution_centers') }}

),

renamed as (

    select * from source

)

select * from renamed
