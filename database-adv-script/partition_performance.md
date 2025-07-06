# Partition Performance Analysis

## Before Partitioning
Run:
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date >= '2025-01-01' AND start_date < '2025-06-01';
````

*Include execution time and plan.*

## After Partitioning

Run:

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned WHERE start_date >= '2025-01-01' AND start_date < '2025-06-01';
```

*Include execution time and plan improvements.*

