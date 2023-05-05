with orders AS (
  select 
    customer_id
    , min(created_at) as first_order_at
    , count(*) as number_of_orders
  from `analytics-engineers-club.coffee_shop.orders`
  group by 1
)

select
  customers.id as customer_id
  , customers.name 
  , customers.email
  , orders.first_order_at
  , orders.number_of_orders
from `analytics-engineers-club.coffee_shop.customers` as customers
left join orders
on customers.id =  orders.customer_id
order by orders.first_order_at