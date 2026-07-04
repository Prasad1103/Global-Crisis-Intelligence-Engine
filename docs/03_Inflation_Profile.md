# Dataset Profile 03 – Global Inflation Database

## Project
Global Crisis Intelligence Engine (GCIE)

---

# 1. Dataset Information

| Attribute | Value |
|-----------|-------|
| Dataset Name | Global Inflation Database |
| Source | World Bank |
| File Name | Inflation-data.xlsx |
| File Format | Microsoft Excel (.xlsx) |
| Total Worksheets | 20 |
| Main Worksheet (Version 1) | hcpi_a |
| Data Frequency | Annual |
| Country Coverage | ~190+ Countries |
| Time Coverage | 1970–Latest Available Year |

---

# 2. Dataset Purpose

This dataset provides historical inflation rates for countries around the world.

It will be used to:

- Analyze inflation trends.
- Compare inflation across countries.
- Measure economic instability.
- Correlate inflation with disasters, migration, food prices, and peace.
- Contribute to the Global Crisis Risk Index (GCRI).

---

# 3. Worksheets

| Worksheet | Meaning | Use |
|------------|---------|-----|
| Intro | Documentation | Ignore |
| top | Navigation | Ignore |
| hcpi_m | Headline CPI (Monthly) | Future Version |
| hcpi_q | Headline CPI (Quarterly) | Future Version |
| hcpi_a | Headline CPI (Annual) | ✅ Use |
| ecpi_m | Energy CPI (Monthly) | Future Version |
| ecpi_q | Energy CPI (Quarterly) | Future Version |
| ecpi_a | Energy CPI (Annual) | Optional |
| fcpi_m | Food CPI (Monthly) | Future Version |
| fcpi_q | Food CPI (Quarterly) | Future Version |
| fcpi_a | Food CPI (Annual) | Optional |
| ccpi_m | Core CPI (Monthly) | Future Version |
| ccpi_q | Core CPI (Quarterly) | Future Version |
| ccpi_a | Core CPI (Annual) | Optional |
| ppi_m | Producer Price Index | Future Version |
| ppi_q | Producer Price Index | Future Version |
| ppi_a | Producer Price Index | Optional |
| def_q | GDP Deflator (Quarterly) | Ignore |
| def_a | GDP Deflator (Annual) | Ignore |
| Aggregate | Regional Aggregates | Ignore |

**Version 1.0 Recommendation:** Use only **`hcpi_a`** (Headline Consumer Price Inflation – Annual).

---

# 4. Dataset Dimensions

| Property | Value |
|----------|-------|
| Rows | ~200+ Countries |
| Columns | 217 |
| Header Row | First Row |
| Time Span | 1970 onwards |

---

# 5. Important Columns

| Column | Description | Keep |
|---------|-------------|------|
| Country Code | ISO3 Country Code | ✅ |
| IMF Country Code | IMF Identifier | ❌ |
| Country | Country Name | ✅ |
| Indicator Type | Inflation | ❌ (constant value) |
| Series Name | Headline Consumer Price Inflation | ❌ (constant value) |
| 1970–Latest Year | Annual Inflation (%) | ✅ |

---

# 6. Data Quality Assessment

## Country Codes

ISO-3 country codes are available.

Status: Excellent

---

## Country Names

Standardized country names.

Status: Excellent

---

## Time Series

One column per year (1970–latest).

Status: Good

---

## Missing Values

Some countries have missing values for early years.

Status: Acceptable

---

## Duplicate Records

No duplicate country records observed.

Status: Good

---

# 7. Data Cleaning Requirements

Before importing into SQL:

- Rename `Country Code` → `country_code`
- Rename `Country` → `country_name`
- Remove `IMF Country Code`
- Remove `Indicator Type`
- Remove `Series Name`
- Convert from **wide format** to **long format**
- Keep annual inflation values only
- Store one record per country-year

---

# 8. Normalization Strategy

Current Structure

Country | 1970 | 1971 | 1972 | ...

Target Structure

country_code | country_name | year | inflation_rate

Example

AFG | Afghanistan | 1970 | 25.51

AFG | Afghanistan | 1971 | 25.51

AFG | Afghanistan | 1972 | -12.52

---

# 9. SQL Table Mapping

Target Table

inflation

Columns

- inflation_id
- country_code
- country_name
- year
- inflation_rate

---

# 10. Keys

Primary Key

inflation_id (Surrogate Key)

Business Key

(country_code, year)

Foreign Key

country_code

References

countries(country_code)

---

# 11. Relationships

This dataset joins with:

- Countries
- Peace Index
- Disaster Events
- Food Prices
- Migration
- WDI

Join Field

country_code

---

# 12. Business Questions

1. Which countries have the highest inflation?
2. Which countries have experienced hyperinflation?
3. Average inflation by region.
4. Inflation trend over time.
5. Compare inflation with disaster frequency.
6. Compare inflation with food prices.
7. Compare inflation with migration.
8. Compare inflation with peace scores.
9. Countries with stable inflation.
10. Countries with volatile inflation.

---

# 13. Dataset Status

| Item | Status |
|------|--------|
| Dataset Reviewed | Completed |
| Data Quality | Excellent |
| Ready for Cleaning | Yes |
| Ready for SQL Design | Yes |

Overall Rating

9.8/10  