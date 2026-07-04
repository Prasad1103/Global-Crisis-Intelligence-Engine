-- ==========================================================
-- QUERY PERFORMANCE ANALYSIS
-- ==========================================================

-- 1. Check execution plan
EXPLAIN
SELECT *
FROM peace_index
WHERE country_code = 'IND';

------------------------------------------------------------

-- 2. Actual execution time
EXPLAIN ANALYZE
SELECT *
FROM peace_index
WHERE country_code = 'IND';

------------------------------------------------------------

-- 3. Join performance
EXPLAIN ANALYZE

SELECT
    p.country_name,
    p.peace_score,
    i.inflation_rate

FROM peace_index p

JOIN inflation i
ON p.country_code = i.country_code
AND p.year = i.year;

------------------------------------------------------------

-- 4. Aggregation performance
EXPLAIN ANALYZE

SELECT
    country_name,
    AVG(inflation_rate)

FROM inflation

GROUP BY country_name;

------------------------------------------------------------

-- 5. Window function performance
EXPLAIN ANALYZE

SELECT
    country_name,
    year,
    inflation_rate,

    RANK()
    OVER(
        PARTITION BY country_name
        ORDER BY inflation_rate DESC
    )

FROM inflation;