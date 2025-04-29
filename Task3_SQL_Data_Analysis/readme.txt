# SQL Query Analysis on Atliq Hardware Sales Data

## 📁 Repository Overview
This repository demonstrates the use of SQL for business analytics using a sample database from Atliq Hardware. It includes queries ranging from basic `SELECT` operations to advanced analytical SQL involving joins, window functions, subqueries, and performance optimizations.

---

## 📦 Contents

1. **Task_3_Sales_Data.sql**
   - Contains all SQL queries written for this project.
   - Covers SELECT, WHERE, ORDER BY, GROUP BY, INNER/LEFT/RIGHT JOINS, subqueries, aggregate functions (SUM, AVG), views, and index creation.
   - Includes advanced queries for trend analysis and customer ranking using `RANK()` and `LAG()` functions.

2. **QueryOutput_Snippits.txt**
   - Sample output screenshots or descriptions showing results of selected queries.
   - Useful for quick visual validation of query logic and results.

3. **Database / images**
   - Provides snapshots or table extracts for:
     - `fact_sales_monthly`
     - `dim_customer`
     - `dim_product`
     - `dim_market`
   - These were used to understand the schema, join keys, and derive insights.

---

## 🛠 SQL Concepts Demonstrated

- Data Filtering: `SELECT`, `WHERE`, `ORDER BY`
- Aggregation: `GROUP BY`, `SUM()`, `AVG()`
- Data Relationships: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Subqueries: Scalar and correlated subqueries
- Ranking and Analytics: `RANK()`, `LAG()`, `PARTITION BY`
- Views: Reusable logic with `CREATE VIEW`
- Optimization: `CREATE INDEX` on frequently queried fields

---

## 💡 Use Cases Illustrated

- Sales trend monitoring across months and regions
- Performance analysis of customer segments
- Product category contribution breakdown
- Region-wise volume growth tracking
- Identifying high-performing customer-product pairs

---

## 📝 How to Use

1. Open the `sql_queries.sql` file in your SQL IDE.
2. Connect to a database with the same schema (or use the sample data as mock).
3. Run individual queries to explore various insights.
4. Refer to `output_snippets.txt` to compare results.

