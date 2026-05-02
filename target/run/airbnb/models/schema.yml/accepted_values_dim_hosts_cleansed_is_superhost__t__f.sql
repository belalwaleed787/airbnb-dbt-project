
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        is_superhost as value_field,
        count(*) as n_records

    from airbnb.DEV.dim_hosts_cleansed
    group by is_superhost

)

select *
from all_values
where value_field not in (
    't','f'
)



  
  
      
    ) dbt_internal_test