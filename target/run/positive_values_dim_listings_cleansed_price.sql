
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.DEV__test_failures.positive_values_dim_listings_cleansed_price
    
      
    ) dbt_internal_test