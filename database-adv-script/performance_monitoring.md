# Performance Monitoring & Refinement

## Monitoring Queries
Use:
```sql
EXPLAIN ANALYZE SELECT ...;
SHOW PROFILE;
````

*Document sample outputs.*

## Identified Bottlenecks

* Long-running joins on large tables.

## Schema Adjustments

* Added composite index on (user\_id, start\_date).

## Post-Adjustment Performance

Include new EXPLAIN ANALYZE results showing improvements.

