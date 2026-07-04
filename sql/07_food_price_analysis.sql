-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 07_food_price_analysis.sql
-- DATASET : Food Prices
-- ==========================================================

-- ==========================================================
-- 1. View all records
-- ==========================================================

SELECT *
FROM food_prices;

-- ==========================================================
-- 2. Total number of records
-- ==========================================================

SELECT COUNT(*) AS total_records
FROM food_prices;

-- ==========================================================
-- 3. Total countries
-- ==========================================================

SELECT COUNT(DISTINCT country_name) AS total_countries
FROM food_prices;

-- ==========================================================
-- 4. Total markets
-- ==========================================================

SELECT COUNT(DISTINCT market_name) AS total_markets
FROM food_prices;

-- ==========================================================
-- 5. Total commodities
-- ==========================================================

SELECT COUNT(DISTINCT commodity_name) AS total_commodities
FROM food_prices;

-- ==========================================================
-- 6. Commodity with highest average price
-- ==========================================================

SELECT
    commodity_name,
    ROUND(AVG(price)::numeric,2) AS avg_price
FROM food_prices
GROUP BY commodity_name
ORDER BY avg_price DESC
LIMIT 20;

-- ==========================================================
-- 7. Commodity with lowest average price
-- ==========================================================

SELECT
    commodity_name,
    ROUND(AVG(price)::numeric,2) AS avg_price
FROM food_prices
GROUP BY commodity_name
ORDER BY avg_price
LIMIT 20;

-- ==========================================================
-- 8. Average food price by country
-- ==========================================================

SELECT
    country_name,
    ROUND(AVG(price)::numeric,2) AS avg_price
FROM food_prices
GROUP BY country_name
ORDER BY avg_price DESC;

-- ==========================================================
-- 9. Top 20 markets with highest average price
-- ==========================================================

SELECT
    market_name,
    ROUND(AVG(price)::numeric,2) AS avg_price
FROM food_prices
GROUP BY market_name
ORDER BY avg_price DESC
LIMIT 20;

-- ==========================================================
-- 10. Average price by commodity
-- ==========================================================

SELECT
    commodity_name,
    ROUND(AVG(price)::numeric,2) AS average_price
FROM food_prices
GROUP BY commodity_name
ORDER BY average_price DESC;

-- ==========================================================
-- 11. Price trend by year
-- ==========================================================

SELECT
    year,
    ROUND(AVG(price)::numeric,2) AS avg_price
FROM food_prices
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 12. Price trend by month
-- ==========================================================

SELECT
    month,
    ROUND(AVG(price)::numeric,2) AS avg_price
FROM food_prices
GROUP BY month
ORDER BY month;

-- ==========================================================
-- 13. Most expensive commodity in each country
-- ==========================================================

SELECT
    country_name,
    MAX(price) AS highest_price
FROM food_prices
GROUP BY country_name
ORDER BY highest_price DESC;

-- ==========================================================
-- 14. Retail vs Wholesale comparison
-- ==========================================================

SELECT
    country_name,
    ROUND(AVG(price)::numeric,2) AS average_price
FROM food_prices
GROUP BY country_name
ORDER BY average_price DESC;

-- ==========================================================
-- 15. Top 20 highest priced records
-- ==========================================================

SELECT
    country_name,
    market_name,
    commodity_name,
    price
FROM food_prices
ORDER BY price DESC
LIMIT 20;

-- ==========================================================
-- 16. Top 20 lowest priced records
-- ==========================================================

SELECT
    country_name,
    market_name,
    commodity_name,
    price
FROM food_prices
ORDER BY price
LIMIT 20;

-- ==========================================================
-- 17. Number of observations by country
-- ==========================================================

SELECT
    country_name,
    COUNT(*) AS observations
FROM food_prices
GROUP BY country_name
ORDER BY observations DESC;

-- ==========================================================
-- 18. Number of observations by commodity
-- ==========================================================

SELECT
    commodity_name,
    COUNT(*) AS observations
FROM food_prices
GROUP BY commodity_name
ORDER BY observations DESC;

-- ==========================================================
-- 19. Average price by region (Admin Level 1)
-- ==========================================================

SELECT
    region_name,
    ROUND(AVG(price)::numeric,2) AS average_price
FROM food_prices
GROUP BY region_name
ORDER BY average_price DESC
LIMIT 20;

-- ==========================================================
-- 20. Food price summary
-- ==========================================================
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT country_name) AS countries,
    COUNT(DISTINCT commodity_name) AS commodities,
	ROUND(AVG(price)::numeric, 2) AS average_price,
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM food_prices; 