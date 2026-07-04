-- ============================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 02_create_tables.sql
-- AUTHOR  : Prasad Chaudhari
-- PURPOSE : Create all project tables
-- ============================================================

-- ============================================================
-- PEACE INDEX
-- ============================================================

DROP TABLE IF EXISTS peace_index;

CREATE TABLE peace_index
(
    id SERIAL PRIMARY KEY,

    country_name VARCHAR(100) NOT NULL,
    country_code CHAR(3) NOT NULL,
    year INT NOT NULL,
    peace_score DECIMAL(5,3) NOT NULL
);

-- ============================================================
-- INFLATION
-- ============================================================

DROP TABLE IF EXISTS inflation;

CREATE TABLE inflation
(
    id SERIAL PRIMARY KEY,

    country_name VARCHAR(100) NOT NULL,
    country_code CHAR(3) NOT NULL,
    year INT NOT NULL,
    inflation_rate DECIMAL(10,2)
);

-- ============================================================
-- DISASTERS
-- ============================================================

DROP TABLE IF EXISTS disasters;

CREATE TABLE disasters
(
    id SERIAL PRIMARY KEY,

    disaster_code VARCHAR(50),

    country_name VARCHAR(100),
    country_code CHAR(3),

    region VARCHAR(100),
    subregion VARCHAR(100),

    disaster_group VARCHAR(100),
    disaster_subgroup VARCHAR(100),

    disaster_type VARCHAR(100),
    disaster_subtype VARCHAR(100),

    start_year INT,
    start_month INT,
    start_day INT,

    end_year INT,

    total_deaths BIGINT,
    total_affected BIGINT,

    economic_damage_usd DECIMAL(18,2)
);

-- ============================================================
-- FOOD PRICES
-- ============================================================

DROP TABLE IF EXISTS food_prices;

CREATE TABLE food_prices
(
    id SERIAL PRIMARY KEY,

    country_name VARCHAR(100),
    region_name VARCHAR(100),

    market_id INT,
    market_name VARCHAR(150),

    commodity_id INT,
    commodity_name VARCHAR(150),

    currency VARCHAR(50),
    price_type VARCHAR(100),

    unit VARCHAR(50),

    month INT,
    year INT,

    price DECIMAL(12,2),

    price_date DATE
);

-- ============================================================
-- WORLD INDICATORS
-- ============================================================

DROP TABLE IF EXISTS world_indicators;

CREATE TABLE world_indicators
(
    id SERIAL PRIMARY KEY,

    country_name VARCHAR(100),
    country_code CHAR(3),

    indicator_code VARCHAR(100),
    indicator_name VARCHAR(255),

    year INT,

    indicator_value DECIMAL(20,4),

    business_indicator VARCHAR(150)
);

-- ============================================================
-- VERIFY TABLES
-- ============================================================

SELECT table_name
FROM information_schema.tables
WHERE table_schema='public'
ORDER BY table_name;