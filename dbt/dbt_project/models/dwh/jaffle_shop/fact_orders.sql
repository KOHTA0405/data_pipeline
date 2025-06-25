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
aggregated_products__supplies as (
    select
        products.product_id,
        products.product_name,
        products.product_type,
        products.product_price,
        sum(supplies.supply_cost) as supply_cost
    from {{ ref('stg_products') }} as products
    inner join {{ ref('stg_supplies') }} as supplies
        on products.product_id = supplies.product_id
    group by all
    order by 1
),
final as (
    select
        joined_orders__order_items.product_id,
        joined_orders__order_items.customer_id,
        joined_orders__order_items.location_id,
        joined_orders__order_items.ordered_at,
        joined_orders__order_items.order_quantity,
        products_supplies.product_price,
        products_supplies.supply_cost,
        joined_orders__order_items.order_id
    from joined_orders__order_items
    inner join aggregated_products__supplies as products_supplies
        on joined_orders__order_items.product_id = products_supplies.product_id
)
select * from final
