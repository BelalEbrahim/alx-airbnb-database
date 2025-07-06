# Query Optimization Report

## Initial EXPLAIN Analysis
Include the EXPLAIN output for the initial query.

## Identified Inefficiencies
- Unnecessary column selections.
- Full table scans on bookings.

## Refactoring Steps
1. Selected only required columns.
2. Ensured joins use indexed columns.

## Final EXPLAIN Analysis
Include the EXPLAIN output for the refactored query, showing reduced cost.
