# Dataset Profile 04 – WFP Global Food Prices

## Project
Global Crisis Intelligence Engine (GCIE)

---

# 1. Dataset Information

| Attribute | Value |
|-----------|-------|
| Dataset Name | WFP Global Food Prices |
| Source | World Food Programme (WFP) |
| File Name | food_prices.csv |
| File Format | CSV |
| Total Records | 743,914 |
| Total Columns | 18 |
| Country Coverage | 74 Countries |
| Time Coverage | 1992–2017 |

---

# 2. Dataset Purpose

This dataset contains market-level food prices collected by the World Food Programme.

It will be used to:

- Analyze food price trends.
- Compare food prices across countries.
- Measure food affordability.
- Correlate food prices with inflation, disasters, migration, and peace.
- Support the Global Crisis Risk Index (GCRI).

---

# 3. Dataset Structure

Each row represents:

**One commodity, in one market, in one country, during one month and year.**

Example:

Afghanistan → Kabul → Rice → January 2014 → Price

---

# 4. Column Dictionary

| Column | Description | Keep |
|---------|-------------|------|
| adm0_id | Country ID | ❌ |
| adm0_name | Country Name | ✅ |
| adm1_id | Region/State ID | ❌ |
| adm1_name | Region/State Name | ✅ |
| mkt_id | Market ID | ✅ |
| mkt_name | Market Name | ✅ |
| cm_id | Commodity ID | ✅ |
| cm_name | Commodity Name | ✅ |
| cur_id | Currency ID | ❌ |
| cur_name | Currency Name | ✅ |
| pt_id | Price Type ID | ❌ |
| pt_name | Price Type | ✅ |
| um_id | Unit ID | ❌ |
| um_name | Unit of Measure | ✅ |
| mp_month | Month | ✅ |
| mp_year | Year | ✅ |
| mp_price | Market Price | ✅ |
| mp_commoditysource | Data Source | Optional |

---

# 5. Data Quality Assessment

## Country Names

74 countries available.

Status: Excellent

---

## Time Coverage

1992–2017

Status: Good

---

## Market Information

Market-level records available.

Status: Excellent

---

## Commodity Information

Commodity names available.

Status: Excellent

---

## Prices

Numeric values.

Status: Excellent

---

# 6. Data Cleaning Requirements

Before importing into SQL:

- Rename all columns using snake_case.
- Standardize country names.
- Create a proper date field using:
  - mp_year
  - mp_month
- Convert prices to DECIMAL.
- Remove duplicate records if any.
- Validate missing prices.
- Keep one record per commodity-market-month.

---

# 7. SQL Table Mapping

Target Table

food_prices

Columns

- food_price_id
- country_name
- region_name
- market_id
- market_name
- commodity_id
- commodity_name
- currency_name
- price_type
- unit
- month
- year
- price

---

# 8. Keys

Primary Key

food_price_id (Surrogate Key)

Business Key

(country_name, market_id, commodity_id, month, year)

Foreign Key

country_code (will be added by mapping country names to ISO3 codes)

---

# 9. Relationships

This dataset joins with:

- Countries
- Inflation
- Peace Index
- Disaster Events
- Migration
- World Development Indicators

Common Join Field

country_code

---

# 10. Business Questions

1. Which countries have the highest food prices?
2. Which commodities are most expensive?
3. How do food prices change over time?
4. Which markets have the highest prices?
5. Which countries experienced rapid food inflation?
6. Compare food prices with disasters.
7. Compare food prices with migration.
8. Compare food prices with peace scores.
9. Compare food prices with inflation.
10. Identify seasonal price patterns.

---

# 11. Dataset Status

| Item | Status |
|------|--------|
| Dataset Reviewed | Completed |
| Data Quality | Excellent |
| Ready for Cleaning | Yes |
| Ready for SQL Design | Yes |

Overall Rating

9.7/10