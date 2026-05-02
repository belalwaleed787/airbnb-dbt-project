with __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT
        *
    FROM
        AIRBNB.raw.raw_reviews
)
SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews
)
--EPHEMERAL-SELECT-WRAPPER-START
select * from (

WITH src_reviews AS (
  SELECT * FROM __dbt__cte__src_reviews
)
SELECT * FROM src_reviews
WHERE review_text is not null


  AND review_date > (select max(review_date) from AIRBNB.DEV.fct_reviews)

--EPHEMERAL-SELECT-WRAPPER-END
)