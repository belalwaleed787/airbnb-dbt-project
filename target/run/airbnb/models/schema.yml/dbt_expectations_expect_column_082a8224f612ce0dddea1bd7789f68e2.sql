
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.DEV__test_failures.dbt_expectations_expect_column_082a8224f612ce0dddea1bd7789f68e2
    
      
    ) dbt_internal_test