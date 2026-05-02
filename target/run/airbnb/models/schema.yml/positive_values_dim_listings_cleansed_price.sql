
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

    select * from airbnb.DEV.dim_listings_cleansed
    where price<=0


  
  
      
    ) dbt_internal_test