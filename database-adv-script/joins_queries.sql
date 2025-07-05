-- 1. INNER JOIN: All bookings with their users
SELECT b.booking_id,
       u.user_id,
       u.name,
       b.start_date,
       b.end_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- 2. LEFT JOIN: All properties with their reviews (including none)
SELECT p.property_id,
       p.location,
       r.review_id,
       r.rating
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN: All users and all bookings
-- (Note: MySQL does not support FULL OUTER JOIN; use UNION workaround)
SELECT u.user_id, u.name, b.booking_id
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
UNION
SELECT u.user_id, u.name, b.booking_id
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id;
