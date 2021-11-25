
  create or replace  view RAW.jaffle_shop.stg_customers  as (
    with

source as (

    select * from raw.jaffle_shop.customers

),

transformed as (

    select

        id as customer_id,
        first_name as customer_first_name,
        last_name as customer_last_name

    from source

)

select * from transformed
  );
