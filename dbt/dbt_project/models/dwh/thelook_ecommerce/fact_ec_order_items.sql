{{
    config(
        partition_by = {
            'field': 'order_date',
            'data_type': 'date',
            'granularity': 'day'
        }
    )
}}

with order_items as (
    select * from {{ ref('stg_ec_order_items') }}
),

products as (
    select * from {{ ref('stg_ec_products') }}
),

final as (
    select
        order_items.order_item_id,
        order_items.order_id,
        order_items.user_id,
        order_items.product_id,
        order_items.inventory_item_id,
        order_items.status,
        products.distribution_center_id,
        date(order_items.created_at) as order_date,
        order_items.created_at,
        order_items.shipped_at,
        order_items.delivered_at,
        order_items.returned_at,
        order_items.sale_price,
        products.cost,
        order_items.sale_price - products.cost as profit,
        1 as order_quantity
    from order_items
    inner join products
        on order_items.product_id = products.product_id
)

select * from final

