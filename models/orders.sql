with orders as (
select 
    order_id,
    customer_id
from {{ ref('stg_orders') }}),

payments as (
select
    order_id,
    sum(amount) as amount
from {{ ref('stg_payments') }}
group by order_id
),

final as (
select
    orders.order_id,
    orders.customer_id,
    payments.amount
from orders
left join payments using (order_id)
)

select * from final
