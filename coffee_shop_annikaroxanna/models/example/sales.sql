 {{ config( MATERIALIZED="table" )}}

SELECT
  orders.id,
  orders.created_at,
  orders.total,
  products.name,
  products.category,
  product_prices.price
FROM
  {{ source('coffee_shop', 'orders') }} AS orders
LEFT JOIN
  {{ ref('customers') }} AS customers
ON
  customers.customer_id = orders.customer_id
LEFT JOIN
  {{ source('coffee_shop', 'order_items') }} AS order_items
ON
  orders.id = order_items.order_id
LEFT JOIN
  {{ source('coffee_shop', 'products') }} AS products
ON
  order_items.product_id = products.id
LEFT JOIN
  {{ source('coffee_shop', 'product_prices') }} AS product_prices
ON
  products.id = product_prices.product_id
  AND orders.created_at >= product_prices.created_at
  AND ( orders.created_at < product_prices.ended_at
    OR product_prices.ended_at IS NULL)