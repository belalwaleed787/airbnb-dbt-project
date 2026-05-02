
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.DEV__test_failures.dbt_expectations_expect_column_7425ea65ec1865448a468be52877f417
    
      
    ) dbt_internal_test