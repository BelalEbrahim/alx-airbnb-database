-- Task 4: Initial Complex Query with performance analysis
-- 1. Analyze initial query
EXPLAIN ANALYZE
SELECT b.booking_id,
       u.user_id,
       u.name,
       p.property_id,
       p.location,
       pay.payment_id,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON pay.booking_id = b.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31';

-- 2. Refactored Query: select only necessary columns and optimize joins
EXPLAIN ANALYZE
SELECT b.booking_id,
       u.name AS user_name,
       p.location AS property_location,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON pay.booking_id = b.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31';
