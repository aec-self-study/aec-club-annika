{{ config(
  materialized = 'table'
  )}}

select
  date_trunc(created_at, month) as date_month,
  {%- for category in ['coffee_beans', 'merch', 'brewing_supplies'] %}
    sum(case when category = '{{category}}' then total end) as {{category}}_amount
  {%- if not loop.last %}, {% endif -%}
  {% endfor %}
from {{ ref('sales') }}
group by 1