use gdb041;

#1. Basic SELECT, WHERE, ORDER BY
SELECT customer_name, sold_quantity, date
FROM fact_sales_monthly
WHERE product LIKE '%SSD%'
ORDER BY sold_quantity DESC;

#2. GROUP BY with Aggregates (SUM, AVG)
SELECT customer_name, SUM(sold_quantity) AS total_quantity,
AVG(sold_quantity) AS avg_quantity
FROM fact_sales_monthly
GROUP BY customer_name
ORDER BY total_quantity DESC;

#3. INNER JOIN
SELECT f.date, c.customer, p.product, f.sold_quantity
FROM fact_sales_monthly f
INNER JOIN dim_customer c ON f.customer_code = c.customer_code
INNER JOIN dim_product p ON f.product_code = p.product_code;

#4. LEFT JOIN
SELECT f.date, c.customer, f.sold_quantity
FROM fact_sales_monthly f
LEFT JOIN dim_customer c ON f.customer_code = c.customer_code;

#5. RIGHT JOIN
SELECT f.date, c.customer, f.sold_quantity
FROM fact_sales_monthly f
RIGHT JOIN dim_customer c ON f.customer_code = c.customer_code;

#6. Subquery - Top Customer by Quantity
SELECT customer_name, sold_quantity
FROM fact_sales_monthly
WHERE sold_quantity = (
    SELECT MAX(sold_quantity)
    FROM fact_sales_monthly
);

#7. Subquery - Average quantity per product
SELECT product, sold_quantity
FROM fact_sales_monthly
WHERE sold_quantity > (
    SELECT AVG(sold_quantity)
    FROM fact_sales_monthly
);

#8. JOIN with Region Mapping (Market Zone)
SELECT f.date, p.product, m.region, m.sub_zone, SUM(f.sold_quantity) AS total_quantity
FROM fact_sales_monthly f
JOIN dim_market m ON f.market = m.market
JOIN dim_product p ON f.product_code = p.product_code
GROUP BY p.product, m.region, m.sub_zone;

#9. Create a View for Sales Summary
CREATE VIEW v_sales_summary AS
SELECT 
    f.product_code, 
    p.product, 
    SUM(f.sold_quantity) AS total_quantity,
    AVG(f.sold_quantity) AS avg_quantity
FROM fact_sales_monthly f
JOIN dim_product p ON f.product_code = p.product_code
GROUP BY f.product_code, p.product;
SELECT * FROM v_sales_summary;

#10. Optimize with Index
CREATE INDEX idx_customer_code ON fact_sales_monthly(customer_code);
CREATE INDEX idx_product_code ON fact_sales_monthly(product_code);
CREATE INDEX idx_market ON fact_sales_monthly(market);

#11. Monthly Sales Trend by Product and Market Region ##Taking too much time 
# to execute & timeout happening due to near 2 million views in sales dataset
SELECT 
    DATE_FORMAT(f.date, '%Y-%m') AS sales_month,
    p.product,
    m.region,
    SUM(f.sold_quantity) AS total_quantity,
    ROUND(
        (SUM(f.sold_quantity) - LAG(SUM(f.sold_quantity)) OVER (PARTITION BY p.product, m.region ORDER BY f.date)) /
        LAG(SUM(f.sold_quantity)) OVER (PARTITION BY p.product, m.region ORDER BY f.date) * 100,
        2
    ) AS YoY_growth_percent
FROM fact_sales_monthly f
JOIN dim_product p ON f.product_code = p.product_code
JOIN dim_market m ON f.market = m.market
GROUP BY sales_month, p.product, m.region
ORDER BY p.product, sales_month;

#12. Best Performing Customers per Category (RANKED) ##Taking too much time 
# to execute & timeout happening due to near 2 million views in sales dataset
SELECT 
    dp.category,
    dc.customer,
    SUM(fm.sold_quantity) AS total_purchased,
    RANK() OVER (PARTITION BY dp.category ORDER BY SUM(fm.sold_quantity) DESC) AS purchase_rank
FROM fact_sales_monthly fm
JOIN dim_customer dc ON fm.customer_code = dc.customer_code
JOIN dim_product dp ON fm.product_code = dp.product_code
GROUP BY dp.category, dc.customer
ORDER BY dp.category, purchase_rank;
