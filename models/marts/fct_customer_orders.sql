with

-- import CTEs

customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),


-- logical CTEs

paid_orders as (

    select

        orders.*,
        payments.total_amount_paid,
        payments.payment_finalized_date,
        customers.customer_first_name,
        customers.customer_last_name

    from orders

    left join payments
        on orders.order_id = payments.order_id
    
    left join customers
        on orders.customer_id = customers.customer_id

),

-- final CTE

final as (

    select

        paid_orders.*,

        row_number() over (order by order_id) as transaction_seq,

        row_number() over (partition by customer_id
            order by order_id) as customer_sales_seq,

        sum(total_amount_paid) over (partition by customer_id) as customer_lifetime_value

    from paid_orders
    order by order_id

)

-- simple select statement

select * from final

