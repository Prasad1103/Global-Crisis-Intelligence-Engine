-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 05_inflation_analysis.sql
-- DATASET : Inflation
-- ==========================================================

-- ==========================================================
-- 1. View all records
-- ==========================================================

SELECT *
FROM inflation;

-- ==========================================================
-- 2. Total records
-- ==========================================================

SELECT COUNT(*) AS total_records
FROM inflation;

-- ==========================================================
-- 3. Total countries
-- ==========================================================

SELECT COUNT(DISTINCT country_code) AS total_countries
FROM inflation;

-- ==========================================================
-- 4. Available year range
-- ==========================================================

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM inflation;

-- ==========================================================
-- 5. Average inflation rate
-- ==========================================================

SELECT
    ROUND(AVG(inflation_rate),2) AS average_inflation
FROM inflation;

-- ==========================================================
-- 6. Highest inflation ever recorded
-- ==========================================================

SELECT
    country_name,
    year,
    inflation_rate
FROM inflation
ORDER BY inflation_rate DESC
LIMIT 10;

-- ==========================================================
-- 7. Lowest inflation (including deflation)
-- ==========================================================

SELECT
    country_name,
    year,
    inflation_rate
FROM inflation
ORDER BY inflation_rate ASC
LIMIT 10;

-- ==========================================================
-- 8. Countries with inflation above 20%
-- ==========================================================

SELECT
    country_name,
    year,
    inflation_rate
FROM inflation
WHERE inflation_rate > 20
ORDER BY inflation_rate DESC;

-- ==========================================================
-- 9. Countries experiencing deflation
-- ==========================================================

SELECT
    country_name,
    year,
    inflation_rate
FROM inflation
WHERE inflation_rate < 0
ORDER BY inflation_rate;

-- ==========================================================
-- 10. Average inflation by year
-- ==========================================================

SELECT
    year,
    ROUND(AVG(inflation_rate),2) AS avg_inflation
FROM inflation
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 11. Maximum inflation for each country
-- ==========================================================

SELECT
    country_name,
    MAX(inflation_rate) AS highest_inflation
FROM inflation
GROUP BY country_name
ORDER BY highest_inflation DESC;

-- ==========================================================
-- 12. Minimum inflation for each country
-- ==========================================================

SELECT
    country_name,
    MIN(inflation_rate) AS lowest_inflation
FROM inflation
GROUP BY country_name
ORDER BY lowest_inflation;

-- ==========================================================
-- 13. Latest year's inflation data
-- ==========================================================

SELECT
    country_name,
    inflation_rate
FROM inflation
WHERE year = (
    SELECT MAX(year)
    FROM inflation
)
ORDER BY inflation_rate DESC;

-- ==========================================================
-- 14. Top 20 countries with highest inflation
-- ==========================================================

SELECT
    country_name,
    inflation_rate
FROM inflation
ORDER BY inflation_rate DESC
LIMIT 20;

-- ==========================================================
-- 15. Top 20 countries with lowest inflation
-- ==========================================================

SELECT
    country_name,
    inflation_rate
FROM inflation
ORDER BY inflation_rate ASC
LIMIT 20;

-- ==========================================================
-- 16. Number of records by year
-- ==========================================================

SELECT
    year,
    COUNT(*) AS records
FROM inflation
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 17. Countries with above-average inflation
-- ==========================================================

SELECT
    country_name,
    year,
    inflation_rate
FROM inflation
WHERE inflation_rate >
(
    SELECT AVG(inflation_rate)
    FROM inflation
)
ORDER BY inflation_rate DESC;

-- ==========================================================
-- 18. Countries with below-average inflation
-- ==========================================================

SELECT
    country_name,
    year,
    inflation_rate
FROM inflation
WHERE inflation_rate <
(
    SELECT AVG(inflation_rate)
    FROM inflation
)
ORDER BY inflation_rate;

-- ==========================================================
-- 19. Average inflation by country
-- ==========================================================

SELECT
    country_name,
    ROUND(AVG(inflation_rate),2) AS average_inflation
FROM inflation
GROUP BY country_name
ORDER BY average_inflation DESC;

-- ==========================================================
-- 20. Top 10 countries with the highest average inflation
-- ==========================================================

SELECT
    country_name,
    ROUND(AVG(inflation_rate),2) AS average_inflation
FROM inflation
GROUP BY country_name
ORDER BY average_inflation DESC
LIMIT 10;