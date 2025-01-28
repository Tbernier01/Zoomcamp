SELECT TOP 1
    tzl_drop.Zone AS DropOffZone,
    SUM(CAST(gt.tip_amount AS FLOAT)) AS TotalTipAmount
FROM
    [dbo].[green_tripdata_2019-10] gt
INNER JOIN
    [dbo].[taxi_zone_lookup] tzl_pickup
    ON gt.PULocationID = tzl_pickup.LocationID
INNER JOIN
    [dbo].[taxi_zone_lookup] tzl_drop
    ON gt.DOLocationID = tzl_drop.LocationID
WHERE
    tzl_pickup.Zone = 'East Harlem North'
    AND gt.lpep_pickup_datetime >= '2019-10-01'
    AND gt.lpep_pickup_datetime < '2019-11-01'
GROUP BY
    tzl_drop.Zone
ORDER BY
    TotalTipAmount DESC;