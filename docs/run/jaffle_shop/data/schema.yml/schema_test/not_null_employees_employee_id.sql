select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from RAW.jaffle_shop.employees
where employee_id is null



      
    ) dbt_internal_test