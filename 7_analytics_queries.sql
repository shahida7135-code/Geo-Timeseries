-- Average Response Time
SELECT ROUND(
AVG(EXTRACT(EPOCH FROM (arrived_at_patient - accepted_at)) / 60),
2) AS average_response_time_minutes
FROM emergency_requests
WHERE arrived_at_patient IS NOT NULL
AND accepted_at IS NOT NULL;

-- Daily Travelled Distance per Ambulance
SELECT
    ambulance_id,
    DATE(recorded_at) AS travel_date,
    ROUND(
    (SUM(distance) / 1000)::NUMERIC,2) 
    AS distance_km FROM (
    SELECT ambulance_id,
    recorded_at,ST_Distance(
    location,LEAD(location) OVER (
    PARTITION BY ambulance_id ORDER BY recorded_at)
        ) AS distance
    FROM location_pings
) t
GROUP BY ambulance_id, DATE(recorded_at)
ORDER BY ambulance_id, travel_date;


-- Trips Completed per Ambulance
SELECT
    ambulance_id,
    COUNT(*) AS completed_trips
FROM emergency_requests
WHERE request_status = 'COMPLETED'
GROUP BY ambulance_id;

-- Heatmap Query
SELECT
    latitude,
    longitude,
    COUNT(*) AS total_pings
FROM location_pings
GROUP BY latitude, longitude
ORDER BY total_pings DESC;

-- Coverage Query
SELECT
    ambulance_id,
    COUNT(*) AS total_locations
FROM location_pings
GROUP BY ambulance_id
ORDER BY total_locations DESC;

-- Offline Duration
SELECT
    ambulance_id,
    driver_name,
    CURRENT_TIMESTAMP - last_ping AS offline_duration
FROM ambulances
WHERE ambulance_status = 'OFFLINE';

-- Peak Traffic Hour
SELECT
    EXTRACT(HOUR FROM recorded_at) AS hour_of_day,
    COUNT(*) AS total_pings
FROM location_pings
GROUP BY hour_of_day
ORDER BY total_pings DESC;

--Request Status Summary
SELECT
    request_status,
    COUNT(*) AS total_requests
FROM emergency_requests
GROUP BY request_status
ORDER BY request_status;