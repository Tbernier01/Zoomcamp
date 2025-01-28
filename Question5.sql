SELECT TOP 3
    tzl.Zone AS PickupZone,
    SUM(CAST(gt.total_amount AS FLOAT)) AS TotalAmount
FROM
    [dbo].[green_tripdata_2019-10] gt
INNER JOIN
    [dbo].[taxi_zone_lookup] tzl
    ON gt.PULocationID = tzl.LocationID
WHERE
    gt.lpep_pickup_datetime >= '2019-10-18'
    AND gt.lpep_pickup_datetime < '2019-10-19'
GROUP BY
    tzl.Zone
HAVING
    SUM(CAST(gt.total_amount AS FLOAT)) > 13000
ORDER BY
    TotalAmount DESC;