SELECT create_hypertable(
    'location_pings',
    'recorded_at',
    if_not_exists => TRUE
);