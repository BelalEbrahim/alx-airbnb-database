# ER Diagram – Airbnb Schema

**Entities and Relationships**:
- **users** (user_id PK, name, email, ...)
- **properties** (property_id PK, owner_id FK→users, location, ...)
- **bookings** (booking_id PK, user_id FK→users, property_id FK→properties, start_date, end_date, ...)
- **reviews** (review_id PK, property_id FK→properties, user_id FK→users, rating, comment)
- **payments** (payment_id PK, booking_id FK→bookings, amount, payment_date)

