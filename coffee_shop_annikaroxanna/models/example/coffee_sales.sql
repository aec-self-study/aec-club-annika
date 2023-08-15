{{ config(
  materialized = 'table'
  )}}

select
  date_trunc(sold_at, month) as date_month,
  {%- for product_category in ['coffee_beans', 'merch', 'brewing_supplies'] %}
    sum(case when product_category = '{{product_category}}' then total end) as {{product_category}}_amount
  {%- if not loop.last %}, {% endif -%}
  {% endfor %}
from {{ ref('sales') }}
group by 1