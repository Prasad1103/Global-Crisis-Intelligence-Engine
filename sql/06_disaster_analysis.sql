-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 06_disaster_analysis.sql
-- DATASET : Disasters
-- ==========================================================

-- ==========================================================
-- 1. View all disaster records
-- ==========================================================

SELECT *
FROM disasters;

-- ==========================================================
-- 2. Total disaster records
-- ==========================================================

SELECT COUNT(*) AS total_disasters
FROM disasters;

-- ==========================================================
-- 3. Number of affected countries
-- ==========================================================

SELECT COUNT(DISTINCT country_code) AS total_countries
FROM disasters;

-- ==========================================================
-- 4. Disaster year range
-- ==========================================================

SELECT
    MIN(start_year) AS first_year,
    MAX(start_year) AS last_year
FROM disasters;

-- ==========================================================
-- 5. Number of disasters by type
-- ==========================================================

SELECT
    disaster_type,
    COUNT(*) AS total_events
FROM disasters
GROUP BY disaster_type
ORDER BY total_events DESC;

-- ==========================================================
-- 6. Number of disasters by disaster group
-- ==========================================================

SELECT
    disaster_group,
    COUNT(*) AS total_events
FROM disasters
GROUP BY disaster_group
ORDER BY total_events DESC;

-- ==========================================================
-- 7. Top 20 countries with most disasters
-- ==========================================================

SELECT
    country_name,
    COUNT(*) AS total_disasters
FROM disasters
GROUP BY country_name
ORDER BY total_disasters DESC
LIMIT 20;

-- ==========================================================
-- 8. Countries with highest total deaths
-- ==========================================================

SELECT
    country_name,
    SUM(total_deaths) AS total_deaths
FROM disasters
GROUP BY country_name
ORDER BY total_deaths DESC
LIMIT 20;

-- ==========================================================
-- 9. Countries with highest affected population
-- ==========================================================

SELECT
    country_name,
    SUM(total_affected) AS affected_population
FROM disasters
GROUP BY country_name
ORDER BY affected_population DESC
LIMIT 20;

-- ==========================================================
-- 10. Countries with highest economic damage
-- ==========================================================

SELECT
    country_name,
    SUM(economic_damage_usd) AS economic_damage
FROM disasters
GROUP BY country_name
ORDER BY economic_damage DESC
LIMIT 20;

-- ==========================================================
-- 11. Disaster events by year
-- ==========================================================

SELECT
    start_year,
    COUNT(*) AS total_events
FROM disasters
GROUP BY start_year
ORDER BY start_year;

-- ==========================================================
-- 12. Total deaths by year
-- ==========================================================

SELECT
    start_year,
    SUM(total_deaths) AS deaths
FROM disasters
GROUP BY start_year
ORDER BY start_year;

-- ==========================================================
-- 13. Most common disaster subtype
-- ==========================================================

SELECT
    disaster_subtype,
    COUNT(*) AS total_events
FROM disasters
GROUP BY disaster_subtype
ORDER BY total_events DESC
LIMIT 20;

-- ==========================================================
-- 14. Top 10 regions with most disasters
-- ==========================================================

SELECT
    region,
    COUNT(*) AS total_disasters
FROM disasters
GROUP BY region
ORDER BY total_disasters DESC
LIMIT 10;

-- ==========================================================
-- 15. Top 10 subregions with most disasters
-- ==========================================================

SELECT
    subregion,
    COUNT(*) AS total_disasters
FROM disasters
GROUP BY subregion
ORDER BY total_disasters DESC
LIMIT 10;

-- ==========================================================
-- 16. Average deaths per disaster type
-- ==========================================================

SELECT
    disaster_type,
    ROUND(AVG(total_deaths),2) AS avg_deaths
FROM disasters
GROUP BY disaster_type
ORDER BY avg_deaths DESC;

-- ==========================================================
-- 17. Average economic damage by disaster type
-- ==========================================================

SELECT
    disaster_type,
    ROUND(AVG(economic_damage_usd),2) AS avg_damage
FROM disasters
GROUP BY disaster_type
ORDER BY avg_damage DESC;

-- ==========================================================
-- 18. Deadliest disaster events
-- ==========================================================

SELECT
    country_name,
    disaster_type,
    start_year,
    total_deaths
FROM disasters
ORDER BY total_deaths DESC
LIMIT 20;

-- ==========================================================
-- 19. Costliest disaster events
-- ==========================================================

SELECT
    country_name,
    disaster_type,
    start_year,
    economic_damage_usd
FROM disasters
ORDER BY economic_damage_usd DESC
LIMIT 20;

-- ==========================================================
-- 20. Disaster summary by country
-- ==========================================================

SELECT
    country_name,
    COUNT(*) AS total_events,
    SUM(total_deaths) AS total_deaths,
    SUM(total_affected) AS total_affected,
    SUM(economic_damage_usd) AS total_damage
FROM disasters
GROUP BY country_name
ORDER BY total_events DESC;