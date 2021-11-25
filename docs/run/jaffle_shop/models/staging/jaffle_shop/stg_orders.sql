
  create or replace  view RAW.jaffle_shop.stg_orders  as (
    with

source as (

    select * from raw.jaffle_shop.orders

),

transformed as (

    select
        
        id as order_id,
        user_id	as customer_id,
        order_date as order_placed_at,
        status as order_status,
        min(order_date) over (partition by order_id) as fdos,
        case when fdos = order_placed_at
            then 'new'
            else 'return'
        end as nvsr
    
    from source

)

select * from transformed
  );
