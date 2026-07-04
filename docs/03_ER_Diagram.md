# Entity Relationship (ER) Diagram

## Project

**Global Crisis Intelligence Engine**

---

# Overview

The Entity Relationship (ER) Diagram illustrates the logical structure of the PostgreSQL database used in the Global Crisis Intelligence Engine project.

The database integrates five independent global datasets into a unified analytical model, enabling cross-dataset analysis using SQL.

Unlike transactional databases, this project uses **logical relationships** instead of enforced foreign key constraints because the datasets originate from different international organizations and have varying levels of granularity.

---

# ER Diagram

<p align="center">

<img src="../screenshots/ER_Diagram.png" width="950">

</p>

---

# Database Entities

The database contains five analytical tables.

| Table | Description |
|---------|-------------|
| **peace_index** | Stores yearly Global Peace Index scores for each country. |
| **inflation** | Contains annual inflation rates by country. |
| **disasters** | Records historical disaster events, deaths, affected population, and economic losses. |
| **food_prices** | Stores commodity prices across global markets and regions. |
| **world_indicators** | Contains World Bank development indicators for countries over time. |

---

# Logical Relationships

The project uses common business keys to combine datasets during SQL analysis.

| Relationship | Join Keys |
|--------------|-----------|
| Peace Index ↔ Inflation | `country_code`, `year` |
| Peace Index ↔ Disasters | `country_code`, `year = start_year` |
| Peace Index ↔ World Indicators | `country_code`, `year` |
| Inflation ↔ Food Prices | `country_name`, `year` |

---

# Database Design Approach

This project follows a **logical analytical data model**.

Rather than enforcing foreign key constraints, relationships are established dynamically using SQL `JOIN` operations. This design provides flexibility when integrating datasets collected from multiple international sources.

Advantages include:

- Flexible analytical queries
- Simplified integration of heterogeneous datasets
- Reduced dependency on strict relational constraints
- Better support for exploratory data analysis
- Easier scalability for future datasets

---

# Entity Descriptions

### peace_index

Provides yearly peace scores for countries and serves as the central analytical table for the project.

---

### inflation

Stores annual inflation rates used for economic trend analysis and comparison with peace metrics.

---

### disasters

Captures disaster events along with their human and economic impacts, enabling disaster trend and risk analysis.

---

### food_prices

Contains market-level commodity prices used to analyze regional food price fluctuations and compare them with inflation trends.

---

### world_indicators

Includes selected World Bank indicators such as economic, demographic, and development metrics for cross-domain analysis.

---

# Analytical Model

The overall analytical workflow is illustrated below.

```text
Raw Datasets
        │
        ▼
Python ETL Pipeline
        │
        ▼
Cleaned CSV Files
        │
        ▼
PostgreSQL Database
        │
        ▼
Logical Relationships
        │
        ▼
Advanced SQL Analysis
        │
        ▼
Business Reports
```

---

# Summary

The ER Diagram provides a high-level representation of the analytical database used in this project.

The logical design enables efficient integration of multiple global datasets through common business keys, supporting advanced SQL analysis, cross-dataset insights, and executive business reporting.