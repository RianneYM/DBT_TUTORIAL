select
	order_id,
	sum(amount) as total_amount
from RAW.jaffle_shop.stg_payments
group by 1
having not(total_amount >= 0)