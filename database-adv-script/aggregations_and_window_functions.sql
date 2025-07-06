-- Task 2: Aggregations & Window Functions
-- 1. Total bookings per user
SELECT u.user_id,
       u.name,
       COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;

-- 2. Rank properties by bookings (using ROW_NUMBER)
SELECT
  property_id,
  location,
  bookings_count,
  ROW_NUMBER() OVER (ORDER BY bookings_count DESC) AS row_num,
  RANK() OVER (ORDER BY bookings_count DESC) AS rank
FROM (
  SELECT p.property_id,
         p.location,
         COUNT(b.booking_id) AS bookings_count
  FROM properties p
  LEFT JOIN bookings b ON p.property_id = b.property_id
  GROUP BY p.property_id, p.location
) sub
ORDER BY bookings_count DESC;
