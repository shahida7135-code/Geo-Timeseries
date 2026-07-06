-- ==========================================================
-- Project : AI Ambulance Dispatch System
-- File    : 01_create_location_pings.sql
-- Module  : DB2 (Geo + Time Series)
-- Purpose : Stores every GPS update received from ambulances
-- ==========================================================

CREATE TABLE location_pings (
    ping_id UUID DEFAULT gen_random_uuid(),
    ambulance_id UUID NOT NULL,
    latitude NUMERIC(10,8) NOT NULL
        CHECK (latitude BETWEEN -90 AND 90),
    longitude NUMERIC(11,8) NOT NULL
        CHECK (longitude BETWEEN -180 AND 180),
    location GEOGRAPHY(POINT,4326) NOT NULL,
    speed_kmh NUMERIC(5,2)
        CHECK (speed_kmh >= 0),
    heading NUMERIC(5,2)
        CHECK (heading BETWEEN 0 AND 360),
    recorded_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_location_pings
        PRIMARY KEY (ping_id, recorded_at),
    CONSTRAINT fk_location_ambulance
        FOREIGN KEY (ambulance_id)
        REFERENCES ambulances(ambulance_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);