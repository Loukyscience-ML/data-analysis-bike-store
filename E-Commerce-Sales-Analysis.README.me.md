# SQL Project: E-Commerce Sales Analysis

## Project Overview
This project involves analyzing sales data for an e-commerce platform. It aims to generate valuable insights regarding product sales, customer behavior, store performance, and revenue trends. The dataset used includes information about stores, customers, orders, products, and order items. The main objective is to use SQL queries to extract meaningful data from these tables, helping the business make informed decisions to boost sales and improve customer experience.

## Project Objectives
The main objectives of this project are:
1. **Store Performance Analysis**: Evaluate total revenue per store and identify top-selling products and top customers in each store.
2. **Customer Insights**: Identify loyal customers and assess the sales contribution of each customer across stores.
3. **Revenue Trends**: Analyze monthly revenue trends and the distribution of sales across different states.
4. **Product Performance**: Identify top-selling products overall and by category.
5. **Staff Performance**: Analyze sales performance by staff and identify staff efficiency based on the number of orders processed and revenue generated.

## Tables Used
The following tables are included in this analysis:
- **stores**: Information about stores, including their names and IDs.
- **orders**: Order data, including order dates, customer details, and associated store IDs.
- **order_items**: Items included in each order, with quantity, list price, and discount applied.
- **products**: Information about products sold across stores, including product names and IDs.
- **customers**: Customer data, including their personal information and purchase behavior.
- **staffs**: Staff data, including their personal information and the stores they work at.
- **categories**: Product categories to help analyze sales trends by category.
  
## Key SQL Queries Implemented
This project contains several SQL queries to extract valuable insights, including:
1. **Total sales per store**: Calculates the total revenue for each store.
2. **Top-selling product in each store**: Identifies the top-selling product based on quantity sold in each store.
3. **Top customers per store**: Identifies the top customers in each store based on total quantity purchased.
4. **Monthly sales trend**: Analyzes the monthly revenue trend.
5. **Sales distribution by state**: Calculates total sales by state.
6. **State with the highest sales**: Identifies the state with the highest total sales.
7. **Top-selling products overall**: Lists the top 5 products across all stores.
8. **Revenue per product category**: Evaluates the total revenue generated by each product category.
9. **Staff performance**: Analyzes the performance of each staff member based on sales handled and orders processed.
10. **Loyal customers**: Lists customers who made more than one order.
11. **Average order value**: Calculates the average value of all orders placed on the platform.

## Technologies Used
- **SQL**: For querying and analyzing the data.
- **PostgreSQL**: The database used for storing and querying the e-commerce data.

## Conclusion
This project provides a comprehensive analysis of sales performance, customer behavior, and operational efficiency. By utilizing advanced SQL queries, we are able to extract meaningful insights that can help optimize the sales process, improve customer retention, and enhance decision-making for the business.
