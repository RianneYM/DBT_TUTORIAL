
    
    

select
    id as unique_field,
    count(*) as n_records

from RAW.jaffle_shop.my_first_dbt_model
where id is not null
group by id
having count(*) > 1


