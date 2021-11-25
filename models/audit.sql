{# in dbt Develop #}

{% set old_fct_orders_query %}
  select
    order_id,
    order_value_dollars,
    customer_id
  from {{ ref('customer_orders') }}
{% endset %}

{% set new_fct_orders_query %}
  select
    order_id,
    order_value_dollars,
    customer_id
  from {{ ref('fct_customer_orders') }}
{% endset %}

{{ audit_helper.compare_queries(
    a_query=old_fct_orders_query,
    b_query=new_fct_orders_query,
    primary_key="order_id"
) }}
