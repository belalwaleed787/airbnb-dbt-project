
  
    

create or replace transient table airbnb.DEV.src_listings
    
    
    
    as (



WITH raw_listings AS (
    SELECT
        *
    FROM
        airbnb.raw.raw_listings
)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings
    )
;


  