
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.DEV__test_failures.accepted_values_fct_reviews_6e0d26894146b73d81f63c9988fa23ba
    
      
    ) dbt_internal_test