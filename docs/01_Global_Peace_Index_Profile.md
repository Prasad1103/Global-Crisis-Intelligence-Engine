# Dataset Profile 01 – Global Peace Index (GPI)

## Project
Global Crisis Intelligence Engine (GCIE)

---

# 1. Dataset Information

| Attribute | Value |
|-----------|-------|
| Dataset Name | Global Peace Index (GPI) |
| Source | Institute for Economics & Peace (IEP) |
| File Name | global_peace_index.xlsx |
| File Format | Microsoft Excel (.xlsx) |
| Version | 2023 Overall Scores |
| Time Coverage | 2008–2023 |
| Number of Worksheets | 5 |
| Main Worksheet | Overall Scores |

---

# 2. Dataset Purpose

The Global Peace Index measures the level of peace and stability for countries worldwide.

This dataset will be used to:

- Analyze peace trends over time.
- Compare countries based on peace scores.
- Integrate peace scores with disaster, inflation, migration, and food price datasets.
- Contribute to the Global Crisis Risk Index (GCRI).

---

# 3. Dataset Structure

## Worksheets

| Worksheet | Purpose | Status |
|------------|---------|--------|
| Overview | Documentation | Ignore |
| Overall Scores | Overall peace scores | Use |
| Safety and Security | Peace sub-index | Future Version |
| Militarisation | Peace sub-index | Future Version |
| Ongoing Conflict | Peace sub-index | Future Version |

---

# 4. Data Dimensions

| Property | Value |
|----------|-------|
| Total Rows | 167 |
| Total Columns | 26 |
| Actual Header Row | Row 4 |
| Data Starts | Row 5 |
| Country Records | Approximately 163 |
| Empty Columns | 8 (after 2023) |

---

# 5. Column Dictionary

| Column | Description | Data Type | Keep |
|---------|-------------|-----------|------|
| Country | Country Name | Text | Yes |
| iso3c | ISO 3166-1 Alpha-3 Country Code | Text | Yes |
| 2008 | Peace Score | Decimal | Yes |
| 2009 | Peace Score | Decimal | Yes |
| 2010 | Peace Score | Decimal | Yes |
| 2011 | Peace Score | Decimal | Yes |
| 2012 | Peace Score | Decimal | Yes |
| 2013 | Peace Score | Decimal | Yes |
| 2014 | Peace Score | Decimal | Yes |
| 2015 | Peace Score | Decimal | Yes |
| 2016 | Peace Score | Decimal | Yes |
| 2017 | Peace Score | Decimal | Yes |
| 2018 | Peace Score | Decimal | Yes |
| 2019 | Peace Score | Decimal | Yes |
| 2020 | Peace Score | Decimal | Yes |
| 2021 | Peace Score | Decimal | Yes |
| 2022 | Peace Score | Decimal | Yes |
| 2023 | Peace Score | Decimal | Yes |
| Blank Columns | Empty | Null | No |

---

# 6. Data Quality Assessment

## Header Quality

- First three rows are not data.
- Actual headers begin at Row 4.

Status: Good

---

## Missing Values

No significant missing values observed in the main columns.

Status: Good

---

## Duplicate Records

No duplicate country records observed.

Status: Good

---

## Country Codes

ISO-3 country codes are available.

Status: Excellent

---

## Data Types

Country : Text

ISO3 Code : Text

Peace Scores : Decimal

Status: Excellent

---

# 7. Data Cleaning Requirements

The following transformations will be required before loading into SQL.

- Skip the first three rows.
- Remove the eight empty columns after the 2023 column.
- Rename `Country` to `country_name`.
- Rename `iso3c` to `country_code`.
- Convert the dataset from wide format to long format.
- Standardize column names to snake_case.
- Validate numeric values.

---

# 8. Normalization Strategy

Current Structure

Country | 2008 | 2009 | 2010 | ... | 2023

Target Structure

country_code | country_name | year | peace_score

One row will represent one country in one year.

---

# 9. SQL Table Mapping

Target Table Name

peace_index

Columns

- peace_id
- country_code
- country_name
- year
- peace_score

---

# 10. Keys

Primary Key

peace_id (Surrogate Key)

Business Key

(country_code, year)

Foreign Key

country_code

References

countries(country_code)

---

# 11. Relationships

This dataset will join with:

- Countries
- World Development Indicators
- Inflation
- Disaster Events
- Food Prices
- Migration

Common Join Field

country_code

---

# 12. Business Questions

This dataset can answer:

1. Which countries are the most peaceful?
2. Which countries are the least peaceful?
3. How has peace changed over time?
4. Which countries improved the most?
5. Which countries declined the most?
6. What is the average global peace score each year?
7. Does peace correlate with migration?
8. Does peace correlate with disasters?
9. Does peace correlate with inflation?
10. Does peace correlate with food prices?

---

# 13. Dataset Status

| Item | Status |
|------|--------|
| Dataset Reviewed | Completed |
| Data Quality | Excellent |
| Ready for Cleaning | Yes |
| Ready for SQL Design | Yes |

Overall Rating

10/10