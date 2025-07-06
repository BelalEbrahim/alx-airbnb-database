-- Task 3: Measure performance before and after adding indexes
-- 1. Before indexing
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123;

-- 2. Create Indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- 3. After indexing
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123;
