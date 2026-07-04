-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 11_views.sql
-- PURPOSE : Analytical Views
-- ==========================================================

-- ==========================================================
-- 1. Peace Summary View
-- ==========================================================


CREATE OR REPLACE VIEW vw_peace_summary AS
SELECT
    country_name,
    country_code,
    year,
    peace_score
FROM peace_index;

-- =============================================
-- verify the view by selecting from it     
-- =============================================
SELECT * FROM vw_peace_summary LIMIT 10;

-- ==========================================================
-- 2. Inflation Summary View
-- ==========================================================

CREATE OR REPLACE VIEW vw_inflation_summary AS
SELECT
    country_name,
    country_code,
    year,
    inflation_rate
FROM inflation;

-- =============================================
-- verify the view by selecting from it
-- =============================================
SELECT * FROM vw_inflation_summary LIMIT 10;

-- ==========================================================
-- 3. Disaster Summary View
-- ==========================================================

CREATE OR REPLACE VIEW vw_disaster_summary AS
SELECT
    country_name,
    disaster_type,
    start_year,
    total_deaths,
    total_affected,
    economic_damage_usd
FROM disasters;

-- =============================================
-- verify the view by selecting from it 
-- =============================================
SELECT * FROM vw_disaster_summary LIMIT 10;

-- ==========================================================
-- 4. Food Price Summary View
-- ==========================================================

CREATE OR REPLACE VIEW vw_food_price_summary AS
SELECT
    country_name AS country_name,
    commodity_name AS commodity,
    year,
    month,
    price
FROM food_prices;

-- =============================================
-- verify the view by selecting from it 
-- =============================================
SELECT * FROM vw_food_price_summary LIMIT 10;


-- ==========================================================
-- 5. World Indicators View
-- ==========================================================

CREATE OR REPLACE VIEW vw_world_indicators AS
SELECT
    country_name,
    indicator_name,
    year,
    indicator_value,
    business_indicator
FROM world_indicators;

-- =============================================
-- verify the view by selecting from it
-- =============================================
SELECT * FROM vw_world_indicators LIMIT 10;


-- ==========================================================
-- 6. Peace + Inflation View
-- ==========================================================

CREATE OR REPLACE VIEW vw_peace_inflation AS
SELECT
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate
FROM peace_index p
JOIN inflation i
ON p.country_code = i.country_code
AND p.year = i.year;

-- =============================================
-- verify the view by selecting from it 
-- =============================================
SELECT * FROM vw_peace_inflation LIMIT 10;

-- ==========================================================
-- 7. Peace + Disaster View
-- ==========================================================

CREATE OR REPLACE VIEW vw_peace_disaster AS
SELECT
    p.country_name,
    p.year,
    p.peace_score,
    COUNT(d.disaster_code) AS total_disasters,
    SUM(d.total_deaths) AS total_deaths
FROM peace_index p
LEFT JOIN disasters d
ON p.country_code = d.country_code
AND p.year = d.start_year
GROUP BY
    p.country_name,
    p.year,
    p.peace_score;

-- =============================================
-- verify the view by selecting from it
-- =============================================
SELECT * FROM vw_peace_disaster LIMIT 10;


-- ==========================================================
-- 8. Inflation + Food Prices View
-- ==========================================================

CREATE OR REPLACE VIEW vw_inflation_food_price AS
SELECT
    i.country_name,
    i.year,
    i.inflation_rate,
    ROUND(AVG(f.price)::numeric,2) AS avg_food_price
FROM inflation i
JOIN food_prices f
ON i.country_name = f.country_name
AND i.year = f.year
GROUP BY
    i.country_name,
    i.year,
    i.inflation_rate;

-- =============================================
-- verify the view by selecting from it
-- =============================================
SELECT * FROM vw_inflation_food_price LIMIT 10;


-- ==========================================================
-- 9. Global Crisis Overview
-- ==========================================================

CREATE OR REPLACE VIEW vw_global_crisis_overview AS
SELECT
    p.country_name,
    p.year,
    p.peace_score,
    i.inflation_rate,
    COUNT(d.disaster_code) AS disaster_events,
    SUM(d.total_deaths) AS total_deaths
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
    i.inflation_rate;

-- =============================================
-- verify the view by selecting from it 
-- =============================================
SELECT * FROM vw_global_crisis_overview LIMIT 10;

-- ==========================================================
-- 10. High Risk Countries
-- ==========================================================

CREATE OR REPLACE VIEW vw_high_risk_countries AS
SELECT
    country_name,
    year,
    peace_score,
    inflation_rate,
    disaster_events,
    total_deaths
FROM vw_global_crisis_overview
WHERE
    peace_score > 2.5
    OR inflation_rate > 10
    OR disaster_events > 5;

-- ============================================================
-- verify the view by selecting from it
-- ============================================================
SELECT * FROM vw_high_risk_countries LIMIT 10;

-- =========================================================
-- 11. List of Views in the Database
-- =========================================================
SELECT table_name
FROM information_schema.views
WHERE table_schema = 'public';