{% test is_even(model, column_name) %}
    select
        {{ column_name }}
 
    from {{ model }}
 where not(mod({{ column_name }}, 2) = 0)
 {% endtest %}



select {{column_name}}
from {{model}}
where not {{column_name}} > 0