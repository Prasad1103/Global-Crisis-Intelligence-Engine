-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 16_business_reports.sql
-- PURPOSE : Executive Business Reports
-- ==========================================================

-- ==========================================================
-- REPORT 1
-- Top 10 Countries with Highest Average Inflation
-- ==========================================================

SELECT
    country_name,
    ROUND(AVG(inflation_rate),2) AS avg_inflation
FROM inflation
GROUP BY country_name
ORDER BY avg_inflation DESC
LIMIT 10;

------------------------------------------------------------

-- REPORT 2
-- Top 10 Least Peaceful Countries

SELECT
    country_name,
    ROUND(AVG(peace_score),3) AS avg_peace_score
FROM peace_index
GROUP BY country_name
ORDER BY avg_peace_score DESC
LIMIT 10;

------------------------------------------------------------

-- REPORT 3
-- Countries with Highest Disaster Deaths

SELECT
    country_name,
    SUM(total_deaths) AS deaths
FROM disasters
GROUP BY country_name
ORDER BY deaths DESC
LIMIT 10;

------------------------------------------------------------

-- REPORT 4
-- Countries with Highest Economic Damage

SELECT
    country_name,
    SUM(economic_damage_usd) AS total_damage
FROM disasters
GROUP BY country_name
ORDER BY total_damage DESC
LIMIT 10;

------------------------------------------------------------

-- REPORT 5
-- Most Disaster-Prone Countries

SELECT
    country_name,
    COUNT(*) AS disasters
FROM disasters
GROUP BY country_name
ORDER BY disasters DESC
LIMIT 10;

------------------------------------------------------------

-- REPORT 6
-- Most Expensive Commodities

SELECT
    commodity_name,
    ROUND(AVG(price)::numeric,2) AS average_price
FROM food_prices
GROUP BY commodity_name
ORDER BY average_price DESC
LIMIT 10;

------------------------------------------------------------

-- REPORT 7
-- Countries with Highest Food Prices

SELECT
    country_name,
    ROUND(AVG(price)::numeric,2) AS average_price
FROM food_prices
GROUP BY country_name
ORDER BY average_price DESC
LIMIT 10;

------------------------------------------------------------

-- REPORT 8
-- Average Peace Score by Year

SELECT
    year,
    ROUND(AVG(peace_score),3) AS average_score
FROM peace_index
GROUP BY year
ORDER BY year;

------------------------------------------------------------

-- REPORT 9
-- Average Inflation by Year

SELECT
    year,
    ROUND(AVG(inflation_rate),2) AS average_inflation
FROM inflation
GROUP BY year
ORDER BY year;

------------------------------------------------------------

-- REPORT 10
-- Disaster Trend

SELECT
    start_year,
    COUNT(*) AS disaster_events
FROM disasters
GROUP BY start_year
ORDER BY start_year;

------------------------------------------------------------

-- REPORT 11
-- Countries Facing Multiple Crises

SELECT

p.country_name,

ROUND(AVG(p.peace_score),2) AS peace,

ROUND(AVG(i.inflation_rate),2) AS inflation,

COUNT(d.disaster_code) AS disasters

FROM peace_index p

LEFT JOIN inflation i

ON p.country_code=i.country_code
AND p.year=i.year

LEFT JOIN disasters d

ON p.country_code=d.country_code
AND p.year=d.start_year

GROUP BY p.country_name

ORDER BY disasters DESC;

------------------------------------------------------------

-- REPORT 12
-- High Inflation & Low Peace Countries

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

ORDER BY inflation_rate DESC;

------------------------------------------------------------

-- REPORT 13
-- Food Price vs Inflation

SELECT

i.country_name,

i.year,

ROUND(AVG(fp.price)::numeric,2) AS food_price,

ROUND(AVG(i.inflation_rate)::numeric,2) AS inflation

FROM inflation i

JOIN food_prices fp

ON i.country_name=fp.country_name
AND i.year=fp.year

GROUP BY

i.country_name,

i.year

ORDER BY inflation DESC;

------------------------------------------------------------

-- REPORT 14
-- Peace vs Disaster Deaths

SELECT

p.country_name,

SUM(d.total_deaths) AS deaths,

ROUND(AVG(p.peace_score),2) AS peace

FROM peace_index p

JOIN disasters d

ON p.country_code=d.country_code
AND p.year=d.start_year

GROUP BY p.country_name

ORDER BY deaths DESC;

------------------------------------------------------------

-- REPORT 15
-- Region-wise Disaster Events

SELECT

region,

COUNT(*) AS disasters

FROM disasters

GROUP BY region

ORDER BY disasters DESC;

------------------------------------------------------------

-- REPORT 16
-- Top Indicators by Record Count

SELECT

business_indicator,

COUNT(*) AS records

FROM world_indicators

GROUP BY business_indicator

ORDER BY records DESC;

------------------------------------------------------------

-- REPORT 17
-- Highest Average Indicator Value

SELECT

business_indicator,

ROUND(AVG(indicator_value)::numeric,2) AS average_value

FROM world_indicators

GROUP BY business_indicator

ORDER BY average_value DESC;

------------------------------------------------------------

-- REPORT 18
-- Crisis Ranking

SELECT

country_name,

AVG(peace_score) AS peace,

AVG(inflation_rate) AS inflation

FROM vw_peace_inflation

GROUP BY country_name

ORDER BY peace DESC,
inflation DESC;

------------------------------------------------------------

-- REPORT 19
-- Top 20 High Risk Countries

SELECT *

FROM vw_high_risk_countries

ORDER BY

peace_score DESC,

inflation_rate DESC;

------------------------------------------------------------

-- REPORT 20
-- Executive Summary

SELECT

(SELECT COUNT(*) FROM peace_index) AS peace_records,

(SELECT COUNT(*) FROM inflation) AS inflation_records,

(SELECT COUNT(*) FROM disasters) AS disaster_records,

(SELECT COUNT(*) FROM food_prices) AS food_records,

(SELECT COUNT(*) FROM world_indicators) AS indicator_records;

