-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 09_cross_dataset_analysis.sql
-- PURPOSE : Cross Dataset Analysis
-- ==========================================================

-- ==========================================================
-- 1. Peace Score vs Inflation
-- Latest Year Available in Both Tables
-- ==========================================================

SELECT
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate
FROM peace_index p
JOIN inflation i
ON p.country_code = i.country_code
AND p.year = i.year
ORDER BY p.peace_score DESC;


-- ==========================================================
-- 2. Countries with High Inflation and Low Peace
-- ==========================================================

SELECT
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate
FROM peace_index p
JOIN inflation i
ON p.country_code=i.country_code
AND p.year=i.year
WHERE
    i.inflation_rate>10
    AND p.peace_score>2.5
ORDER BY i.inflation_rate DESC;


-- ==========================================================
-- 3. Peace Score vs Disaster Deaths
-- ==========================================================

SELECT
    p.country_name,
    p.year,
    p.peace_score,
    SUM(d.total_deaths) AS total_deaths
FROM peace_index p
JOIN disasters d
ON p.country_code=d.country_code
AND p.year=d.start_year
GROUP BY
    p.country_name,
    p.year,
    p.peace_score
ORDER BY total_deaths DESC NULLS LAST;


-- ==========================================================
-- 4. Peace Score vs Economic Damage
-- ==========================================================

SELECT
    p.country_name,
    p.year,
    p.peace_score,
    SUM(d.economic_damage_usd) AS damage
FROM peace_index p
JOIN disasters d
ON p.country_code=d.country_code
AND p.year=d.start_year
GROUP BY
    p.country_name,
    p.year,
    p.peace_score
ORDER BY damage DESC NULLS LAST;


-- ==========================================================
-- 5. Inflation vs Food Prices
-- ==========================================================

SELECT
    i.country_name,
    i.year,
    ROUND(AVG(fp.price)::numeric,2) AS average_food_price,
    ROUND(AVG(i.inflation_rate),2) AS inflation
FROM inflation i
JOIN food_prices fp
ON i.country_name=fp.country_name
AND i.year=fp.year
GROUP BY
    i.country_name,
    i.year
ORDER BY average_food_price DESC;


-- ==========================================================
-- 6. Countries Having Most Disaster Events
-- ==========================================================

SELECT
    p.country_name,
    COUNT(d.disaster_code) AS disasters,
    p.peace_score
FROM peace_index p
JOIN disasters d
ON p.country_code=d.country_code
AND p.year=d.start_year
GROUP BY
    p.country_name,
    p.peace_score
ORDER BY disasters DESC;


-- ==========================================================
-- 7. Countries Facing Multiple Crises
-- ==========================================================

SELECT
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate,
    SUM(d.total_deaths) AS deaths
FROM peace_index p

JOIN inflation i
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
    deaths DESC NULLS LAST;


-- ==========================================================
-- 8. Average Peace Score by Region
-- ==========================================================

SELECT
    d.region,
    ROUND(AVG(p.peace_score),3) AS avg_peace
FROM peace_index p
JOIN disasters d
ON p.country_code=d.country_code
GROUP BY d.region
ORDER BY avg_peace;


-- ==========================================================
-- 9. Countries with Highest Food Prices and Inflation
-- ==========================================================


SELECT
    fp.country_name,
    fp.year,
    ROUND(AVG(fp.price)::numeric,2) AS food_price,
    ROUND(AVG(i.inflation_rate),2) AS inflation
FROM food_prices fp

JOIN inflation i
ON fp.country_name=i.country_name
AND fp.year=i.year

GROUP BY
    fp.country_name,
    fp.year

ORDER BY
    food_price DESC;



-- ==========================================================
-- 10. Global Crisis Summary
-- ==========================================================

SELECT
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate,
    COUNT(d.disaster_code) AS disasters
FROM peace_index p

JOIN inflation i
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
    p.peace_score DESC;