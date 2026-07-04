# Table Definitions

## Project

**Global Crisis Intelligence Engine**

---

# Overview

This document provides detailed information about each table used in the Global Crisis Intelligence Engine project.

The PostgreSQL database consists of five analytical tables designed to support global crisis analysis through SQL.

---

# 1. peace_index

## Purpose

Stores the Global Peace Index score for each country by year.

### Table Structure

| Column | Data Type | Description |
|---------|-----------|-------------|
| country_code | VARCHAR(3) | ISO 3166-1 alpha-3 country code |
| country_name | VARCHAR(100) | Country name |
| year | INTEGER | Observation year |
| peace_score | NUMERIC(5,3) | Global Peace Index score |

### Primary Key

No physical primary key.

Logical Key:

```
country_code + year
```

### Business Use

- Identify least peaceful countries
- Analyze peace trends over time
- Compare peace scores with inflation and disasters

---

# 2. inflation

## Purpose

Stores yearly inflation rates for countries.

### Table Structure

| Column | Data Type | Description |
|---------|-----------|-------------|
| country_code | VARCHAR(3) | ISO country code |
| country_name | VARCHAR(100) | Country name |
| year | INTEGER | Observation year |
| inflation_rate | NUMERIC(10,2) | Annual inflation rate (%) |

### Logical Key

```
country_code + year
```

### Business Use

- Inflation trend analysis
- Economic comparisons
- Correlation with food prices

---

# 3. disasters

## Purpose

Contains historical disaster events and their impacts.

### Table Structure

| Column | Data Type | Description |
|---------|-----------|-------------|
| disaster_code | VARCHAR | Disaster identifier |
| country_code | VARCHAR(3) | ISO country code |
| country_name | VARCHAR(100) | Country name |
| region | VARCHAR(100) | Region |
| subregion | VARCHAR(100) | Subregion |
| disaster_group | VARCHAR(100) | Disaster group |
| disaster_subgroup | VARCHAR(100) | Disaster subgroup |
| disaster_type | VARCHAR(100) | Disaster type |
| disaster_subtype | VARCHAR(100) | Disaster subtype |
| start_year | INTEGER | Disaster start year |
| start_month | INTEGER | Start month |
| start_day | INTEGER | Start day |
| end_year | INTEGER | End year |
| total_deaths | BIGINT | Number of deaths |
| total_affected | BIGINT | Number of affected people |
| economic_damage_usd | NUMERIC | Estimated economic loss |

### Primary Key

```
disaster_code
```

### Business Use

- Disaster trend analysis
- Human impact analysis
- Economic damage reporting
- Country risk assessment

---

# 4. food_prices

## Purpose

Stores commodity prices collected from markets across different countries.

### Table Structure

| Column | Data Type | Description |
|---------|-----------|-------------|
| country_name | VARCHAR(100) | Country name |
| region_name | VARCHAR(100) | Region or province |
| market_id | INTEGER | Market identifier |
| market_name | VARCHAR(100) | Market name |
| commodity_id | INTEGER | Commodity identifier |
| commodity_name | VARCHAR(100) | Commodity name |
| currency | VARCHAR(20) | Currency code |
| price_type | VARCHAR(50) | Retail or Wholesale |
| unit | VARCHAR(50) | Unit of measurement |
| month | INTEGER | Observation month |
| year | INTEGER | Observation year |
| price | NUMERIC(10,2) | Commodity price |
| price_date | DATE | Price observation date |

### Logical Key

```
country_name + market_id + commodity_id + price_date
```

### Business Use

- Food inflation analysis
- Commodity price comparison
- Regional market analysis

---

# 5. world_indicators

## Purpose

Stores selected World Bank development indicators.

### Table Structure

| Column | Data Type | Description |
|---------|-----------|-------------|
| country_code | VARCHAR(3) | ISO country code |
| country_name | VARCHAR(100) | Country name |
| indicator_code | VARCHAR(50) | Indicator code |
| indicator_name | VARCHAR(255) | Indicator name |
| business_indicator | VARCHAR(100) | Business category |
| year | INTEGER | Observation year |
| indicator_value | NUMERIC | Indicator value |

### Logical Key

```
country_code + indicator_code + year
```

### Business Use

- Economic analysis
- Development analysis
- Cross-country comparison
- Correlation with peace and inflation

---

# Table Relationships

| Parent Table | Child Table | Join Condition |
|--------------|-------------|----------------|
| peace_index | inflation | country_code + year |
| peace_index | disasters | country_code + start_year |
| peace_index | world_indicators | country_code + year |
| inflation | food_prices | country_name + year |

---

# Database Summary

| Metric | Value |
|--------|-------|
| Database | PostgreSQL |
| Tables | 5 |
| SQL Files | 17 |
| Documentation Files | 9 |
| Database Type | Analytical |
| Design Model | Logical Relational |

---

# Summary

The database is designed to support analytical workloads rather than transactional processing.

Each table represents a distinct domain of global crisis data while logical relationships allow powerful cross-dataset analysis using SQL joins.