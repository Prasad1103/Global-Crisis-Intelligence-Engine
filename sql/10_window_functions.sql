-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 10_window_functions.sql
-- PURPOSE : Window Functions
-- ==========================================================

-- ==========================================================
-- 1. Row Number by Peace Score
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score,
    ROW_NUMBER() OVER(ORDER BY peace_score) AS row_num
FROM peace_index;

-- ==========================================================
-- 2. Rank Countries by Peace Score
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score,
    RANK() OVER(ORDER BY peace_score) AS rank
FROM peace_index;

-- ==========================================================
-- 3. Dense Rank Countries
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score,
    DENSE_RANK() OVER(ORDER BY peace_score) AS dense_rank
FROM peace_index;

-- ==========================================================
-- 4. Top Peace Score Per Year
-- ==========================================================

SELECT *
FROM
(
    SELECT
        country_name,
        year,
        peace_score,
        RANK() OVER(
            PARTITION BY year
            ORDER BY peace_score
        ) AS rnk
    FROM peace_index
) t
WHERE rnk = 1;

-- ==========================================================
-- 5. Previous Year's Peace Score
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score,
    LAG(peace_score)
    OVER(
        PARTITION BY country_name
        ORDER BY year
    ) AS previous_score
FROM peace_index;

-- ==========================================================
-- 6. Next Year's Peace Score
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score,
    LEAD(peace_score)
    OVER(
        PARTITION BY country_name
        ORDER BY year
    ) AS next_score
FROM peace_index;

-- ==========================================================
-- 7. Year-over-Year Peace Score Change
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score,

    peace_score -
    LAG(peace_score)
    OVER(
        PARTITION BY country_name
        ORDER BY year
    ) AS score_change

FROM peace_index;

-- ==========================================================
-- 8. Running Total of Disaster Deaths
-- ==========================================================

SELECT
    country_name,
    start_year,
    total_deaths,

    SUM(total_deaths)
    OVER(
        PARTITION BY country_name
        ORDER BY start_year
    ) AS running_deaths

FROM disasters;

-- ==========================================================
-- 9. Running Average Inflation
-- ==========================================================

SELECT
    country_name,
    year,
    inflation_rate,

    ROUND(
        AVG(inflation_rate)
        OVER(
            PARTITION BY country_name
            ORDER BY year
        ),
        2
    ) AS running_average

FROM inflation;

-- ==========================================================
-- 10. Highest Inflation Per Country
-- ==========================================================

SELECT *
FROM
(
    SELECT
        country_name,
        year,
        inflation_rate,

        ROW_NUMBER()
        OVER(
            PARTITION BY country_name
            ORDER BY inflation_rate DESC
        ) AS rn

    FROM inflation
) t
WHERE rn = 1;

-- ==========================================================
-- 11. Most Expensive Commodity Per Country
-- ==========================================================

SELECT *
FROM
(
    SELECT
        country_name,
        commodity_name,
        price,

        ROW_NUMBER()
        OVER(
            PARTITION BY country_name
            ORDER BY price DESC
        ) AS rn

    FROM food_prices
) t
WHERE rn = 1;

-- ==========================================================
-- 12. Disaster Ranking by Economic Damage
-- ==========================================================

SELECT
    country_name,
    disaster_type,
    economic_damage_usd,

    RANK()
    OVER(
        ORDER BY economic_damage_usd DESC
    ) AS damage_rank

FROM disasters;

-- ==========================================================
-- 13. Average Peace Score by Country
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score,

    ROUND(
        AVG(peace_score)
        OVER(
            PARTITION BY country_name
        ),
        3
    ) AS average_score

FROM peace_index;

-- ==========================================================
-- 14. Cumulative Food Prices
-- ==========================================================

SELECT
    country_name,
    year,
    price,

    SUM(price)
    OVER(
        PARTITION BY country_name
        ORDER BY year
    ) AS cumulative_price

FROM food_prices;

-- ==========================================================
-- 15. Highest Peace Score by Year
-- ==========================================================

SELECT
    year,
    country_name,
    peace_score,

    FIRST_VALUE(country_name)
    OVER(
        PARTITION BY year
        ORDER BY peace_score
    ) AS safest_country

FROM peace_index;