-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 18_master_analysis.sql
-- PURPOSE : Master SQL Showcase
-- AUTHOR  : Prasad Chaudhari
-- ==========================================================

------------------------------------------------------------
-- QUERY 1
-- Top 10 Least Peaceful Countries
------------------------------------------------------------

SELECT
    country_name,
    ROUND(AVG(peace_score)::NUMERIC,3) AS avg_peace
FROM peace_index
GROUP BY country_name
ORDER BY avg_peace DESC
LIMIT 10;

------------------------------------------------------------
-- QUERY 2
-- Top 10 Highest Inflation Countries
------------------------------------------------------------

SELECT
    country_name,
    ROUND(AVG(inflation_rate)::NUMERIC,2) AS avg_inflation
FROM inflation
GROUP BY country_name
ORDER BY avg_inflation DESC
LIMIT 10;

------------------------------------------------------------
-- QUERY 3
-- Countries with Highest Disaster Deaths
------------------------------------------------------------

SELECT
    country_name,
    SUM(total_deaths) AS total_deaths
FROM disasters
GROUP BY country_name
ORDER BY total_deaths DESC
LIMIT 10;

------------------------------------------------------------
-- QUERY 4
-- Most Disaster-Prone Countries
------------------------------------------------------------

SELECT
    country_name,
    COUNT(*) AS disasters
FROM disasters
GROUP BY country_name
ORDER BY disasters DESC
LIMIT 10;

------------------------------------------------------------
-- QUERY 5
-- Most Expensive Commodities
------------------------------------------------------------

SELECT
    commodity_name,
    ROUND(AVG(price)::NUMERIC,2) AS average_price
FROM food_prices
GROUP BY commodity_name
ORDER BY average_price DESC
LIMIT 10;

------------------------------------------------------------
-- QUERY 6
-- Peace vs Inflation
------------------------------------------------------------

SELECT

p.country_name,

p.year,

p.peace_score,

i.inflation_rate

FROM peace_index p

JOIN inflation i

ON p.country_code=i.country_code

AND p.year=i.year

ORDER BY p.peace_score DESC;

------------------------------------------------------------
-- QUERY 7
-- Countries Facing Multiple Crises
------------------------------------------------------------

SELECT

p.country_name,

ROUND(AVG(p.peace_score)::NUMERIC,2) AS peace,

ROUND(AVG(i.inflation_rate)::NUMERIC,2) AS inflation,

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
-- QUERY 8
-- Food Price vs Inflation
------------------------------------------------------------

SELECT

i.country_name,

i.year,

ROUND(AVG(fp.price)::NUMERIC,2) AS food_price,

ROUND(AVG(i.inflation_rate)::NUMERIC,2) AS inflation

FROM inflation i

JOIN food_prices fp

ON i.country_name=fp.country_name

AND i.year=fp.year

GROUP BY

i.country_name,

i.year

ORDER BY inflation DESC;

------------------------------------------------------------
-- QUERY 9
-- Window Function
------------------------------------------------------------

SELECT

country_name,

year,

peace_score,

RANK()

OVER(

ORDER BY peace_score

) AS ranking

FROM peace_index;

------------------------------------------------------------
-- QUERY 10
-- Running Inflation Average
------------------------------------------------------------

SELECT

country_name,

year,

inflation_rate,

ROUND(

AVG(inflation_rate)

OVER(

PARTITION BY country_name

ORDER BY year

)::NUMERIC,2

) AS running_average

FROM inflation;

------------------------------------------------------------
-- QUERY 11
-- CTE Example
------------------------------------------------------------

WITH peace_average AS
(
SELECT

country_name,

AVG(peace_score) AS avg_peace

FROM peace_index

GROUP BY country_name
)

SELECT *

FROM peace_average

ORDER BY avg_peace;

------------------------------------------------------------
-- QUERY 12
-- Multi-CTE Analysis
------------------------------------------------------------

WITH peace AS
(
SELECT

country_code,

AVG(peace_score) AS peace

FROM peace_index

GROUP BY country_code
),

inflation AS
(
SELECT

country_code,

AVG(inflation_rate) AS inflation

FROM inflation

GROUP BY country_code
)

SELECT

p.country_code,

ROUND(p.peace::NUMERIC,3),

ROUND(i.inflation::NUMERIC,2)

FROM peace p

JOIN inflation i

ON p.country_code=i.country_code;

------------------------------------------------------------
-- QUERY 13
-- View Example
------------------------------------------------------------

SELECT *

FROM vw_global_crisis_overview

ORDER BY total_deaths DESC NULLS LAST

LIMIT 20;

------------------------------------------------------------
-- QUERY 14
-- Executive Summary
------------------------------------------------------------

SELECT

(SELECT COUNT(*) FROM peace_index) AS peace_records,

(SELECT COUNT(*) FROM inflation) AS inflation_records,

(SELECT COUNT(*) FROM disasters) AS disaster_records,

(SELECT COUNT(*) FROM food_prices) AS food_records,

(SELECT COUNT(*) FROM world_indicators) AS indicator_records;