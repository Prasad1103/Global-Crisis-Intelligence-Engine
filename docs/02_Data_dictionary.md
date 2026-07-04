# Data Dictionary

## Project

**Global Crisis Intelligence Engine**

---

# Overview

This document describes the structure of the datasets used in the Global Crisis Intelligence Engine project.

The data dictionary provides the column name, data type, and business description for each table.

---

# Table: peace_index

| Column | Data Type | Description |
|---------|-----------|-------------|
| country_code | VARCHAR | ISO 3-letter country code |
| country_name | VARCHAR | Name of the country |
| year | INTEGER | Observation year |
| peace_score | NUMERIC | Global Peace Index score (Lower = More Peaceful) |

---

# Table: inflation

| Column | Data Type | Description |
|---------|-----------|-------------|
| country_code | VARCHAR | ISO 3-letter country code |
| country_name | VARCHAR | Country name |
| year | INTEGER | Observation year |
| inflation_rate | NUMERIC | Annual inflation rate (%) |

---

# Table: disasters

| Column | Data Type | Description |
|---------|-----------|-------------|
| disaster_code | VARCHAR | Unique disaster identifier |
| country_code | VARCHAR | ISO 3-letter country code |
| country_name | VARCHAR | Country affected |
| region | VARCHAR | Geographic region |
| subregion | VARCHAR | Geographic subregion |
| disaster_group | VARCHAR | Disaster category (Natural, Technological, etc.) |
| disaster_subgroup | VARCHAR | Disaster subgroup |
| disaster_type | VARCHAR | Disaster type (Flood, Earthquake, Storm, etc.) |
| disaster_subtype | VARCHAR | Detailed disaster classification |
| start_year | INTEGER | Disaster start year |
| start_month | INTEGER | Disaster start month |
| start_day | INTEGER | Disaster start day |
| end_year | INTEGER | Disaster end year |
| total_deaths | BIGINT | Total reported deaths |
| total_affected | BIGINT | Total people affected |
| economic_damage_usd | NUMERIC | Estimated economic damage in USD |

---

# Table: food_prices

| Column | Data Type | Description |
|---------|-----------|-------------|
| adm0_id | INTEGER | Country ID |
| adm0_name | VARCHAR | Country name |
| adm1_id | INTEGER | Region/State ID |
| adm1_name | VARCHAR | Region/State name |
| mkt_id | INTEGER | Market ID |
| mkt_name | VARCHAR | Market name |
| cm_id | INTEGER | Commodity ID |
| cm_name | VARCHAR | Commodity name |
| cur_id | INTEGER | Currency ID |
| cur_name | VARCHAR | Currency name |
| pt_id | INTEGER | Price type ID |
| pt_name | VARCHAR | Price type (Retail/Wholesale) |
| um_id | INTEGER | Unit of measure ID |
| um_name | VARCHAR | Unit of measure |
| mp_month | INTEGER | Observation month |
| mp_year | INTEGER | Observation year |
| mp_price | NUMERIC | Commodity price |
| mp_commoditysource | VARCHAR | Data source |

---

# Table: world_indicators

| Column | Data Type | Description |
|---------|-----------|-------------|
| country_code | VARCHAR | ISO 3-letter country code |
| country_name | VARCHAR | Country name |
| indicator_code | VARCHAR | World Bank indicator code |
| indicator_name | VARCHAR | Indicator name |
| business_indicator | VARCHAR | Business category assigned during data cleaning |
| year | INTEGER | Observation year |
| indicator_value | NUMERIC | Indicator value |

---

# Common Join Keys

The following columns are used to combine multiple datasets:

| Column | Used In |
|---------|----------|
| country_code | Peace Index, Inflation, Disasters, World Indicators |
| country_name | Peace Index, Inflation, Food Prices |
| year | Peace Index, Inflation, Food Prices, World Indicators |
| start_year | Disasters |

---

# Important Business Metrics

## Peace Score

- Lower value = More peaceful country
- Higher value = Less peaceful country

---

## Inflation Rate

Measured as annual percentage inflation.

---

## Economic Damage

Represents the estimated financial loss caused by disasters.

---

## Food Price

Average commodity market price.

---

## Indicator Value

Represents the numerical value of a World Development Indicator.

Examples include:

- GDP
- Population
- CO₂ Emissions
- Life Expectancy
- Unemployment
- Literacy Rate

---

# Data Sources

| Dataset | Source |
|----------|---------|
| Peace Index | Institute for Economics & Peace |
| Inflation | World Bank / IMF |
| Disasters | EM-DAT International Disaster Database |
| Food Prices | World Food Programme (WFP) |
| World Development Indicators | World Bank |

---

# Summary

The data dictionary serves as a reference for understanding the structure, meaning, and business context of the datasets used throughout the project.

It helps analysts, developers, and reviewers quickly understand how the data is organized and how different tables relate to each other.