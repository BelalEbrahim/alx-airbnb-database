-- Task 4: Initial Complex Query
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
JOIN payments pay ON pay.booking_id = b.booking_id;

-- Task 4: Refactored Query (example: select only necessary columns and use indexed joins)
SELECT b.booking_id,
       u.name AS user_name,
       p.location AS property_location,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON pay.booking_id = b.booking_id;
