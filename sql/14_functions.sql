-- ==========================================================
-- Function 1
-- Average Peace Score
-- ==========================================================

CREATE OR REPLACE FUNCTION fn_avg_peace_score(
    p_country CHAR(3)
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    avg_score NUMERIC;
BEGIN

    SELECT AVG(peace_score)
    INTO avg_score
    FROM peace_index
    WHERE country_code = p_country;

    RETURN ROUND(avg_score,3);

END;
$$;

SELECT fn_avg_peace_score('IND');

-- ==========================================================
-- Function 2 — Average Inflation
--- =========================================================

CREATE OR REPLACE FUNCTION fn_avg_inflation(
    p_country CHAR(3)
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    avg_rate NUMERIC;
BEGIN

    SELECT AVG(inflation_rate)
    INTO avg_rate
    FROM inflation
    WHERE country_code = p_country;

    RETURN ROUND(avg_rate,2);

END;
$$;

-- Run

SELECT fn_avg_inflation('IND');

-- ==========================================================
-- Function 3 — Total Disaster Deaths
-- ==========================================================

CREATE OR REPLACE FUNCTION fn_total_deaths(
    p_country CHAR(3)
)
RETURNS BIGINT
LANGUAGE plpgsql
AS
$$
DECLARE
    total BIGINT;
BEGIN

    SELECT COALESCE(SUM(total_deaths),0)
    INTO total
    FROM disasters
    WHERE country_code = p_country;

    RETURN total;

END;
$$;

-- Run

SELECT fn_total_deaths('IND');

-- ==========================================================
-- Function 4 — Average Food Price
-- ==========================================================

CREATE OR REPLACE FUNCTION fn_average_food_price(
    p_country VARCHAR(100)
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    avg_price NUMERIC;
BEGIN

    SELECT AVG(price)
    INTO avg_price
    FROM food_prices
    WHERE country_name = p_country;

    RETURN ROUND(avg_price,2);

END;
$$;

-- Run

SELECT fn_average_food_price('India');

-- ==========================================================
-- Function 5 — Crisis Risk Category
-- ==========================================================

CREATE OR REPLACE FUNCTION fn_crisis_level(
    peace NUMERIC,
    inflation NUMERIC
)
RETURNS TEXT
LANGUAGE plpgsql
AS
$$
BEGIN

    IF peace > 3 OR inflation > 20 THEN
        RETURN 'High Risk';

    ELSIF peace > 2 OR inflation > 10 THEN
        RETURN 'Medium Risk';

    ELSE
        RETURN 'Low Risk';

    END IF;

END;
$$;

-- Run

SELECT fn_crisis_level(3.5,25);

SELECT fn_crisis_level(2.2,12);

SELECT fn_crisis_level(1.4,5);

-- ==========================================================
-- Function 6 — Country Summary (Returns a Table)
-- ==========================================================
CREATE OR REPLACE FUNCTION fn_country_summary(
    p_country CHAR(3)
)
RETURNS TABLE
(
    country_name VARCHAR,
    avg_peace NUMERIC,
    avg_inflation NUMERIC
)
LANGUAGE plpgsql
AS
$$
BEGIN

RETURN QUERY

SELECT

p.country_name,

ROUND(AVG(p.peace_score),3),

ROUND(AVG(i.inflation_rate),2)

FROM peace_index p

JOIN inflation i

ON p.country_code=i.country_code
AND p.year=i.year

WHERE p.country_code=p_country

GROUP BY p.country_name;

END;
$$;

-- Run

SELECT *
FROM fn_country_summary('IND');

-- ==========================================================   
-- Function 7 — Disaster Statistics
-- ==========================================================

CREATE OR REPLACE FUNCTION fn_disaster_statistics(
    p_country CHAR(3)
)
RETURNS TABLE
(
    disasters BIGINT,
    deaths BIGINT,
    affected BIGINT
)
LANGUAGE plpgsql
AS
$$
BEGIN

RETURN QUERY

SELECT

COUNT(*)::BIGINT,

COALESCE(SUM(total_deaths),0)::BIGINT,

COALESCE(SUM(total_affected),0)::BIGINT

FROM disasters

WHERE country_code=p_country;

END;
$$;

-- Run

SELECT *
FROM fn_disaster_statistics('IND');