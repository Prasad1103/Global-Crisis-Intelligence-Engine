-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 04_peace_analysis.sql
-- DATASET : Peace Index
-- ==========================================================

-- ==========================================================
-- 1. View all records
-- ==========================================================


SELECT *
FROM peace_index;


-- ==========================================================
-- 2. Total number of records
-- ==========================================================

SELECT COUNT(*) AS total_records
FROM peace_index;

-- ==========================================================
-- 3. Total number of countries
-- ==========================================================

SELECT COUNT(DISTINCT country_code) AS total_countries
FROM peace_index;

-- ==========================================================
-- 4. Year range available
-- ==========================================================

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM peace_index;

-- ==========================================================
-- 5. List all available years
-- ==========================================================

SELECT DISTINCT year
FROM peace_index
ORDER BY year;

-- ==========================================================
-- 6. Top 10 safest countries (Lowest Peace Score)
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score
FROM peace_index
ORDER BY peace_score ASC
LIMIT 10;

-- ==========================================================
-- 7. Top 10 least peaceful countries
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score
FROM peace_index
ORDER BY peace_score DESC
LIMIT 10;

-- ==========================================================
-- 8. Average peace score of all countries
-- ==========================================================

SELECT
    ROUND(AVG(peace_score),3) AS average_peace_score
FROM peace_index;

-- ==========================================================
-- 9. Countries with peace score below global average
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score
FROM peace_index
WHERE peace_score <
(
    SELECT AVG(peace_score)
    FROM peace_index
)
ORDER BY peace_score;

-- ==========================================================
-- 10. Countries with peace score above global average
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score
FROM peace_index
WHERE peace_score >
(
    SELECT AVG(peace_score)
    FROM peace_index
)
ORDER BY peace_score DESC;

-- ==========================================================
-- 11. Average peace score by year
-- ==========================================================

SELECT
    year,
    ROUND(AVG(peace_score),3) AS avg_score
FROM peace_index
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 12. Best peace score achieved by each country
-- ==========================================================

SELECT
    country_name,
    MIN(peace_score) AS best_score
FROM peace_index
GROUP BY country_name
ORDER BY best_score;

-- ==========================================================
-- 13. Worst peace score for each country
-- ==========================================================

SELECT
    country_name,
    MAX(peace_score) AS worst_score
FROM peace_index
GROUP BY country_name
ORDER BY worst_score DESC;

-- ==========================================================
-- 14. Countries having peace score less than 1.5
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score
FROM peace_index
WHERE peace_score < 1.5
ORDER BY peace_score;

-- ==========================================================
-- 15. Countries having peace score greater than 3
-- ==========================================================

SELECT
    country_name,
    year,
    peace_score
FROM peace_index
WHERE peace_score > 3
ORDER BY peace_score DESC;

-- ==========================================================
-- 16. Number of countries by year
-- ==========================================================

SELECT
    year,
    COUNT(country_code) AS countries
FROM peace_index
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 17. Latest available data
-- ==========================================================

SELECT *
FROM peace_index
WHERE year =
(
    SELECT MAX(year)
    FROM peace_index
);

-- ==========================================================
-- 18. Earliest available data
-- ==========================================================

SELECT *
FROM peace_index
WHERE year =
(
    SELECT MIN(year)
    FROM peace_index
);

-- ==========================================================
-- 19. Top 20 countries in the latest year
-- ==========================================================

SELECT
    country_name,
    peace_score
FROM peace_index
WHERE year =
(
    SELECT MAX(year)
    FROM peace_index
)
ORDER BY peace_score
LIMIT 20;

-- ==========================================================
-- 20. Bottom 20 countries in the latest year
-- ==========================================================

SELECT
    country_name,
    peace_score
FROM peace_index
WHERE year =
(
    SELECT MAX(year)
    FROM peace_index
)
ORDER BY peace_score DESC
LIMIT 20;