with payments as (
select * from RAW.jaffle_shop.stg_payments
),

aggregated as (
select
sum(amount) as total_revenue
from payments
where status = 'success'
)

select * from aggregated