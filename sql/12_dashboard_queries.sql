-- ==========================================================
-- Dashboard 1
-- Global Crisis Overview
-- ==========================================================

SELECT
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate,
    COUNT(d.disaster_code) AS disaster_events,
    COALESCE(SUM(d.total_deaths),0) AS total_deaths
FROM peace_index p

LEFT JOIN inflation i
ON p.country_code = i.country_code
AND p.year = i.year

LEFT JOIN disasters d
ON p.country_code = d.country_code
AND p.year = d.start_year

GROUP BY
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate

ORDER BY
    p.year,
    p.country_name;

-- 2. Peace Trends
SELECT
    year,
    ROUND(AVG(peace_score),3) AS avg_peace_score
FROM peace_index
GROUP BY year
ORDER BY year;

-- 3. Inflation Trends
SELECT
    year,
    ROUND(AVG(inflation_rate),2) AS avg_inflation
FROM inflation
GROUP BY year
ORDER BY year;

-- 4. Disaster Trends
SELECT
    start_year,
    COUNT(*) AS disaster_events,
    SUM(total_deaths) AS total_deaths
FROM disasters
GROUP BY start_year
ORDER BY start_year;

-- 5. Food Price Trends
SELECT
    mp_year,
    ROUND(AVG(mp_price),2) AS average_food_price
FROM food_prices
GROUP BY mp_year
ORDER BY mp_year;

-- 6. Top 20 Highest Inflation Countries
SELECT
    country_name,
    ROUND(AVG(inflation_rate),2) AS avg_inflation
FROM inflation
GROUP BY country_name
ORDER BY avg_inflation DESC
LIMIT 20;

-- 7. Top 20 Lowest Peace Countries
SELECT
    country_name,
    ROUND(AVG(peace_score),3) AS avg_peace
FROM peace_index
GROUP BY country_name
ORDER BY avg_peace DESC
LIMIT 20;

-- 8. Most Disaster-Prone Countries
SELECT
    country_name,
    COUNT(*) AS disasters
FROM disasters
GROUP BY country_name
ORDER BY disasters DESC
LIMIT 20;

-- 9. Highest Food Price Countries
SELECT
    country_name,
    ROUND(AVG(mp_price),2) AS average_price
FROM food_prices
GROUP BY country_name
ORDER BY average_price DESC
LIMIT 20;

-- 10. Crisis Score Dashboard
SELECT
    p.country_name,
    p.year,

    p.peace_score,

    i.inflation_rate,

    COUNT(d.disaster_code) AS disasters,

    COALESCE(SUM(d.total_deaths),0) AS deaths

FROM peace_index p

LEFT JOIN inflation i
ON p.country_code=i.country_code
AND p.year=i.year

LEFT JOIN disasters d
ON p.country_code=d.country_code
AND p.year=d.start_year

GROUP BY
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate

ORDER BY
    disasters DESC,
    deaths DESC;