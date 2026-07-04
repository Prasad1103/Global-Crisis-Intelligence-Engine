# Business Questions

## Project

**Global Crisis Intelligence Engine**

---

# Overview

The Global Crisis Intelligence Engine was developed to analyze global socio-economic and humanitarian data using PostgreSQL.

The project combines multiple datasets to answer meaningful business and policy-related questions through SQL analysis.

---

# Business Objective

The primary objective of this project is to transform raw global datasets into actionable insights that support decision-making.

The project helps identify countries experiencing multiple crisis indicators such as conflict, inflation, disasters, food insecurity, and poor development outcomes.

---

# Business Questions

## 1. Which countries have the highest average inflation?

### Business Value

High inflation often indicates economic instability and increasing living costs.

### SQL Concepts Used

- GROUP BY
- AVG()
- ORDER BY

---

## 2. Which countries are the least peaceful?

### Business Value

Identifies countries with higher conflict risk and lower peace levels.

### SQL Concepts Used

- Aggregation
- Ranking
- Sorting

---

## 3. Which countries experience the largest number of disasters?

### Business Value

Helps identify disaster-prone regions for emergency preparedness and resource allocation.

### SQL Concepts Used

- COUNT()
- GROUP BY
- ORDER BY

---

## 4. Which countries suffer the highest disaster-related deaths?

### Business Value

Measures the human impact of disasters across countries.

### SQL Concepts Used

- SUM()
- GROUP BY

---

## 5. Which countries experience the greatest economic damage from disasters?

### Business Value

Highlights regions facing significant financial losses due to disasters.

### SQL Concepts Used

- SUM()
- ORDER BY

---

## 6. Which commodities have the highest average market prices?

### Business Value

Identifies expensive commodities and supports food market analysis.

### SQL Concepts Used

- AVG()
- GROUP BY

---

## 7. How do food prices vary across countries?

### Business Value

Compares food affordability between countries.

### SQL Concepts Used

- Aggregation
- Sorting

---

## 8. How has global peace changed over time?

### Business Value

Measures long-term changes in global peace trends.

### SQL Concepts Used

- GROUP BY
- Time-series analysis

---

## 9. How has inflation changed over time?

### Business Value

Tracks global economic trends across different years.

### SQL Concepts Used

- AVG()
- GROUP BY

---

## 10. How have disaster events changed over time?

### Business Value

Analyzes changes in disaster frequency across years.

### SQL Concepts Used

- COUNT()
- Trend analysis

---

## 11. Which countries face multiple crises simultaneously?

### Business Value

Combines peace, inflation, and disaster data to identify countries with multiple risk factors.

### SQL Concepts Used

- INNER JOIN
- LEFT JOIN
- Aggregate Functions

---

## 12. Is high inflation associated with low peace?

### Business Value

Explores the relationship between economic instability and peace.

### SQL Concepts Used

- JOIN
- WHERE
- Filtering

---

## 13. Is there a relationship between inflation and food prices?

### Business Value

Measures how inflation influences commodity prices.

### SQL Concepts Used

- JOIN
- GROUP BY
- AVG()

---

## 14. Do less peaceful countries experience greater disaster impacts?

### Business Value

Compares peace scores with disaster-related deaths.

### SQL Concepts Used

- JOIN
- Aggregation

---

## 15. Which regions experience the highest number of disasters?

### Business Value

Supports regional disaster risk assessment.

### SQL Concepts Used

- GROUP BY
- COUNT()

---

## 16. Which World Development Indicators contain the most data?

### Business Value

Identifies the most frequently reported development metrics.

### SQL Concepts Used

- GROUP BY
- COUNT()

---

## 17. Which development indicator categories have the highest average values?

### Business Value

Provides an overview of major development trends.

### SQL Concepts Used

- AVG()
- GROUP BY

---

## 18. Which countries have the highest overall crisis risk?

### Business Value

Combines multiple datasets to identify countries requiring greater attention from policymakers and humanitarian organizations.

### SQL Concepts Used

- Views
- JOINs
- Aggregation

---

## 19. How can SQL be used to generate executive-level reports?

### Business Value

Demonstrates how SQL supports business intelligence and decision-making.

### SQL Concepts Used

- Views
- Functions
- CTEs
- Window Functions

---

## 20. How can query performance be improved for large analytical datasets?

### Business Value

Ensures efficient execution of analytical queries on growing datasets.

### SQL Concepts Used

- Indexes
- EXPLAIN ANALYZE

---

# SQL Concepts Applied

| SQL Concept | Used |
|-------------|------|
| SELECT | ✅ |
| WHERE | ✅ |
| ORDER BY | ✅ |
| GROUP BY | ✅ |
| HAVING | ✅ |
| Aggregate Functions | ✅ |
| JOINs | ✅ |
| Subqueries | ✅ |
| Common Table Expressions (CTEs) | ✅ |
| Window Functions | ✅ |
| Views | ✅ |
| User-defined Functions | ✅ |
| Indexes | ✅ |
| EXPLAIN ANALYZE | ✅ |

---

# Business Impact

This project demonstrates how SQL can be used to transform raw global datasets into meaningful business insights.

The analysis supports:

- Global crisis monitoring
- Economic trend analysis
- Disaster impact assessment
- Food price analysis
- Development indicator analysis
- Cross-dataset reporting
- Executive decision support

---

# Summary

The Global Crisis Intelligence Engine answers a diverse set of real-world analytical questions using PostgreSQL.

By combining multiple datasets and applying advanced SQL techniques, the project showcases how data can be transformed into actionable insights for business, research, and policy analysis.