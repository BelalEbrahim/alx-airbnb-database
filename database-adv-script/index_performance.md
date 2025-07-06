# Index Performance Analysis

## Before Indexing
Run:
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
````

*Include execution time and plan here.*

## After Indexing

Run:

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
```

*Include improved execution time and plan here.*

