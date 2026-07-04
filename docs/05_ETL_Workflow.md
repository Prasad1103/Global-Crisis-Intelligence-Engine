# ETL Workflow

## Project

**Global Crisis Intelligence Engine**

---

# Overview

The Global Crisis Intelligence Engine follows a structured **ETL (Extract, Transform, Load)** workflow to convert raw global datasets into a clean, analysis-ready PostgreSQL database.

The ETL pipeline ensures that the data is consistent, accurate, and optimized for analytical SQL queries.

---

# ETL Architecture

```text
                   +----------------------+
                   |    Raw Datasets      |
                   +----------------------+
                              |
                              |
                              ▼
                   +----------------------+
                   |  Python ETL Scripts   |
                   | (Data Cleaning)       |
                   +----------------------+
                              |
                              |
                              ▼
                   +----------------------+
                   |   Clean CSV Files     |
                   +----------------------+
                              |
                              |
                              ▼
                   +----------------------+
                   | PostgreSQL Database   |
                   +----------------------+
                              |
                              |
                              ▼
                   +----------------------+
                   | Advanced SQL Analysis |
                   +----------------------+
                              |
                              |
                              ▼
                   +----------------------+
                   | Business Reports      |
                   +----------------------+
```

---

# ETL Process

The project follows the standard ETL methodology.

## Step 1 — Extract

### Objective

Collect raw datasets from publicly available global data sources.

### Data Sources

| Dataset | Source |
|----------|--------|
| Peace Index | Institute for Economics & Peace |
| Inflation | World Bank / IMF |
| Disasters | EM-DAT International Disaster Database |
| Food Prices | World Food Programme (WFP) |
| World Indicators | World Bank |

### Raw Data Location

```text
datasets/raw/
```

---

# Step 2 — Transform

### Objective

Clean, standardize, and prepare the data for loading into PostgreSQL.

### Cleaning Activities

- Removed unnecessary columns
- Renamed columns using consistent naming conventions
- Standardized country names
- Standardized country codes
- Converted date fields
- Converted numeric columns
- Removed duplicate records
- Handled missing values
- Improved data consistency

### Python Cleaning Scripts

```text
scripts/

01_clean_peace_index.py

02_clean_inflation.py

03_clean_disasters.py

04_clean_food_prices.py

05_clean_wdi.py
```

---

# Step 3 — Load

### Objective

Load cleaned CSV files into PostgreSQL.

### Clean Dataset Location

```text
datasets/cleaned/
```

### Loaded Tables

| CSV File | PostgreSQL Table |
|-----------|------------------|
| peace_index.csv | peace_index |
| inflation.csv | inflation |
| disasters.csv | disasters |
| food_prices.csv | food_prices |
| world_indicators.csv | world_indicators |

### Import Method

Data was imported using PostgreSQL Import/Export Wizard (`\copy`) after defining the database schema.

---

# Data Validation

After loading the data, SQL queries were executed to validate the import process.

Validation checks included:

- Record counts
- NULL value checks
- Duplicate checks
- Data type verification
- Date validation
- Aggregate verification

Example:

```sql
SELECT COUNT(*)
FROM peace_index;
```

---

# SQL Analysis Layer

Once the data was loaded, advanced SQL analysis was performed.

The project includes:

- Aggregate Queries
- Joins
- Subqueries
- Window Functions
- Common Table Expressions (CTEs)
- Views
- User-defined Functions
- Query Optimization
- Business Reports

---

# Workflow Summary

```text
Raw CSV Files
        │
        ▼
Extract
        │
        ▼
Python Cleaning Scripts
        │
        ▼
Transform
        │
        ▼
Clean CSV Files
        │
        ▼
Load into PostgreSQL
        │
        ▼
SQL Analysis
        │
        ▼
Business Insights
```

---

# ETL Benefits

The ETL process provides several advantages:

- Improved data quality
- Consistent column naming
- Standardized data types
- Reduced duplicate records
- Better SQL query performance
- Easier integration across datasets

---

# Technologies Used

| Technology | Purpose |
|------------|---------|
| Python | Data Cleaning & Transformation |
| Pandas | Data Processing |
| PostgreSQL | Data Storage |
| SQL | Data Analysis |
| VS Code | Development |
| pgAdmin | Database Management |

---

# Summary

The ETL pipeline converts multiple raw datasets into a clean and structured PostgreSQL database.

This process ensures high-quality data for advanced SQL analysis and enables meaningful business insights across global peace, inflation, disasters, food prices, and development indicators.