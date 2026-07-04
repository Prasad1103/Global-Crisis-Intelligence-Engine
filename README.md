<div align="center">

# 🌍 Global Crisis Intelligence Engine

### End-to-End PostgreSQL Analytics Project for Global Crisis Analysis

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-blue?style=for-the-badge&logo=postgresql)
![Python](https://img.shields.io/badge/Python-3.x-yellow?style=for-the-badge&logo=python)
![SQL](https://img.shields.io/badge/SQL-Advanced-success?style=for-the-badge)
![ETL](https://img.shields.io/badge/ETL-Pipeline-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

**Designed and Developed by Prasad Chaudhari**

</div>

---

# 📌 Project Overview

The **Global Crisis Intelligence Engine** is an end-to-end PostgreSQL analytics project designed to integrate multiple global datasets into a centralized relational database for crisis intelligence and analytical reporting.

The project demonstrates the complete data analytics lifecycle—from cleaning raw datasets with Python to designing a PostgreSQL database, performing advanced SQL analysis, optimizing query performance, and generating executive-level business reports.

Instead of analyzing a single dataset, this project combines multiple domains including peace, inflation, natural disasters, food prices, and world development indicators to uncover relationships between economic, humanitarian, and geopolitical factors.

The project emphasizes practical SQL skills used in real-world analytics environments, including database design, ETL workflows, indexing, views, user-defined functions, Common Table Expressions (CTEs), window functions, and cross-dataset analysis.

---

# 🎯 Project Objectives

The primary objectives of this project are:

- Design a scalable PostgreSQL relational database.
- Clean and transform raw datasets using Python.
- Build a structured ETL pipeline.
- Perform advanced SQL analysis across multiple datasets.
- Answer real-world business questions using SQL.
- Optimize query performance using indexes.
- Create reusable SQL views and functions.
- Apply Common Table Expressions (CTEs) and Window Functions.
- Produce executive-level analytical reports.
- Build a professional SQL portfolio project.

---

# 🚀 Key Features

### Database Design

- PostgreSQL Relational Database
- Normalized Table Structure
- Logical Relationships
- Optimized Schema

### ETL Pipeline

- Raw Data Collection
- Data Cleaning using Python
- Data Validation
- CSV Standardization
- PostgreSQL Data Loading

### SQL Analytics

- Aggregate Analysis
- Multi-table JOINs
- Cross Dataset Analysis
- Window Functions
- Common Table Expressions (CTEs)
- SQL Views
- User Defined Functions
- Performance Optimization
- Business Reports

### Documentation

- Database Architecture
- Data Dictionary
- ER Diagram
- Project Workflow
- Business Questions
- SQL Optimization Guide
- Project Results

---

# 🛠️ Technology Stack

| Category | Technology |
|----------|------------|
| Database | PostgreSQL 17 |
| Programming Language | Python |
| Data Processing | Pandas |
| Query Language | SQL |
| IDE | Visual Studio Code |
| Database Tool | pgAdmin 4 |
| Version Control | Git & GitHub |

---

# 📂 Project Structure

```text
GLOBAL-CRISIS-INTELLIGENCE-ENGINE/

│
├── datasets/
│   │
│   ├── raw/
│   ├── cleaned/
│   └── metadata/
│
├── docs/
│
├── screenshots/
│
├── scripts/
│   ├── 01_clean_peace_index.py
│   ├── 02_clean_inflation.py
│   ├── 03_clean_disasters.py
│   ├── 04_clean_food_prices.py
│   ├── 05_clean_wdi.py
│   └── 05a_extract_indicator_list.py
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_import_data.sql
│   ├── 04_peace_analysis.sql
│   ├── 05_inflation_analysis.sql
│   ├── 06_disaster_analysis.sql
│   ├── 07_food_price_analysis.sql
│   ├── 08_world_indicators_analysis.sql
│   ├── 09_cross_dataset_analysis.sql
│   ├── 10_window_functions.sql
│   ├── 11_views.sql
│   ├── 12_dashboard_queries.sql
│   ├── 13_indexes.sql
│   ├── 13_query_performance.sql
│   ├── 14_functions.sql
│   ├── 15_business_reports.sql
│   ├── 16_cte_analysis.sql
│   └── 17_master_analysis.sql
│
├── .gitignore
├── ER Diagram.png
├── PLAN.md
└── README.md
```

---

# 📊 Datasets Used

The project integrates five independent datasets to perform cross-domain crisis analysis.

| Dataset | Description |
|----------|-------------|
| Peace Index | Annual Global Peace Index scores for countries |
| Inflation | Country-level annual inflation rates |
| Natural Disasters | Disaster events, deaths, affected population, and economic damage |
| Food Prices | Commodity prices across countries and regional markets |
| World Development Indicators | Socio-economic indicators published by the World Bank |

---

# 📁 Dataset Details

## 1. Peace Index

This dataset measures the level of peacefulness across countries over multiple years.

### Important Columns

- country_code
- country_name
- year
- peace_score

---

## 2. Inflation

Contains annual inflation rates for countries.

### Important Columns

- country_code
- country_name
- year
- inflation_rate

---

## 3. Natural Disasters

Contains disaster history and humanitarian impact.

### Important Columns

- disaster_code
- country_code
- country_name
- disaster_type
- disaster_group
- total_deaths
- total_affected
- economic_damage_usd

---

## 4. Food Prices

This dataset contains commodity prices collected from markets across different countries.

### Important Columns

- country_name
- region_name
- market_id
- market_name
- commodity_id
- commodity_name
- currency
- price_type
- unit
- month
- year
- price
- price_date

---

## 5. World Development Indicators

Contains hundreds of economic and development indicators published by the World Bank.

### Important Columns

- country_code
- country_name
- indicator_code
- indicator_name
- business_indicator
- year
- indicator_value

---

# 🗄️ Database Overview

The PostgreSQL database consists of five analytical tables:

- peace_index
- inflation
- disasters
- food_prices
- world_indicators

Although these datasets originate from different organizations, they are logically connected through common analytical fields:

- Country Code
- Country Name
- Year

These logical relationships enable advanced SQL analysis through JOIN operations.

---

# 🏗️ Database Architecture

The project follows a relational database architecture where each dataset is stored in an independent PostgreSQL table.

Instead of enforcing physical foreign keys, the tables are logically connected using common analytical fields such as **country_code**, **country_name**, and **year**. This design allows flexible cross-dataset analysis while preserving the original structure of each dataset.

```
                        ┌────────────────────┐
                        │    peace_index     │
                        └─────────┬──────────┘
                                  │
                     country_code │ year
                                  │
      ┌───────────────────────────┼────────────────────────────┐
      │                           │                            │
      ▼                           ▼                            ▼
┌───────────────┐        ┌────────────────┐        ┌────────────────────┐
│  inflation    │        │   disasters    │        │ world_indicators   │
└───────────────┘        └────────────────┘        └────────────────────┘
         │
         │ country_name + year
         ▼
┌────────────────────────────┐
│       food_prices          │
└────────────────────────────┘
```

---

# 🗃️ Database Tables

The database consists of five analytical tables.

| Table | Description |
|---------|-------------|
| peace_index | Stores Global Peace Index scores by country and year |
| inflation | Stores annual inflation rates |
| disasters | Stores disaster events and humanitarian impact |
| food_prices | Stores market-level commodity prices |
| world_indicators | Stores World Bank development indicators |

---

# 📐 Logical Relationships

The following fields are used to connect datasets during SQL analysis.

| Join Key | Used In |
|----------|----------|
| country_code | Peace, Inflation, Disasters, World Indicators |
| country_name | Inflation, Food Prices |
| year | Peace, Inflation, Food Prices, World Indicators |
| start_year | Disasters |

---

# 🔄 ETL Pipeline

The project follows a structured ETL (Extract, Transform, Load) workflow.

```
                    Raw CSV Files
                          │
                          ▼
              Python Cleaning Scripts
                          │
                          ▼
                Cleaned CSV Datasets
                          │
                          ▼
                 PostgreSQL Database
                          │
                          ▼
               Advanced SQL Analysis
                          │
                          ▼
             Business Reports & Insights
```

---

# ⚙️ Data Cleaning Workflow

The datasets were cleaned using Python before loading into PostgreSQL.

Cleaning operations included:

- Removing duplicate records
- Handling missing values
- Standardizing column names
- Converting data types
- Removing unnecessary columns
- Formatting dates
- Validating country codes
- Exporting cleaned CSV files

Each dataset has an independent cleaning script stored inside the **scripts/** directory.

---

# 🛠 SQL Modules

The project contains multiple SQL modules covering different analytical concepts.

| SQL File | Description |
|-----------|-------------|
| 01_create_database.sql | Database creation |
| 02_create_tables.sql | Table definitions |
| 03_import_data.sql | Import cleaned CSV files |
| 04_peace_analysis.sql | Peace Index analysis |
| 05_inflation_analysis.sql | Inflation analysis |
| 06_disaster_analysis.sql | Disaster analysis |
| 07_food_price_analysis.sql | Food price analysis |
| 08_world_indicators_analysis.sql | World Development Indicators analysis |
| 09_cross_dataset_analysis.sql | Multi-table analytical queries |
| 10_window_functions.sql | Ranking, Running Totals, Analytical Functions |
| 11_views.sql | SQL Views |
| 12_dashboard_queries.sql | Executive analytical queries |
| 13_indexes.sql | Database indexing |
| 13_query_performance.sql | EXPLAIN ANALYZE & Query optimization |
| 14_functions.sql | PostgreSQL User Defined Functions |
| 15_business_reports.sql | Executive business reports |
| 16_cte_analysis.sql | Common Table Expressions (CTEs) |
| 17_master_analysis.sql | Final SQL showcase |

---

# 🚀 SQL Features Demonstrated

This project demonstrates SQL concepts ranging from beginner to advanced level.

## Basic SQL

- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT
- GROUP BY
- HAVING
- Aggregate Functions

---

## Intermediate SQL

- INNER JOIN
- LEFT JOIN
- CROSS JOIN
- Subqueries
- CASE Statements
- COALESCE
- NULL Handling

---

## Advanced SQL

- Common Table Expressions (CTEs)
- Window Functions
- Views
- User Defined Functions
- Indexes
- Query Optimization
- EXPLAIN ANALYZE
- Cross Dataset Analysis

---

# 📈 SQL Skills Demonstrated

| SQL Concept | Used |
|-------------|:----:|
| SELECT | ✅ |
| WHERE | ✅ |
| GROUP BY | ✅ |
| HAVING | ✅ |
| ORDER BY | ✅ |
| Aggregate Functions | ✅ |
| JOINs | ✅ |
| CASE | ✅ |
| COALESCE | ✅ |
| Window Functions | ✅ |
| CTEs | ✅ |
| Views | ✅ |
| Functions | ✅ |
| Indexes | ✅ |
| EXPLAIN ANALYZE | ✅ |

---

# 🧠 Query Optimization

To improve query performance, indexes were created on frequently queried columns such as:

- country_code
- country_name
- year
- start_year
- indicator_code

Performance was evaluated using PostgreSQL's **EXPLAIN ANALYZE** command.

---

# 📊 Analytical Workflow

The analytical process followed in this project is shown below.

```
Collect Data
      │
      ▼
Clean Data
      │
      ▼
Create Database
      │
      ▼
Load Cleaned Data
      │
      ▼
Perform SQL Analysis
      │
      ▼
Optimize Queries
      │
      ▼
Generate Business Reports
      │
      ▼
Document Findings
```

---

# 💡 Design Decisions

Several design choices were made to improve flexibility and maintainability.

- Independent cleaning scripts for each dataset.
- Logical relationships instead of enforced foreign keys.
- Separate SQL modules for different analytical concepts.
- Reusable Views and Functions.
- Dedicated performance optimization scripts.
- Business-focused analytical queries rather than only syntax demonstrations.

---

# 💼 Business Questions Answered

The project answers several real-world analytical questions using PostgreSQL.

### Peace Analysis

- Which countries have the highest Peace Index score?
- Which countries have shown improvement in peace over time?
- What are the yearly global peace trends?
- Which countries consistently rank among the least peaceful?

---

### Inflation Analysis

- Which countries have experienced the highest inflation?
- How has inflation changed over time?
- Which countries have stable inflation rates?
- What are the yearly inflation trends?

---

### Disaster Analysis

- Which countries experience the highest number of disasters?
- Which disaster types occur most frequently?
- Which disasters caused the highest economic losses?
- Which countries recorded the largest number of deaths?

---

### Food Price Analysis

- Which commodities have the highest average prices?
- Which countries have the highest food prices?
- How do food prices change over time?
- Which markets have the highest commodity prices?

---

### World Development Indicators

- Which business indicators contain the largest number of records?
- Which indicators have the highest average values?
- How do indicators vary across countries?

---

### Cross Dataset Analysis

- Does higher inflation correlate with lower peace?
- Are disaster-prone countries also less peaceful?
- Which countries face multiple crises simultaneously?
- How do disasters affect food prices?
- How do economic indicators relate to global peace?

---

# 📊 Key Business Reports

The project includes multiple executive reports such as:

- Top 10 Least Peaceful Countries
- Top 10 Highest Inflation Countries
- Countries with Highest Disaster Deaths
- Countries with Highest Economic Damage
- Most Disaster-Prone Countries
- Countries Facing Multiple Crises
- Food Price vs Inflation Analysis
- Global Crisis Overview
- Crisis Ranking
- Executive Summary Report

---

# 📈 SQL Analysis Highlights

This project contains more than **100 analytical SQL queries** covering:

- Aggregations
- Multi-table JOINs
- Window Functions
- Common Table Expressions (CTEs)
- SQL Views
- User Defined Functions
- Business Reports
- Performance Optimization
- Cross Dataset Analysis

---

# 📚 Documentation

The project includes comprehensive documentation.

| Document | Description |
|----------|-------------|
| Database Architecture | Overall database design |
| Data Dictionary | Description of every important field |
| ER Diagram | Entity relationship model |
| Table Definitions | Table structure and purpose |
| ETL Workflow | Data cleaning and loading process |
| Project Workflow | Complete project lifecycle |
| Business Questions | Business problems solved |
| SQL Optimization | Performance tuning approach |
| Project Results | Final outcomes and insights |

---

# 📸 Project Screenshots

The following screenshots demonstrate different stages of the project implementation.

| Screenshot | Description |
|------------|-------------|
| [📁 Project Structure](screenshots/01_project_structure.png) | Overall project folder structure |
| [🗄️ Database Tables](screenshots/02_database_tables.png) | PostgreSQL tables created for the project |
| [📊 Peace Index Data](screenshots/03_peace_index_data.png) | Sample records from the Peace Index table |
| [🍞 Food Prices Data](screenshots/04_food_prices_data.png) | Sample records from the Food Prices table |
| [🌍 World Indicators Data](screenshots/05_world_indicators.png) | Sample records from the World Development Indicators table |
| [👁️ SQL Views](screenshots/06_views.png) | Views created for analytical reporting |
| [⚙️ User Defined Functions](screenshots/07_functions.png) | PostgreSQL functions implemented in the project |
| [📈 Business Query Output](screenshots/08_business_query.png) | Sample business analysis query results |
| [🧩 CTE Analysis](screenshots/09_cte_query.png) | Common Table Expression (CTE) example |
| [📉 Window Functions](screenshots/10_window_function.png) | Ranking and analytical window function results |
| [🗺️ ER Diagram](screenshots/11_er_diagram.png) | Entity Relationship Diagram of the database |
| [⚡ Query Performance](screenshots/12_explain_analyze.png) | Query optimization using EXPLAIN ANALYZE |

These screenshots provide visual evidence of:

- Database creation
- Table structure
- Data loading
- Query execution
- SQL Views
- User Defined Functions
- Query Optimization
- Final ER Diagram

---

# ⚡ Performance Optimization

To improve database performance, indexes were created on frequently used analytical columns.

Examples include:

- country_code
- year
- country_name
- indicator_code
- disaster_type

The execution plans were evaluated using PostgreSQL's **EXPLAIN ANALYZE** command.

---

# 🚀 How to Run the Project

## 1. Clone the Repository

```bash
git clone https://github.com/Prasad1103/Global-Crisis-Intelligence-Engine.git
```

---

## 2. Open PostgreSQL

Create a PostgreSQL database.

Example:

```sql
CREATE DATABASE global_crisis_intelligence;
```

---

## 3. Run SQL Files

Execute the SQL files in the following order:

```
01_create_database.sql
02_create_tables.sql
03_import_data.sql
04_peace_analysis.sql
05_inflation_analysis.sql
06_disaster_analysis.sql
07_food_price_analysis.sql
08_world_indicators_analysis.sql
09_cross_dataset_analysis.sql
10_window_functions.sql
11_views.sql
12_dashboard_queries.sql
13_indexes.sql
13_query_performance.sql
14_functions.sql
15_business_reports.sql
16_cte_analysis.sql
17_master_analysis.sql
```

---

## 4. Python Scripts

Run the Python cleaning scripts before importing the data.

```
scripts/

01_clean_peace_index.py
02_clean_inflation.py
03_clean_disasters.py
04_clean_food_prices.py
05_clean_wdi.py
05a_extract_indicator_list.py
```

---

# 🎯 Learning Outcomes

Through this project, I gained practical experience in:

- Relational Database Design
- PostgreSQL Database Management
- Data Cleaning with Python
- ETL Pipeline Development
- SQL Query Optimization
- Advanced SQL Programming
- Business Data Analysis
- Cross Dataset Integration
- Technical Documentation
- End-to-End Analytics Project Development

---

# 🌟 Repository Highlights

✔ End-to-End SQL Analytics Project

✔ PostgreSQL Database Design

✔ Python ETL Pipeline

✔ Advanced SQL Concepts

✔ Cross Dataset Analysis

✔ Business Reporting

✔ Performance Optimization

✔ Professional Documentation

✔ Real-World Analytical Use Cases

---

# 📊 Project Results

The Global Crisis Intelligence Engine successfully demonstrates the complete lifecycle of a SQL analytics project, from raw data processing to business intelligence reporting.

### Project Achievements

- Successfully integrated **5 global datasets** into a centralized PostgreSQL database.
- Designed a scalable relational database for analytical workloads.
- Developed a Python-based ETL pipeline for data cleaning and transformation.
- Implemented advanced SQL techniques for business analysis.
- Optimized query performance using indexes and execution plan analysis.
- Produced reusable SQL views and user-defined functions.
- Created executive-level business reports and analytical queries.
- Prepared comprehensive project documentation and technical diagrams.

---

# 📈 Skills Demonstrated

This project showcases practical skills required for Data Analyst and SQL Developer roles.

### Database Skills

- PostgreSQL Database Design
- Table Creation
- Data Import
- Data Validation
- Query Optimization

### SQL Skills

- Complex SELECT Statements
- Aggregate Functions
- Multi-table JOINs
- GROUP BY & HAVING
- CASE Expressions
- COALESCE
- Window Functions
- Common Table Expressions (CTEs)
- SQL Views
- User Defined Functions
- Index Creation
- EXPLAIN ANALYZE

### Python Skills

- Data Cleaning
- CSV Processing
- Data Transformation
- Data Validation
- ETL Development

### Analytical Skills

- Business Reporting
- Trend Analysis
- Cross Dataset Analysis
- Performance Optimization
- Executive Reporting

---

# 📌 Future Enhancements

The current version focuses on SQL analytics. Future improvements may include:

- Interactive Power BI Dashboard
- Automated ETL Pipeline
- Stored Procedures for administrative tasks
- Materialized Views for reporting
- Scheduled Database Refresh
- Dockerized PostgreSQL Environment
- Cloud Deployment (AWS / Azure / GCP)
- REST API for analytical queries

---

# 🤝 Contributing

Contributions are welcome.

If you have suggestions for improving query performance, database design, or analytical reports, feel free to:

1. Fork the repository
2. Create a new feature branch
3. Commit your changes
4. Open a Pull Request

---

# 📄 License

This project is licensed under the **MIT License**.

Feel free to use this project for learning, research, and portfolio purposes.

---

# 👨‍💻 Author

## Prasad Chaudhari

**Aspiring Data Analyst | SQL Developer | Python Enthusiast**

### Connect with Me

- GitHub: https://github.com/<[https://github.com/Prasad1103]>
- LinkedIn: https://www.linkedin.com/in/<[https://www.linkedin.com/in/prasad-chaudhari-145832287/]>

---

# 🙏 Acknowledgements

Special thanks to the organizations that provide open datasets used in this project.

- World Bank
- Institute for Economics & Peace
- EM-DAT International Disaster Database
- World Food Programme (WFP)

These publicly available datasets made this analytical project possible.

---

# ⭐ If you found this project helpful...

Please consider giving the repository a **Star ⭐** on GitHub.

It helps others discover the project and motivates further improvements.

---

<div align="center">

## 🌍 Global Crisis Intelligence Engine

### PostgreSQL • SQL • Python • ETL • Data Analytics

**Developed with ❤️ by Prasad Chaudhari**

*"Transforming global data into meaningful insights through PostgreSQL and advanced SQL analytics."*

</div>
