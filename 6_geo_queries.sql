-- View all GPS records
SELECT *
FROM location_pings;

-- GPS history of the first ambulance
SELECT *
FROM location_pings
WHERE ambulance_id = (
    SELECT ambulance_id
    FROM ambulances
    ORDER BY created_at
    LIMIT 1 OFFSET 0)
ORDER BY recorded_at ASC;

-- Latest GPS location of the first ambulance
SELECT *
FROM location_pings
WHERE ambulance_id = (
    SELECT ambulance_id
    FROM ambulances
    ORDER BY created_at
    LIMIT 1 OFFSET 0)
ORDER BY recorded_at DESC
LIMIT 1;

-- GPS records between two timestamps
SELECT *
FROM location_pings
WHERE recorded_at BETWEEN '2026-07-07 18:20:00'
AND '2026-07-07 18:40:00'
ORDER BY recorded_at;

-- Find Nearest Ambulance
SELECT
    ambulance_id,
    ST_Distance(
        location,
        ST_SetSRID(
            ST_MakePoint(75.790000, 26.914000),
            4326
        )::GEOGRAPHY
    ) AS distance_in_meters
FROM location_pings
ORDER BY distance_in_meters
LIMIT 5;

-- Find Ambulances Within 5 km
SELECT
    ambulance_id,
    latitude,
    longitude
FROM location_pings
WHERE ST_DWithin(
    location,
    ST_SetSRID(
        ST_MakePoint(75.787300, 26.912400),
        4326
    )::GEOGRAPHY,
    5000
);

-- Distance Between Ambulance and Patient
SELECT
    lp.ambulance_id,ST_Distance(
    lp.location,ST_SetSRID(
    ST_MakePoint(
    er.pickup_longitude,er.pickup_latitude
    ),4326)::GEOGRAPHY
    ) AS distance_in_meters
FROM location_pings lp
JOIN emergency_requests er
ON lp.ambulance_id = er.ambulance_id;

-- Distance Between Ambulance and Hospital
SELECT
    lp.ambulance_id,
    h.hospital_name,
    ST_Distance(
    lp.location,h.location
    ) AS distance_in_meters
FROM location_pings lp
JOIN hospitals h
ON TRUE
ORDER BY distance_in_meters
LIMIT 1;