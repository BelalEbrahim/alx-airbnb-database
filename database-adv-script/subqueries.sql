-- Task 1: Subqueries
-- 1. Non‑correlated: Properties with avg rating > 4.0
SELECT property_id,
       location
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- 2. Correlated: Users with more than 3 bookings
SELECT user_id,
       name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
