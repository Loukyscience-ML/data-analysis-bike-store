 
1. Total Sales Per Store
Description:
Calculates total revenue per store by summing the actual sales amount after discount.

SQL Explanation:

Joins stores → orders → order_items.

Revenue = quantity × list_price × (1 - discount).

Grouped by store and ordered descending.

2. Top-Selling Product in Each Store
Description:
Identifies the best-selling product (by quantity) in each store.

SQL Explanation:

CTE + ROW_NUMBER() used to rank products per store.

Joins include stores, orders, order_items, products.

The PARTITION BY creates a rank within each store.

Filtered for rank = 1 to get top product per store.

3. Top Customers Per Store
Description:
Finds the most loyal customer in each store by quantity of items bought.

SQL Explanation:

Similar pattern to the previous query using a CTE.

Joins stores, orders, customers, order_items.

ROW_NUMBER() used again to rank customers by total quantity per store.

4. Monthly Sales Trend (Revenue)
Description:
Tracks how total revenue changes per month over time.

SQL Explanation:

Uses DATE_TRUNC('month', order_date) to extract the month.

Joins orders with order_items.

Revenue calculated and grouped by month.

5. Distribution of Total Sales by State
Description:
Shows total revenue per state based on where customers live.

SQL Explanation:

Joins customers → orders → order_items.

Revenue calculated as usual.

Grouped by state from customers.

6. State with the Highest Total Sales
Description:
Extracts the top-performing state in terms of total revenue.

SQL Explanation:

Uses a CTE to calculate revenue per state.

ROW_NUMBER() ranks states by total revenue.

Filters to show only the one ranked first (highest revenue).

7. Top 5 Selling Products Overall
Description:
Displays the five products with the highest quantity sold across all stores.

SQL Explanation:

Joins order_items with products.

Sums quantities and groups by product name.

Orders descending and limits to top 5.

8. Revenue per Product Category
Description:
Shows how much revenue each product category generated.

SQL Explanation:

Joins order_items → products → categories.

Revenue calculated using standard formula.

Grouped by category_name.

9. Sales Performance by Staff
Description:
Evaluates staff performance based on orders handled and total sales.

SQL Explanation:

Joins staffs → orders → order_items.

Aggregates count of distinct orders and total revenue per staff.

Grouped by staff and sorted by revenue.

10. Loyal Customers (More Than One Order)
Description:
Identifies customers who made more than one order (loyal base).

SQL Explanation:

Joins customers with orders.

Groups by customer and counts distinct orders.

Filters using HAVING > 1 to get only loyal customers.

11. Average Order Value
Description:
Calculates the average value of an order (AOV).

SQL Explanation:

Subquery groups each order and sums its revenue.

Outer query takes the AVG() of all these totals.

Rounded to 2 decimal places.

12. Products Never Ordered
Description:
Lists products that were never included in any order.

SQL Explanation:

Left join products with order_items.

Filters where order_items.product_id is NULL.

Means the product was never purchased.

13. Products with Low Sales (Less than 10 Units Sold)
Description:
Finds underperforming products that sold very few units.

SQL Explanation:

Joins order_items with products.

Groups and sums quantities.

Filters with HAVING SUM(quantity) < 10.

