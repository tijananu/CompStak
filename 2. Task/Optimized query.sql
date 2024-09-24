--EXPLAIN analyze
WITH SalesData AS (
    SELECT 
        product_id, 
        SUM(total_amount) AS total_sales, 
        COUNT(order_id) AS order_count, 
        AVG(total_amount) AS avg_sales
    FROM optimization.Orders
    WHERE order_date >= '2024-01-01'
    GROUP BY product_id
)
SELECT 
    p.category AS "Category", 
    SUM(sd.total_sales) AS "Total sales", 
    SUM(sd.order_count) AS "Total orders", 
    AVG(sd.avg_sales) AS "Average order value"
FROM SalesData sd
JOIN optimization.Product p ON sd.product_id = p.product_id 
GROUP BY p.category;