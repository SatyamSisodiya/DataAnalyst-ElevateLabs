
use gdb041;
-- 1. Extract Month from date
SELECT 
    date,
    EXTRACT(MONTH FROM date) AS sales_month
FROM fact_sales_monthly
LIMIT 10;

-- 2. Group by Year and Month
SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date);

-- 3. Total Revenue per Month (assuming quantity = revenue proxy)
SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    SUM(sold_quantity) AS total_revenue
FROM fact_sales_monthly
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date);

-- 4. Order Volume per Month (approximated via distinct composite key)
SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    COUNT(DISTINCT CONCAT(customer_code, product_code, date)) AS order_volume
FROM fact_sales_monthly
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date);

-- 5. Ordered by Year and Month
SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
GROUP BY sales_year, sales_month
ORDER BY sales_year ASC, sales_month ASC;

-- 6. Limit to Specific Time Period (e.g., 2017 Q3)
SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
WHERE date BETWEEN '2017-07-01' AND '2019-09-30'
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;

-- 7: Top 3 selling products per month
SELECT 
    sales_year,
    sales_month,
    product,
    total_sold
FROM (
    SELECT 
        EXTRACT(YEAR FROM fm.date) AS sales_year,
        EXTRACT(MONTH FROM fm.date) AS sales_month,
        dp.product,
        SUM(fm.sold_quantity) AS total_sold,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM fm.date), EXTRACT(MONTH FROM fm.date) 
                     ORDER BY SUM(fm.sold_quantity) DESC) AS rk
    FROM fact_sales_monthly fm
    JOIN dim_product dp ON fm.product_code = dp.product_code
    GROUP BY sales_year, sales_month, dp.product
) ranked_products
WHERE rk <= 3;

-- 8: Monthly sales split by region
SELECT 
    m.region,
    EXTRACT(YEAR FROM f.date) AS sales_year,
    EXTRACT(MONTH FROM f.date) AS sales_month,
    SUM(f.sold_quantity) AS total_quantity
FROM fact_sales_monthly f
JOIN dim_market m ON f.market = m.market
GROUP BY m.region, sales_year, sales_month
ORDER BY region, sales_year, sales_month;

-- 9: Average quantity sold per product category
SELECT 
    dp.category,
    ROUND(AVG(fm.sold_quantity), 2) AS avg_quantity_sold
FROM fact_sales_monthly fm
JOIN dim_product dp ON fm.product_code = dp.product_code
GROUP BY dp.category
ORDER BY avg_quantity_sold DESC;
