
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.DEV__test_failures.dbt_expectations_expect_column_ad59933b884ded6ec0d91a149ac9af59
    
      
    ) dbt_internal_test