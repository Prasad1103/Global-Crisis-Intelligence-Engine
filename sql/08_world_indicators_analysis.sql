-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 08_world_indicators_analysis.sql
-- DATASET : World Development Indicators
-- ==========================================================

-- ==========================================================
-- 1. View all records
-- ==========================================================

SELECT *
FROM world_indicators;

-- ==========================================================
-- 2. Total number of records
-- ==========================================================

SELECT COUNT(*) AS total_records
FROM world_indicators;

-- ==========================================================
-- 3. Total countries
-- ==========================================================

SELECT COUNT(DISTINCT country_code) AS total_countries
FROM world_indicators;

-- ==========================================================
-- 4. Total indicators
-- ==========================================================

SELECT COUNT(DISTINCT indicator_code) AS total_indicators
FROM world_indicators;

-- ==========================================================
-- 5. Year range
-- ==========================================================

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM world_indicators;

-- ==========================================================
-- 6. List all business indicators
-- ==========================================================

SELECT DISTINCT business_indicator
FROM world_indicators
ORDER BY business_indicator;

-- ==========================================================
-- 7. Top 20 indicators with highest values
-- ==========================================================

SELECT
    country_name,
    indicator_name,
    year,
    indicator_value
FROM world_indicators
ORDER BY indicator_value DESC
LIMIT 20;

-- ==========================================================
-- 8. Lowest indicator values
-- ==========================================================

SELECT
    country_name,
    indicator_name,
    year,
    indicator_value
FROM world_indicators
ORDER BY indicator_value
LIMIT 20;

-- ==========================================================
-- 9. Average indicator value by year
-- ==========================================================

SELECT
    year,
    ROUND(AVG(indicator_value)::numeric,2) AS avg_value
FROM world_indicators
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 10. Number of records by business indicator
-- ==========================================================

SELECT
    business_indicator,
    COUNT(*) AS total_records
FROM world_indicators
GROUP BY business_indicator
ORDER BY total_records DESC;

-- ==========================================================
-- 11. Average value by business indicator
-- ==========================================================

SELECT
    business_indicator,
    ROUND(AVG(indicator_value)::numeric,2) AS average_value
FROM world_indicators
GROUP BY business_indicator
ORDER BY average_value DESC;

-- ==========================================================
-- 12. Countries with most indicator records
-- ==========================================================

SELECT
    country_name,
    COUNT(*) AS total_records
FROM world_indicators
GROUP BY country_name
ORDER BY total_records DESC
LIMIT 20;

-- ==========================================================
-- 13. Latest available year
-- ==========================================================

SELECT *
FROM world_indicators
WHERE year = (
    SELECT MAX(year)
    FROM world_indicators
);

-- ==========================================================
-- 14. Earliest available year
-- ==========================================================

SELECT *
FROM world_indicators
WHERE year = (
    SELECT MIN(year)
    FROM world_indicators
);

-- ==========================================================
-- 15. Indicator coverage by country
-- ==========================================================

SELECT
    country_name,
    COUNT(DISTINCT indicator_code) AS indicators_available
FROM world_indicators
GROUP BY country_name
ORDER BY indicators_available DESC;

-- ==========================================================
-- 16. Top 20 countries by average indicator value
-- ==========================================================

SELECT
    country_name,
    ROUND(AVG(indicator_value)::numeric,2) AS average_value
FROM world_indicators
GROUP BY country_name
ORDER BY average_value DESC
LIMIT 20;

-- ==========================================================
-- 17. Records by year
-- ==========================================================

SELECT
    year,
    COUNT(*) AS total_records
FROM world_indicators
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 18. Maximum indicator value by business category
-- ==========================================================

SELECT
    business_indicator,
    MAX(indicator_value) AS max_value
FROM world_indicators
GROUP BY business_indicator
ORDER BY max_value DESC;

-- ==========================================================
-- 19. Minimum indicator value by business category
-- ==========================================================

SELECT
    business_indicator,
    MIN(indicator_value) AS min_value
FROM world_indicators
GROUP BY business_indicator
ORDER BY min_value;

-- ==========================================================
-- 20. Dataset summary
-- ==========================================================

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT country_code) AS countries,
    COUNT(DISTINCT indicator_code) AS indicators,
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM world_indicators;