-- Index for searching GPS records by ambulance
CREATE INDEX idx_location_pings_ambulance
ON location_pings(ambulance_id);

-- Index for searching GPS records by timestamp
CREATE INDEX idx_location_pings_recorded_at
ON location_pings(recorded_at);

-- Composite index for ambulance GPS history
CREATE INDEX idx_location_pings_ambulance_time
ON location_pings(ambulance_id, recorded_at);

-- Spatial index for PostGIS location searches
CREATE INDEX idx_location_pings_location
ON location_pings
USING GIST(location);