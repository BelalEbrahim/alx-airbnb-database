# Entity-Relationship Diagram Requirements

## Entities and Attributes

- **Users**
  - `id` (Primary Key, Integer)
  - `username` (Varchar, Unique)
  - `email` (Varchar, Unique)
  - `password` (Varchar)
  - `role` (Varchar, e.g., 'host', 'guest')

- **Properties**
  - `id` (Primary Key, Integer)
  - `owner_id` (Foreign Key to Users.id, Integer)
  - `title` (Varchar)
  - `description` (Text)
  - `location` (Varchar)
  - `price` (Decimal)

- **Bookings**
  - `id` (Primary Key, Integer)
  - `property_id` (Foreign Key to Properties.id, Integer)
  - `user_id` (Foreign Key to Users.id, Integer)
  - `check_in_date` (Date)
  - `check_out_date` (Date)

- **Reviews**
  - `id` (Primary Key, Integer)
  - `property_id` (Foreign Key to Properties.id, Integer)
  - `user_id` (Foreign Key to Users.id, Integer)
  - `rating` (Integer, 1-5)
  - `comment` (Text)

- **Payments**
  - `id` (Primary Key, Integer)
  - `booking_id` (Foreign Key to Bookings.id, Integer)
  - `amount` (Decimal)
  - `payment_date` (Timestamp)

## Relationships

- **Users to Properties**
  - Cardinality: One-to-Many (1 to 0..*)
  - Description: A User (owner) can own multiple Properties. A Property belongs to one User.
  - Implemented via: `owner_id` in Properties references `Users.id`.

- **Users to Bookings**
  - Cardinality: One-to-Many (1 to 0..*)
  - Description: A User can make multiple Bookings. A Booking is made by one User.
  - Implemented via: `user_id` in Bookings references `Users.id`.

- **Properties to Bookings**
  - Cardinality: One-to-Many (1 to 0..*)
  - Description: A Property can have multiple Bookings. A Booking pertains to one Property.
  - Implemented via: `property_id` in Bookings references `Properties.id`.

- **Properties to Reviews**
  - Cardinality: One-to-Many (1 to 0..*)
  - Description: A Property can have multiple Reviews. A Review pertains to one Property.
  - Implemented via: `property_id` in Reviews references `Properties.id`.

- **Users to Reviews**
  - Cardinality: One-to-Many (1 to 0..*)
  - Description: A User can leave multiple Reviews. A Review is left by one User.
  - Implemented via: `user_id` in Reviews references `Users.id`.

- **Bookings to Payments**
  - Cardinality: One-to-Many (1 to 0..*)
  - Description: A Booking can have multiple Payments (e.g., deposit, final payment). A Payment belongs to one Booking.
  - Implemented via: `booking_id` in Payments references `Bookings.id`.

## Notes
- The ER diagram should be drawn with rectangles for entities, listing attributes inside, and lines connecting entities with cardinality notations (1, 0..*, etc.) to represent relationships.
- Save the visual diagram as `erd.png` in the `ERD/` directory using a tool like Draw.io.
