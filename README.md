# AI Ambulance Dispatch System – DB2 (Geo + Time Series)

## Overview

The **Geo + Time Series (DB2)** module is a part of the **AI Ambulance Dispatch System**. It is built using **PostgreSQL**, **PostGIS**, and **TimescaleDB** to store real-time GPS locations of ambulances, perform geographic queries, and generate analytics based on location and time-series data.

---

## Technologies Used

- PostgreSQL 17
- PostGIS
- TimescaleDB
- SQL

---

## Features

- Stores live ambulance GPS locations
- Converts GPS data into a TimescaleDB hypertable
- Performs geographic queries using PostGIS
- Finds the nearest ambulance to a patient
- Calculates ambulance-to-patient distance
- Calculates ambulance-to-hospital distance
- Supports GPS history and tracking
- Generates analytical reports on ambulance movement

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

### Step 1

Enable the required extensions.

Run:

```sql
2_enable_extensions.sql
```

---

### Step 2

Create the `location_pings` table.

Run:

```sql
1_create table
```

---

### Step 3

Convert the table into a TimescaleDB hypertable.

Run:

```sql
3_create_hypertable.sql
```

---

### Step 4

Create indexes for faster query execution.

Run:

```sql
4_create_indexes.sql
```

---

### Step 5

Insert sample GPS data.

Run:

```sql
5_sample_data.sql
```

---

### Step 6

Execute geographic queries.

Run:

```sql
6_geo_queries.sql
```

---

### Step 7

Execute analytics queries.

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
| ambulance_id | References the Ambulances table |
| latitude | Ambulance latitude |
| longitude | Ambulance longitude |
| location | PostGIS Geography Point |
| speed_kmh | Current ambulance speed |
| heading | Direction of movement |
| recorded_at | Timestamp of GPS update |

---

## Geo Queries

This module includes the following geographic queries:

- View all GPS records
- View GPS history of an ambulance
- View the latest GPS location
- View GPS records between timestamps
- Find the nearest ambulance
- Find ambulances within a specified radius
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

Before running this module, ensure that:

- PostgreSQL 17 is installed.
- PostGIS extension is enabled.
- TimescaleDB extension is enabled.
- The **DB1** module has already been created.
- The `ambulances`, `emergency_requests`, and `hospitals` tables from DB1 are available.

---

## Notes

- This module depends on the **DB1** database schema.
- `ambulance_id` is a foreign key referencing the `ambulances` table.
- Some analytics require sufficient sample data.
- Queries such as **Average Response Time** and **Daily Travelled Distance** may return `NULL` if the required timestamp or GPS history data is unavailable.

---

## Author

**Shahida Bhanu**

B.Tech – Computer Science and Engineering(Cyber Security)