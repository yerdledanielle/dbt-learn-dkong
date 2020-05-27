select 
    "ID" as id,
    "orderID" as order_id,
    "paymentMethod" as payment_method,
    amount / 100 as amount, -- to convert from cents to dollars
    created
from {{ source('stripe', 'payment') }}
