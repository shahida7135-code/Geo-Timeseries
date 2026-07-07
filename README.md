# AI Ambulance Dispatch System – DB2 (Geo + Time Series)

## Overview

The **Geo + Time Series (DB2)** module is a part of the **AI Ambulance Dispatch System**. It uses **PostgreSQL**, **PostGIS**, and **TimescaleDB** to store real-time ambulance GPS locations, perform geographic queries, and generate analytics based on location and time-series data.

---

## Technologies Used

- PostgreSQL 17
- PostGIS
- TimescaleDB
- SQL

---

## Features

- Stores real-time ambulance GPS locations
- Uses PostGIS for geographic operations
- Uses TimescaleDB for time-series data management
- Supports nearest ambulance search
- Calculates ambulance-to-patient distance
- Calculates ambulance-to-hospital distance
- Stores GPS history
- Generates ambulance movement analytics

---

## Project Structure

```
Geo+Timeseries/
│── 1_create table
│── 2_enable_extensions.sql
│── 3_create_hypertable.sql
│── 4_create_indexes.sql
│── 5_sample_data.sql
│── 6_geo_queries.sql
│── 7_analytics_queries.sql
│── README.md
```

---

## Setup Instructions

### Step 1: Enable Extensions

Run:

```sql
2_enable_extensions.sql
```

This enables:

- PostGIS
- TimescaleDB

---

### Step 2: Create Table

Run:

```sql
1_create table
```

Creates the `location_pings` table.

---

### Step 3: Convert to Hypertable

Run:

```sql
3_create_hypertable.sql
```

Converts `location_pings` into a TimescaleDB hypertable.

---

### Step 4: Create Indexes

Run:

```sql
4_create_indexes.sql
```

Creates indexes to improve query performance.

---

### Step 5: Insert Sample Data

Run:

```sql
5_sample_data.sql
```

Sample GPS records are inserted using **dynamic ambulance IDs** retrieved from the `ambulances` table. This ensures compatibility across different databases without relying on hardcoded UUIDs.

---

### Step 6: Execute Geo Queries

Run:

```sql
6_geo_queries.sql
```

---

### Step 7: Execute Analytics Queries

Run:

```sql
7_analytics_queries.sql
```

---

## Database Table

### location_pings

Stores GPS updates received from ambulances.

| Column | Description |
|---------|-------------|
| ping_id | Unique GPS record ID |
| ambulance_id | References the `ambulances` table |
| latitude | Latitude coordinate |
| longitude | Longitude coordinate |
| location | PostGIS Geography Point |
| speed_kmh | Ambulance speed (km/h) |
| heading | Direction of movement (degrees) |
| recorded_at | GPS update timestamp |

---

## Geo Queries

The following geographic queries are implemented:

- View all GPS records
- View GPS history of an ambulance
- View the latest GPS location
- View GPS records between timestamps
- Find the nearest ambulance
- Find ambulances within a 5 km radius
- Calculate distance between ambulance and patient
- Calculate distance between ambulance and hospital

---

## Analytics Queries

The following analytics are implemented:

- Average Response Time
- Daily Travelled Distance per Ambulance
- Trips Completed per Ambulance
- Request Status Summary
- Heatmap Analysis
- Ambulance Coverage Analysis
- Offline Duration
- Peak Traffic Hour Analysis

---

## Prerequisites

Before running DB2, ensure that:

- PostgreSQL 17 is installed.
- PostGIS extension is available.
- TimescaleDB extension is installed.
- DB1 has already been executed successfully.
- The `ambulances`, `emergency_requests`, and `hospitals` tables exist.

---

## Notes

- DB2 depends on the DB1 schema.
- `ambulance_id` is a foreign key referencing the `ambulances` table.
- Sample data uses **dynamic ambulance ID selection**, making it portable across different environments.
- Some analytics, such as **Average Response Time**, depend on timestamp data available in DB1.
- **Daily Travelled Distance** requires multiple GPS records for the same ambulance to produce non-null results.

---

## Author

**Shahida Bhanu**

B.Tech – Computer Science and Engineering(Cyber Security)