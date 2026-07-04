-- ==========================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 13_indexes.sql
-- PURPOSE : Performance Optimization using Indexes
-- ==========================================================

-- ==========================================================
-- PEACE INDEX
-- ==========================================================

CREATE INDEX idx_peace_country
ON peace_index(country_code);

CREATE INDEX idx_peace_year
ON peace_index(year);

CREATE INDEX idx_peace_country_year
ON peace_index(country_code, year);

-- ==========================================================
-- INFLATION
-- ==========================================================

CREATE INDEX idx_inflation_country
ON inflation(country_code);

CREATE INDEX idx_inflation_year
ON inflation(year);

CREATE INDEX idx_inflation_country_year
ON inflation(country_code, year);

-- ==========================================================
-- DISASTERS
-- ==========================================================

CREATE INDEX idx_disaster_country
ON disasters(country_code);

CREATE INDEX idx_disaster_year
ON disasters(start_year);

CREATE INDEX idx_disaster_type
ON disasters(disaster_type);

-- ==========================================================
-- FOOD PRICES
-- ==========================================================

CREATE INDEX idx_food_country
ON food_prices(country_name);

CREATE INDEX idx_food_year
ON food_prices(year);

CREATE INDEX idx_food_commodity
ON food_prices(commodity_name);

-- ==========================================================
-- WORLD INDICATORS
-- ==========================================================

CREATE INDEX idx_wdi_country
ON world_indicators(country_code);

CREATE INDEX idx_wdi_year
ON world_indicators(year);

CREATE INDEX idx_wdi_indicator
ON world_indicators(indicator_code);

-- ==========================================================
-- COMPOSITE INDEXES
-- ==========================================================

CREATE INDEX idx_wdi_country_year
ON world_indicators(country_code, year);

CREATE INDEX idx_food_country_year
ON food_prices(country_name, year);

CREATE INDEX idx_disaster_country_year
ON disasters(country_code, start_year);