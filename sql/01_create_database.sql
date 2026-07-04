-- ============================================================
-- PROJECT : Global Crisis Intelligence Engine
-- FILE    : 01_create_database.sql
-- AUTHOR  : Prasad Chaudhari
-- PURPOSE : Create the project database
-- ============================================================

-- ============================================================
-- STEP 1 : Create Database
-- ============================================================

CREATE DATABASE global_crisis_intelligence
WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- ============================================================
-- STEP 2 : Connect to the database
-- ============================================================
-- In pgAdmin:
-- Open the newly created database and then open Query Tool.
--
-- In psql:
-- \c global_crisis_intelligence

-- ============================================================
-- STEP 3 : Verify Database
-- ============================================================

SELECT current_database();

SELECT version();