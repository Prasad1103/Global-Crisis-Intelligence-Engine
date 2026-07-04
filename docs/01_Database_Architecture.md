# Database Architecture

## Project

**Global Crisis Intelligence Engine**

---

# Overview

The Global Crisis Intelligence Engine is a PostgreSQL-based analytical database designed to integrate multiple global datasets into a centralized relational database.

The database enables analysis of worldwide crises by combining information related to peace, inflation, natural disasters, food prices, and world development indicators.

The architecture supports efficient querying, cross-dataset analysis, and business reporting.

---

# Database Architecture

```
                    +----------------------+
                    |   Peace Index        |
                    +----------------------+
                    | country_code         |
                    | country_name         |
                    | year                 |
                    | peace_score          |
                    +----------+-----------+
                               |
                               |
                 country_code + year
                               |
        -------------------------------------------------
        |                       |                       |
        |                       |                       |
        ▼                       ▼                       ▼

+----------------+    +----------------+     +----------------------+
| Inflation      |    | Disasters      |     | World Indicators     |
+----------------+    +----------------+     +----------------------+
| country_code   |    | country_code   |     | country_code         |
| country_name   |    | country_name   |     | country_name         |
| year           |    | start_year     |     | indicator_code       |
| inflation_rate |    | disaster_type  |     | indicator_name       |
+----------------+    | total_deaths   |     | year                 |
                      | damage         |     | indicator_value      |
                      +----------------+     +----------------------+

                               |

                               |

                        country_name + year

                               |

                               ▼

                   +-------------------------+
                   |      Food Prices        |
                   +-------------------------+
                   | adm0_name              |
                   | commodity              |
                   | market                 |
                   | year                   |
                   | price                  |
                   +-------------------------+
```

---

# Database Design

The project follows a relational database design where each dataset is stored in an individual table.

The tables are connected logically using:

- Country Code
- Country Name
- Year

This design minimizes redundancy while allowing complex analytical queries through SQL JOIN operations.

---

# Tables

The database consists of five primary tables.

## 1. Peace Index

Stores yearly Global Peace Index scores.

Primary analytical columns include:

- country_code
- country_name
- year
- peace_score

---

## 2. Inflation

Stores annual inflation rates for countries.

Primary analytical columns include:

- country_code
- country_name
- year
- inflation_rate

---

## 3. Disasters

Contains historical natural disaster events.

Primary analytical columns include:

- disaster_type
- disaster_group
- total_deaths
- total_affected
- economic_damage_usd

---

## 4. Food Prices

Contains market-level commodity prices.

Primary analytical columns include:

- country
- market
- commodity
- price
- month
- year

---

## 5. World Development Indicators

Contains hundreds of development indicators collected by the World Bank.

Primary analytical columns include:

- indicator_code
- indicator_name
- indicator_value
- business_indicator
- year

---

# Relationships

The project does not enforce foreign key constraints because the datasets originate from different international organizations.

Instead, logical relationships are created during analysis using SQL JOINs.

Common join keys include:

- country_code
- country_name
- year

---

# Data Flow

```
Raw CSV Files
        │
        ▼
Python Cleaning Scripts
        │
        ▼
Cleaned CSV Files
        │
        ▼
PostgreSQL Database
        │
        ▼
SQL Analysis
        │
        ▼
Business Reports
```

---

# Database Features

The database includes:

- Relational schema
- Indexed columns
- SQL Views
- User-defined Functions
- Common Table Expressions (CTEs)
- Window Functions
- Cross-dataset analysis

---

# Benefits of the Architecture

The database architecture provides:

- Efficient storage of multiple datasets
- Easy integration of global indicators
- High-performance analytical queries
- Reusable SQL views and functions
- Support for business reporting
- Scalable design for future datasets

---

# Summary

The Global Crisis Intelligence Engine database was designed to support advanced analytical workloads using PostgreSQL.

The architecture enables seamless integration of multiple global datasets while maintaining flexibility, scalability, and query performance.