-- Insert sample users
INSERT INTO users (username, email, password, role) VALUES
('john_doe', 'john@example.com', 'hashed_password1', 'host'),
('jane_smith', 'jane@example.com', 'hashed_password2', 'guest'),
('alice', 'alice@example.com', 'hashed_password3', 'guest'),
('bob', 'bob@example.com', 'hashed_password4', 'host');

-- Insert sample properties
INSERT INTO properties (owner_id, title, description, location, price) VALUES
(1, 'Cozy Apartment', 'A nice apartment in the city center', 'New York, NY', 100.00),
(1, 'Beach House', 'Beautiful house by the beach', 'Miami, FL', 200.00),
(4, 'Mountain Cabin', 'Secluded cabin in the mountains', 'Denver, CO', 150.00);

-- Insert sample bookings
INSERT INTO bookings (property_id, user_id, check_in_date, check_out_date) VALUES
(1, 2, '2023-06-01', '2023-06-05'),
(2, 3, '2023-07-01', '2023-07-10');

-- Insert sample reviews
INSERT INTO reviews (property_id, user_id, rating, comment) VALUES
(1, 2, 5, 'Great place, very cozy!'),
(2, 3, 4, 'Lovely house, but a bit pricey.');

-- Insert sample payments
INSERT INTO payments (booking_id, amount, payment_date) VALUES
(1, 400.00, '2023-05-25 10:00:00'), -- 4 nights * $100
(2, 1800.00, '2023-06-15 14:30:00'); -- 9 nights * $200