{{
    config(
        partition_by = {
            'field': 'ordered_at',
            'data_type': 'datetime',
            'granularity': 'day'
        }
    )
}}

with aggregated_order_items as (
    select
        order_id,
        product_id,
        count(product_id) as order_quantity
    from {{ ref('stg_order_items') }} as order_items
    group by all
),
joined_orders__order_items as (
    select
        distinct
        order_items.product_id,
        orders.customer_id,
        orders.location_id,
        orders.ordered_at,
        order_items.order_quantity,
        order_items.order_id
    from {{ ref('stg_orders') }} as orders
    inner join aggregated_order_items as order_items
        on orders.order_id = order_items.order_id
),
final as (
    select
        joined_orders__order_items.product_id,
        joined_orders__order_items.customer_id,
        joined_orders__order_items.location_id,
        joined_orders__order_items.ordered_at,
        joined_orders__order_items.order_quantity,
        products.product_price
    from joined_orders__order_items
    left join {{ ref('stg_products') }} as products
        on joined_orders__order_items.product_id = products.product_id
)
select * from final
