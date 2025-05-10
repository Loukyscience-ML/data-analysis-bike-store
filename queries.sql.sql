--Total sales per store
SELECT 
	s.store_id,
	s.store_name,
	SUM(oi.quantity * oi.list_price * (1- oi.discount)) AS total_revenue
FROM
	stores s
JOIN
	orders o ON o.store_id = s.store_id
JOIN 
	order_items oi ON o.order_id = oi.order_id
GROUP BY 
	s.store_id,
	s.store_name
ORDER BY total_revenue DESC;


-- Top-selling product in each store
-- This query identifies the product with the highest sales volume in each store
WITH top_product AS(
	SELECT 
		p.product_id,
		p.product_name,
		s.store_id,
		s.store_name,
		SUM(quantity) AS total_sell,
		ROW_NUMBER() OVER(
		PARTITION BY s.store_id
		ORDER BY SUM(quantity) DESC
		) AS rank
	
	FROM stores s 
	JOIN orders o ON o.store_id = s.store_id
	JOIN order_items oi ON o.order_id = oi.order_id
	JOIN products p ON oi.product_id = p.product_id
	GROUP BY 
		p.product_id,
		p.product_name,
		s.store_id,
		s.store_name
)

SELECT 
	store_id,
	store_name,
	product_id,
	product_name,
	total_sell
FROM top_product
WHERE rank = 1
ORDER BY total_sell DESC;
	
--Top customers per store
--This query identifies the customer who made the highest purchase in each store
WITH best_customer AS(
	SELECT 
		s.store_id,
		s.store_name,
		c.customer_id,
		CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		SUM(quantity) AS total_orders,
		ROW_NUMBER() OVER(
		PARTITION BY s.store_id
		ORDER BY SUM(quantity) DESC
		) AS rank
	
	FROM stores s 
	JOIN orders o ON o.store_id = s.store_id
	JOIN customers c ON o.customer_id = c.customer_id
	JOIN order_items oi ON o.order_id = oi.order_id

	GROUP BY 
		s.store_id,
		s.store_name,
		c.customer_id,
		c.first_name,
		c.last_name
)

SELECT 
	store_id,
	store_name,
	customer_id,
	customer_name,
	total_orders
FROM best_customer
WHERE rank = 1
ORDER BY total_orders DESC;


-- Monthly sales trend
-- This query shows total revenue per month across all stores

SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    DATE_TRUNC('month', o.order_date)
ORDER BY 
    month;

SELECT DATE_TRUNC



--distribution of total sales across different states

-- Distribution of total sales across different states

SELECT 
    c.state,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    c.state
ORDER BY 
    total_sales DESC;



-- State with the highest total sales

WITH sales_by_state AS (
    SELECT 
        c.state,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales,
        ROW_NUMBER() OVER(
            ORDER BY SUM(oi.quantity * oi.list_price * (1 - oi.discount)) DESC
        ) AS rank
    FROM 
        customers c
    JOIN 
        orders o ON c.customer_id = o.customer_id
    JOIN 
        order_items oi ON o.order_id = oi.order_id
    GROUP BY 
        c.state
)

SELECT 
    state,
    total_sales
FROM 
    sales_by_state
WHERE 
    rank = 1;


-- Monthly sales trend to identify seasonal patterns

SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    DATE_TRUNC('month', o.order_date)
ORDER BY 
    month;





-- Top 5 selling products overall across all stores
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_quantity DESC
LIMIT 5;


-- Total revenue generated per product category
SELECT 
    cat.category_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS revenue
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
JOIN 
    categories cat ON p.category_id = cat.category_id
GROUP BY 
    cat.category_name
ORDER BY 
    revenue DESC;


-- Sales performance of each staff member (total orders handled and total sales)
SELECT 
    st.staff_id,
    CONCAT(st.first_name, ' ', st.last_name) AS staff_name,
    COUNT(DISTINCT o.order_id) AS total_orders_handled,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM 
    staffs st
JOIN 
    orders o ON st.staff_id = o.staff_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    st.staff_id, staff_name
ORDER BY 
    total_sales DESC;


-- Customers who made more than one order (loyal customers)
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, customer_name
HAVING 
    COUNT(DISTINCT o.order_id) > 1
ORDER BY 
    total_orders DESC;




-- Average order value across all orders
SELECT 
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT 
        o.order_id,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS order_total
    FROM 
        orders o
    JOIN 
        order_items oi ON o.order_id = oi.order_id
    GROUP BY 
        o.order_id
) sub;
