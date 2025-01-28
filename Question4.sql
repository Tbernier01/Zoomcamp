WITH LongestTrips AS (
    SELECT
        CAST(lpep_pickup_datetime AS DATE) AS PickupDate,
        MAX(CAST(trip_distance AS FLOAT)) AS LongestTripDistance
    FROM
        [dbo].[green_tripdata_2019-10]
    WHERE
        lpep_pickup_datetime >= '2019-10-01'
        AND lpep_pickup_datetime < '2019-11-01'
    GROUP BY
        CAST(lpep_pickup_datetime AS DATE)
)
SELECT
    PickupDate,
    LongestTripDistance
FROM
    LongestTrips
ORDER BY
    PickupDate;