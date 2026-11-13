{{ config(materialized='view') }}

-- ==============================================================================
-- STAGING MODEL: stg_taxi_zones
-- Vrstva: Staging (Číselník zón)
-- ==============================================================================

WITH source_data AS (
    SELECT * FROM {{ source('raw', 'nyc_yellow_taxi') }}
)

SELECT
    VendorID,
    tpep_pickup_datetime AS pickup_datetime,
    tpep_dropoff_datetime AS dropoff_datetime,
    passenger_count,
    trip_distance,
    PUlocationID AS pickup_location_id,
    DOlocationID AS dropoff_location_id,
    RatecodeID AS rate_code_id,
    store_and_fwd_flag AS store_and_forward_flag,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    congestion_surcharge,
    airport_fee,
    trip_type
FROM source_data
