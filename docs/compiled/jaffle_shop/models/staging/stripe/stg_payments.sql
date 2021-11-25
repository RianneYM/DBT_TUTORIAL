with

source as (

    select * from raw.stripe.payment

),

transformed as (

    select

        id as payment_id,
        orderid as order_id,
        max(created) over (partition by payment_id) as payment_finalized_date,
        round(sum(amount) over (partition by payment_id) / 100.00, 2) as total_amount_paid
    
    from source
    where status != 'fail'

)

select * from transformed