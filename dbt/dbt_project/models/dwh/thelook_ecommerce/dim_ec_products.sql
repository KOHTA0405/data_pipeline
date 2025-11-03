select
    product_id,
    product_sku,
    product_name,
    product_category,
    brand,
    department,
    distribution_center_id,
    retail_price,
    cost,
    safe_divide(retail_price - cost, retail_price) * 100 as profit_margin_percent
from {{ ref('stg_ec_products') }}

