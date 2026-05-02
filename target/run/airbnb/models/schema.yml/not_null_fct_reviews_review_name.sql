
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select review_name
from AIRBNB.DEV.fct_reviews
where review_name is null



  
  
      
    ) dbt_internal_test