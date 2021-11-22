
  create or replace  view RAW.jaffle_shop.my_second_dbt_model  as (
    -- Use the `ref` function to select from other models

select *
from RAW.jaffle_shop.my_first_dbt_model
where id = 1
  );
