SELECT
    SUM(CASE WHEN CAST(trip_distance AS FLOAT) <= 1 THEN 1 ELSE 0 END) AS Trips_Up_To_1_Mile,
    SUM(CASE WHEN CAST(trip_distance AS FLOAT) > 1 AND CAST(trip_distance AS FLOAT) <= 3 THEN 1 ELSE 0 END) AS Trips_1_To_3_Miles,
    SUM(CASE WHEN CAST(trip_distance AS FLOAT) > 3 AND CAST(trip_distance AS FLOAT) <= 7 THEN 1 ELSE 0 END) AS Trips_3_To_7_Miles,
    SUM(CASE WHEN CAST(trip_distance AS FLOAT) > 7 AND CAST(trip_distance AS FLOAT) <= 10 THEN 1 ELSE 0 END) AS Trips_7_To_10_Miles,
    SUM(CASE WHEN CAST(trip_distance AS FLOAT) > 10 THEN 1 ELSE 0 END) AS Trips_Over_10_Miles
FROM
    [dbo].[green_tripdata_2019-10]
WHERE
    lpep_pickup_datetime >= '2019-10-01'
    AND lpep_pickup_datetime < '2019-11-01';