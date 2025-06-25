with source as (

    select * from {{ source('thelook_ecommerce', 'products') }}

),

renamed as (

    select
        id as product_id,
        sku as product_sku,
        name as product_name,
        category as product_category,
        brand,
        department,
        distribution_center_id,
        retail_price,
        cost
    from source

)

select * from renamed
