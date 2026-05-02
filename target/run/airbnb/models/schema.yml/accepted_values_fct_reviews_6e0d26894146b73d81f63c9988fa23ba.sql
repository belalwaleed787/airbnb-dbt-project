
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        REVIEW_SENTIMENT as value_field,
        count(*) as n_records

    from airbnb.DEV.fct_reviews
    group by REVIEW_SENTIMENT

)

select *
from all_values
where value_field not in (
    'positive','neutral','negative'
)



  
  
      
    ) dbt_internal_test