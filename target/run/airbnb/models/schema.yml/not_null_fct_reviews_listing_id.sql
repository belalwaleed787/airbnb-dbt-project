
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select listing_id
from airbnb.DEV.fct_reviews
where listing_id is null



  
  
      
    ) dbt_internal_test