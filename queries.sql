-- 1. Total sales amount per month
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(total_amount) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- 2. Customers who purchased more than one distinct product
SELECT 
    c.customer_id,
    c.first_name,
    COUNT(DISTINCT si.product_id) AS product_count
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
JOIN sales_items si ON s.sale_id = si.sale_id
GROUP BY c.customer_id, c.first_name
HAVING product_count > 1;

-- 3. Total sales per customer
SELECT 
    c.customer_id,
    c.first_name,
    SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name;

-- 4. Product-wise total revenue
SELECT 
    p.product_name,
    SUM(si.total_price) AS revenue
FROM products p
JOIN sales_items si ON p.product_id = si.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 5. Monthly order count
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    COUNT(sale_id) AS total_orders
FROM sales
GROUP BY month
ORDER BY month;
Added core SQL queries for sales analysis
