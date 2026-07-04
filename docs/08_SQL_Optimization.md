# SQL Optimization

## Project

**Global Crisis Intelligence Engine**

---

# Overview

The Global Crisis Intelligence Engine is designed not only to perform analytical SQL queries but also to execute them efficiently.

As the volume of data grows, poorly optimized queries can lead to longer execution times and unnecessary resource consumption. This project applies PostgreSQL optimization techniques to improve query performance and demonstrate best practices for analytical databases.

---

# Objectives

The SQL optimization phase focused on:

- Improving query execution speed
- Reducing full table scans
- Optimizing JOIN operations
- Supporting analytical workloads
- Demonstrating PostgreSQL performance tuning techniques

---

# Optimization Techniques Used

The project applies several optimization techniques available in PostgreSQL.

## 1. Indexing

Indexes were created on columns that are frequently used in:

- JOIN conditions
- WHERE filters
- GROUP BY clauses
- ORDER BY clauses

Example:

```sql
CREATE INDEX idx_peace_country_year
ON peace_index(country_code, year);
```

Benefits:

- Faster record lookup
- Improved join performance
- Reduced sequential scans

---

## 2. Composite Indexes

Composite indexes were created for columns that are commonly queried together.

Example:

```sql
CREATE INDEX idx_inflation_country_year
ON inflation(country_code, year);
```

This allows PostgreSQL to efficiently process queries that filter by both country and year.

---

## 3. Query Optimization

Queries were written to:

- Filter data early using WHERE clauses
- Aggregate only required columns
- Avoid unnecessary SELECT *
- Minimize expensive operations

Example:

```sql
SELECT
    country_name,
    AVG(inflation_rate)
FROM inflation
GROUP BY country_name;
```

---

## 4. SQL Views

Reusable SQL views were created for frequently used analytical queries.

Example:

```sql
CREATE VIEW vw_global_crisis_overview AS
SELECT ...
```

Advantages:

- Cleaner SQL
- Code reusability
- Simplified reporting

---

## 5. User-Defined Functions

Reusable PostgreSQL functions were implemented to encapsulate business logic.

Example:

```sql
SELECT fn_avg_peace_score('IND');
```

Benefits:

- Reduced code duplication
- Easier maintenance
- Reusable analytical logic

---

## 6. Common Table Expressions (CTEs)

CTEs were used to simplify complex analytical queries.

Example:

```sql
WITH peace_summary AS
(
    SELECT
        country_name,
        AVG(peace_score) AS avg_peace
    FROM peace_index
    GROUP BY country_name
)

SELECT *
FROM peace_summary;
```

Benefits:

- Improved readability
- Better query organization
- Easier debugging

---

## 7. Window Functions

Window functions were used for advanced analytical calculations without collapsing the result set.

Example:

```sql
SELECT
    country_name,
    year,
    RANK() OVER (ORDER BY peace_score) AS rank_no
FROM peace_index;
```

Use Cases:

- Ranking
- Running averages
- Trend analysis

---

# Performance Analysis

The project uses PostgreSQL's execution planner to evaluate query performance.

Example:

```sql
EXPLAIN ANALYZE

SELECT *
FROM peace_index
WHERE country_code = 'IND';
```

`EXPLAIN ANALYZE` provides information about:

- Query execution plan
- Cost estimates
- Execution time
- Scan methods
- Join strategies

---

# Index Summary

| Table | Indexes Created |
|--------|-----------------|
| peace_index | country_code, year, country_code + year |
| inflation | country_code, year, country_code + year |
| disasters | country_code, start_year, disaster_type |
| food_prices | country_name, year, commodity_name |
| world_indicators | country_code, year, indicator_code |

---

# SQL Features Used

| Feature | Purpose |
|----------|---------|
| Indexes | Faster filtering and joins |
| Composite Indexes | Multi-column search optimization |
| Views | Reusable analytical queries |
| Functions | Reusable business logic |
| CTEs | Query readability |
| Window Functions | Advanced analytics |
| EXPLAIN ANALYZE | Performance measurement |

---

# Best Practices Followed

The project follows several SQL optimization best practices:

- Created indexes on frequently queried columns
- Used descriptive aliases
- Avoided unnecessary nested queries
- Used CTEs to simplify complex logic
- Reused SQL through views and functions
- Validated execution plans using `EXPLAIN ANALYZE`

---

# Expected Benefits

The optimization techniques improve:

- Query execution speed
- Scalability
- Readability
- Maintainability
- Reusability
- Analytical performance

---

# Conclusion

SQL optimization is an essential part of analytical database development.

By applying indexing, reusable SQL objects, CTEs, window functions, and performance analysis techniques, the Global Crisis Intelligence Engine demonstrates efficient PostgreSQL query design suitable for real-world analytical workloads.