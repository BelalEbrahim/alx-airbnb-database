-- Task 5: Partition bookings by start_date (PostgreSQL example)
-- 1. Create partitioned table
CREATE TABLE bookings_partitioned (
  booking_id   SERIAL PRIMARY KEY,
  user_id      INT NOT NULL,
  property_id  INT NOT NULL,
  start_date   DATE NOT NULL,
  end_date     DATE NOT NULL
) PARTITION BY RANGE (start_date);

-- 2. Create partitions (e.g., by year)
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 3. Insert data from original bookings
INSERT INTO bookings_partitioned (booking_id, user_id, property_id, start_date, end_date)
SELECT booking_id, user_id, property_id, start_date, end_date
FROM bookings;
