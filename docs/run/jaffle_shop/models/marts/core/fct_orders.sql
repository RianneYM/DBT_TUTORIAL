

      create or replace transient table RAW.jaffle_shop.fct_orders  as
      (with orders as  (
    select * from RAW.jaffle_shop.stg_orders
),

payments as (
    select * from RAW.jaffle_shop.stg_payments
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
)

select * from final
      );
    