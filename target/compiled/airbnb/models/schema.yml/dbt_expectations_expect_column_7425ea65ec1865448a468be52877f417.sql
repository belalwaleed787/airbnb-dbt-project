




    with grouped_expression as (
    select
        
        
    
  
( 1=1 and min(price) >= 2555 and min(price) <= 5000
)
 as expression


    from AIRBNB.DEV.dim_listings_w_hosts
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors






