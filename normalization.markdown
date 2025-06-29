# Database Normalization

The database design for the Airbnb clone project is in the **third normal form (3NF)**. Below is the analysis:

## Normalization Principles
- **1NF**: No repeating groups; each cell has a single value.
- **2NF**: 1NF + no partial dependencies (non-key attributes depend on the entire primary key).
- **3NF**: 2NF + no transitive dependencies (non-key attributes depend only on the primary key).

## Table Analysis

- **Users**: 
  - Primary Key: `id`
  - Attributes: `username`, `email`, `password`, `role`
  - All attributes depend directly on `id`. No transitive dependencies (e.g., `role` doesn’t depend on `email`).

- **Properties**: 
  - Primary Key: `id`
  - Attributes: `owner_id` (FK), `title`, `description`, `location`, `price`
  - All attributes depend on `id`. `location` and `price` are independent of each other.

- **Bookings**: 
  - Primary Key: `id`
  - Attributes: `property_id` (FK), `user_id` (FK), `check_in_date`, `check_out_date`
  - All attributes depend on `id`. Dates are specific to each booking.

- **Reviews**: 
  - Primary Key: `id`
  - Attributes: `property_id` (FK), `user_id` (FK), `rating`, `comment`
  - All attributes depend on `id`. No dependencies between `rating` and `comment`.

- **Payments**: 
  - Primary Key: `id`
  - Attributes: `booking_id` (FK), `amount`, `payment_date`
  - All attributes depend on `id`. `amount` and `payment_date` are specific to each payment.

## Conclusion
- No redundancies or normalization violations were found.
- The design is in 3NF as-is, requiring no adjustments.