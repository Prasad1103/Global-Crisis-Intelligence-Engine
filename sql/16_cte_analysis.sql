-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 17_cte_analysis.sql
-- PURPOSE : Common Table Expressions (CTEs)
-- ==========================================================

-- ==========================================================
-- QUERY 1
-- Average Peace Score by Country
-- ==========================================================

WITH peace_summary AS
(
    SELECT
        country_name,
        AVG(peace_score) AS avg_peace_score
    FROM peace_index
    GROUP BY country_name
)

SELECT *
FROM peace_summary
ORDER BY avg_peace_score;

------------------------------------------------------------

-- QUERY 2
-- Countries with Above Average Inflation
-- ==========================================================

WITH avg_inflation AS
(
    SELECT AVG(inflation_rate) AS global_avg
    FROM inflation
)

SELECT
    i.country_name,
    i.year,
    i.inflation_rate
FROM inflation i
CROSS JOIN avg_inflation a
WHERE i.inflation_rate > a.global_avg
ORDER BY i.inflation_rate DESC;

------------------------------------------------------------

-- QUERY 3
-- Top 10 Most Peaceful Countries
-- ==========================================================

WITH ranked_peace AS
(
    SELECT
        country_name,
        AVG(peace_score) AS avg_score,
        RANK() OVER(ORDER BY AVG(peace_score)) AS rank_no
    FROM peace_index
    GROUP BY country_name
)

SELECT *
FROM ranked_peace
WHERE rank_no <= 10;

------------------------------------------------------------

-- QUERY 4
-- Disaster Summary by Country
-- ==========================================================

WITH disaster_summary AS
(
    SELECT
        country_name,
        COUNT(*) AS disasters,
        SUM(total_deaths) AS deaths,
        SUM(economic_damage_usd) AS damage
    FROM disasters
    GROUP BY country_name
)

SELECT *
FROM disaster_summary
ORDER BY disasters DESC;

------------------------------------------------------------

-- QUERY 5
-- Countries with High Inflation and Low Peace
-- ==========================================================

WITH crisis AS
(
    SELECT

        p.country_name,

        p.year,

        p.peace_score,

        i.inflation_rate

    FROM peace_index p

    JOIN inflation i

    ON p.country_code=i.country_code

    AND p.year=i.year
)

SELECT *

FROM crisis

WHERE

peace_score>2.5

AND inflation_rate>10

ORDER BY inflation_rate DESC;

------------------------------------------------------------

-- QUERY 6
-- Food Price Trend
-- ==========================================================

WITH yearly_prices AS
(
    SELECT
        year,
        AVG(price) AS avg_price
    FROM food_prices
    GROUP BY year
)

SELECT *
FROM yearly_prices
ORDER BY year;

------------------------------------------------------------

-- QUERY 7
-- Highest Average Commodity Price
-- ==========================================================

WITH commodity_avg AS
(
    SELECT
        commodity_name,
        AVG(price) AS avg_price
    FROM food_prices
    GROUP BY commodity_name
)

SELECT *
FROM commodity_avg
ORDER BY avg_price DESC
LIMIT 10;

------------------------------------------------------------

-- QUERY 8
-- Average Disaster Deaths by Disaster Type
-- ==========================================================

WITH disaster_avg AS
(
    SELECT
        disaster_type,
        AVG(total_deaths) AS avg_deaths
    FROM disasters
    GROUP BY disaster_type
)

SELECT *
FROM disaster_avg
ORDER BY avg_deaths DESC;

------------------------------------------------------------

-- QUERY 9
-- Average Inflation by Country
-- ==========================================================

WITH inflation_avg AS
(
    SELECT
        country_name,
        AVG(inflation_rate) AS avg_rate
    FROM inflation
    GROUP BY country_name
)

SELECT *
FROM inflation_avg
ORDER BY avg_rate DESC;

------------------------------------------------------------

-- QUERY 10
-- Multi-CTE Analysis
-- ==========================================================

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

ROUND(p.peace::NUMERIC,3) AS avg_peace,

ROUND(i.inflation::NUMERIC,2) AS avg_inflation

FROM peace p

JOIN inflation i

ON p.country_code=i.country_code

ORDER BY avg_inflation DESC;

------------------------------------------------------------

-- QUERY 11
-- Ranking Countries by Disaster Events
-- ==========================================================

WITH disaster_rank AS
(
    SELECT

        country_name,

        COUNT(*) AS total_events,

        DENSE_RANK()
        OVER(
            ORDER BY COUNT(*) DESC
        ) AS ranking

    FROM disasters

    GROUP BY country_name
)

SELECT *

FROM disaster_rank

WHERE ranking<=10;

------------------------------------------------------------

-- QUERY 12
-- Average Peace by Year
-- ==========================================================

WITH yearly_peace AS
(
    SELECT

        year,

        AVG(peace_score) AS avg_score

    FROM peace_index

    GROUP BY year
)

SELECT *

FROM yearly_peace

ORDER BY year;

------------------------------------------------------------

-- QUERY 13
-- Country Crisis Score
-- ==========================================================

WITH crisis_score AS
(
SELECT

p.country_name,

AVG(p.peace_score) AS peace,

AVG(i.inflation_rate) AS inflation,

COUNT(d.disaster_code) AS disasters

FROM peace_index p

LEFT JOIN inflation i

ON p.country_code=i.country_code

AND p.year=i.year

LEFT JOIN disasters d

ON p.country_code=d.country_code

AND p.year=d.start_year

GROUP BY p.country_name
)

SELECT *

FROM crisis_score

ORDER BY disasters DESC;

------------------------------------------------------------

-- QUERY 14
-- Countries with Maximum Food Price
-- ==========================================================

WITH max_price AS
(
SELECT

country_name,

MAX(price) AS highest_price

FROM food_prices

GROUP BY country_name
)

SELECT *

FROM max_price

ORDER BY highest_price DESC;

------------------------------------------------------------

-- QUERY 15
-- Executive Summary using Multiple CTEs
-- ==========================================================

WITH peace AS
(
SELECT COUNT(*) AS peace_records
FROM peace_index
),

inflation AS
(
SELECT COUNT(*) AS inflation_records
FROM inflation
),

disaster AS
(
SELECT COUNT(*) AS disaster_records
FROM disasters
),

food AS
(
SELECT COUNT(*) AS food_records
FROM food_prices
),

wdi AS
(
SELECT COUNT(*) AS indicator_records
FROM world_indicators
)

SELECT *

FROM peace,
     inflation,
     disaster,
     food,
     wdi;