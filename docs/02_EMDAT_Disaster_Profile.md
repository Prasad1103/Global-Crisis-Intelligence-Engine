# Dataset Profile 02 – EM-DAT International Disaster Database

## Project
Global Crisis Intelligence Engine (GCIE)

---

# 1. Dataset Information

| Attribute | Value |
|-----------|-------|
| Dataset Name | EM-DAT International Disaster Database |
| Source | Centre for Research on the Epidemiology of Disasters (CRED) |
| File Name | emdat_disaster.xlsx |
| File Format | Microsoft Excel (.xlsx) |
| Worksheet Used | EM-DAT Data |
| Total Worksheets | 2 |
| Time Coverage | Multiple years (depends on downloaded data) |
| Total Records | 16,858 |
| Total Columns | 47 |

---

# 2. Dataset Purpose

This dataset contains historical disaster events reported worldwide.

It will be used to:

- Analyze disaster frequency.
- Measure disaster severity.
- Compare disaster trends by country.
- Correlate disasters with migration, peace, inflation, and food prices.
- Build the Global Crisis Risk Index (GCRI).

---

# 3. Worksheets

| Worksheet | Purpose | Status |
|------------|---------|--------|
| EM-DAT Data | Disaster records | Use |
| EM-DAT Info | Documentation | Reference Only |

---

# 4. Dataset Dimensions

| Property | Value |
|----------|-------|
| Rows | 16,858 |
| Columns | 47 |
| Data Records | 16,858 Disaster Events |
| Header Row | First Row |

---

# 5. Important Columns

| Column | Description | Keep |
|---------|-------------|------|
| DisNo. | Disaster ID | ✅ |
| Classification Key | Disaster Classification | ✅ |
| Disaster Group | Natural / Technological | ✅ |
| Disaster Subgroup | Flood, Storm, etc. | ✅ |
| Disaster Type | Main Disaster Type | ✅ |
| Disaster Subtype | Detailed Type | ✅ |
| ISO | ISO3 Country Code | ✅ |
| Country | Country Name | ✅ |
| Region | Geographic Region | ✅ |
| Subregion | Geographic Subregion | ✅ |
| Location | Event Location | ✅ |
| Start Year | Event Start Year | ✅ |
| Start Month | Event Start Month | ✅ |
| Start Day | Event Start Day | ✅ |
| End Year | Event End Year | ✅ |
| Total Deaths | Number of Deaths | ✅ |
| No. Injured | Number Injured | ✅ |
| No. Affected | Population Affected | ✅ |
| No. Homeless | Number Homeless | ✅ |
| Total Affected | Total People Affected | ✅ |
| Total Damage ('000 US$) | Economic Damage | ✅ |
| Latitude | Event Latitude | Optional |
| Longitude | Event Longitude | Optional |
| Entry Date | Record Created | No |
| Last Update | Last Updated | No |

---

# 6. Data Quality Assessment

## Primary Identifier

DisNo.

Status: Excellent

---

## Country Codes

ISO-3 Country Codes available.

Status: Excellent

---

## Geographic Information

Country

Region

Subregion

Location

Status: Excellent

---

## Dates

Separate Year

Month

Day

Status: Good

---

## Numeric Data

Deaths

Affected

Damage

Status: Good

---

# 7. Data Cleaning Requirements

Before importing into SQL:

- Rename columns to snake_case.
- Convert date components into a proper event date where possible.
- Standardize NULL values.
- Convert numeric columns to INTEGER or DECIMAL.
- Remove unused administrative columns.
- Validate ISO country codes.

---

# 8. SQL Table Mapping

Target Table

disasters

Columns

- disaster_id
- disaster_code
- country_code
- country_name
- region
- disaster_group
- disaster_subgroup
- disaster_type
- disaster_subtype
- start_date
- end_date
- total_deaths
- total_injured
- total_affected
- total_homeless
- economic_damage

---

# 9. Keys

Primary Key

disaster_code (DisNo.)

Surrogate Key (Optional)

disaster_id

Foreign Key

country_code

References

countries(country_code)

---

# 10. Relationships

This dataset connects with:

- Countries
- Peace Index
- Inflation
- Food Prices
- Migration
- WDI

Join Field

country_code

---

# 11. Business Questions

The dataset supports analyses such as:

1. Which countries experience the most disasters?
2. Which disaster type is most common?
3. Which disasters cause the highest fatalities?
4. Which countries suffer the greatest economic losses?
5. Which regions are becoming more disaster-prone?
6. How have disasters changed over time?
7. Which disaster type affects the most people?
8. Which countries experience repeated disasters?
9. Does disaster frequency correlate with migration?
10. Does disaster frequency correlate with peace scores?

---

# 12. Dataset Status

| Item | Status |
|------|--------|
| Dataset Reviewed | Completed |
| Data Quality | Excellent |
| Ready for Cleaning | Yes |
| Ready for SQL Design | Yes |

Overall Rating

10/10