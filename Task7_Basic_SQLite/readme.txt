# SQLite Database Analysis Project Summary

## Overview
This project demonstrates the implementation of a SQLite database for sales analysis, combining SQL queries with Python data analysis and visualization tools.

## Database Structure
- Database Name: sales_data.db
- Number of Records: 40 rows
- Table Name: sales
- Columns:
  1. product_id (INTEGER)
  2. product_name (TEXT)
  3. category (TEXT)
  4. quantity (INTEGER)
  5. price (REAL)
  6. sale_date (DATE)
  7. customer_region (TEXT)

## Data Content
- Products: Laptop, Smartphone, Tablet, Headphones, Monitor
- Categories: Electronics, Mobile, Accessories
- Regions: North, South, East, West, Central
- Date Range: Starting from January 1, 2025

## Analysis Performed
1. Created and populated SQLite database with sample sales data
2. Executed SQL query to calculate:
   - Total quantity sold per product
   - Total revenue per product
3. Loaded data into pandas DataFrame for analysis
4. Generated visualization showing revenue by product

## Visualization
- Generated a bar chart (sales_chart.png) showing revenue distribution across products
- Chart includes:
  - X-axis: Product names
  - Y-axis: Revenue in dollars
  - Title: Revenue by Product

## Files Generated
1. sales_data.db - SQLite database file
2. sales_chart.png - Bar chart visualization
3. sqlite.ipynb - Jupyter notebook containing all code and analysis

## Tools Used
- SQLite3 for database management
- Pandas for data manipulation
- Matplotlib for visualization
- Python's datetime and numpy for data generation

This project successfully demonstrates the integration of SQL database operations with Python data analysis tools, providing insights into product performance through both numerical analysis and visual representation.