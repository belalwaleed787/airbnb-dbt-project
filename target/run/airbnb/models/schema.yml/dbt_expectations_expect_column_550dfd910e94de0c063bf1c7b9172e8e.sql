
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.DEV__test_failures.dbt_expectations_expect_column_550dfd910e94de0c063bf1c7b9172e8e
    
      
    ) dbt_internal_test