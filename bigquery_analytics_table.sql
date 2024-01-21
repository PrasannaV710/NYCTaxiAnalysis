CREATE OR REPLACE TABLE `nyc-taxi-data-411821.nyc_taxi_data.analytics` AS(
  SELECT
  f.trip_id,
  f.VendorID,
  d.tpep_pickup_datetime,
  d.tpep_dropoff_datetime,
  p.passenger_count,
  t.trip_distance,
  r.rate_code_name,
  pick.pickup_latitude,
  pick.pickup_longitude,
  drop.dropoff_latitude,
  drop.dropoff_longitude,
  pay.payment_type_name,
  f.fare_amount,
  f.extra,
  f.mta_tax,
  f.tip_amount,
  f.tolls_amount,
  f.improvement_surcharge,
  f.total_amount

  FROM
  `nyc-taxi-data-411821.nyc_taxi_data.fact_table` f
  JOIN `nyc-taxi-data-411821.nyc_taxi_data.datetime_dim` d on d.datetime_id=f.datetime_id
  JOIN `nyc-taxi-data-411821.nyc_taxi_data.passenger_count_dim` p on p.passenger_count_id=f.passenger_count_id
  JOIN `nyc-taxi-data-411821.nyc_taxi_data.trip_distance_dim` t on t.trip_distance_id=f.trip_distance_id
  JOIN `nyc-taxi-data-411821.nyc_taxi_data.rate_code_dim` r on r.rate_code_id=f.rate_code_id
  JOIN `nyc-taxi-data-411821.nyc_taxi_data.pickup_location_dim` pick on pick.pickup_location_id=f.pickup_location_id
  JOIN `nyc-taxi-data-411821.nyc_taxi_data.dropoff_location_dim` drop on drop.dropoff_location_id=f.dropoff_location_id
  JOIN `nyc-taxi-data-411821.nyc_taxi_data.payment_type_dim` pay on pay.payment_type_id=f.payment_type_id
);