# SQL Query Analysis - Monthly and Advanced Sales Analytics

## 📁 Repository Overview
This repository contains advanced SQL queries on Atliq Hardware’s sales dataset. It showcases time-based aggregations, ranking, sales breakdowns by product and region, and category-level analysis.

The queries demonstrate both standard SQL operations and advanced analytical functions.

---

## 📦 Contents of SQL Queries

1. **Extract Month from Order Date**
   - Uses `EXTRACT(MONTH FROM date)` to retrieve the month part from the `date` field.
   - Useful for monthly aggregation and filtering.

2. **Group By Year and Month**
   - Groups sales records by both year and month.
   - Provides monthly aggregation of sales quantities.

3. **Total Revenue per Month**
   - Aggregates `sold_quantity` (as revenue proxy) per month and year.
   - Allows monitoring of monthly performance trends.

4. **Order Volume per Month**
   - Counts distinct "orders" per month by combining `customer_code`, `product_code`, and `date` fields.
   - Approximates volume in absence of explicit `order_id`.

5. **Ordered by Year and Month**
   - Orders the results by year and month in ascending order.
   - Ensures a chronological view of sales performance.

6. **Limit Results for Specific Time Period**
   - Filters data using `WHERE date BETWEEN 'start_date' AND 'end_date'`.
   - Example provided: Sales during Q3 2017 (July - September).

7. **Top 3 Selling Products per Month**
   - Ranks products based on total quantity sold each month.
   - Uses `RANK()` with `PARTITION BY` year/month.
   - Helps identify best-selling products dynamically over time.

8. **Monthly Sales Split by Region**
   - Joins sales data with the market dimension to group sales by `region`, `year`, and `month`.
   - Useful for regional sales performance monitoring.

9. **Average Quantity Sold per Product Category**
   - Calculates the average quantity sold grouped by product category.
   - Helps analyze category-wise performance and identify strong/weak product categories.

---

## 🛠 SQL Concepts Used

- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- Aggregate functions: `SUM()`, `COUNT(DISTINCT ...)`, `AVG()`
- Time-based extraction using `EXTRACT(YEAR FROM date)`, `EXTRACT(MONTH FROM date)`
- Window functions: `RANK() OVER (PARTITION BY ...)`
- Table joins: `INNER JOIN`
- Date range filtering

---

## 📝 How to Use

1. Open the SQL script file in your SQL editor (like MySQL Workbench, DBeaver, etc.).
2. Connect to a database with tables: `fact_sales_monthly`, `dim_product`, `dim_market`.
3. Run individual queries or the entire block to explore different analytical views.
4. Modify date ranges, limits, or groupings as needed based on your analysis requirements.

---

## 💡 Insights You Can Draw

- Monthly revenue and order volume trends.
- Top-performing products for each month.
- Regional sales breakdown month-on-month.
- Category-wise average sales volume.
- Seasonal patterns or anomalies across the years.

------
