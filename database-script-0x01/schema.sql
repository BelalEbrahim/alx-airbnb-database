-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Create Properties table
CREATE TABLE properties (
    id SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

-- Create Bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    FOREIGN KEY (property_id) REFERENCES properties(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Add date constraint
ALTER TABLE bookings ADD CONSTRAINT check_dates CHECK (check_out_date > check_in_date);

-- Create Reviews table
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    FOREIGN KEY (property_id) REFERENCES properties(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create Payments table
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

-- Add amount constraint
ALTER TABLE payments ADD CONSTRAINT check_amount CHECK (amount > 0);

-- Create indexes for performance
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_properties_owner_id ON properties(owner_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);