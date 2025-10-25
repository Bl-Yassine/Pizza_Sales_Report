-- Pizza Sales Report

-- KPI's
-- Total Revenue
SELECT
	SUM(total_price) AS Total_Revenue
FROM
	pizza_sales;

-- Average Order Value
SELECT
	(SUM(total_price)/COUNT(DISTINCT order_id)) AS Avg_Order_Value
FROM
	pizza_sales;

-- Total Pizzas Sold
SELECT
	SUM(quantity) AS Total_Pizzas_Sold
FROM
	pizza_sales;

-- Total Orders
SELECT
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales;

-- Average Pizzas Per Order
SELECT
	CAST ((CAST(SUM(quantity)AS DECIMAL(10,2))/COUNT(DISTINCT order_id)) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order
FROM
	pizza_sales;

-- Daily Trend for total Orders
SELECT
	DATENAME(WEEKDAY,order_date) AS week_day,
	COUNT( DISTINCT order_id) AS Daily_Trend_For_Total_Orders
FROM
	pizza_sales

GROUP BY 
	DATENAME(WEEKDAY,order_date),
	DATEPART(WEEKDAY, order_date)
ORDER BY
	DATEPART(WEEKDAY, order_date);

-- Mountly Trend for total Orders
SELECT
	DATENAME(month,order_date) AS week_day,
	COUNT( DISTINCT order_id) AS Mountly_Trend_For_Orders
FROM
	pizza_sales

GROUP BY 
	DATENAME(month,order_date),
	DATEPART(month, order_date)
ORDER BY
	DATEPART(month, order_date);

-- % Of Sales by Pizza Category
SELECT
	pizza_category,
	SUM(total_price) AS Sum_per_cat,
	FORMAT(ROUND(CAST(SUM(total_price)AS DECIMAL(10,2))/(SELECT
					SUM(total_price) AS Total_Pizzas_Sold
				FROM
				pizza_sales)*100,2),'N2') AS per_sales_by_pizza_cat
FROM
	pizza_sales
GROUP BY
	pizza_category;

-- % Of Sales by Pizza Size
SELECT
	pizza_size,
	SUM(total_price) AS Sum_per_size,
	FORMAT(ROUND(CAST(SUM(total_price)AS DECIMAL(10,2))/(SELECT
					SUM(total_price) AS Total_Pizzas_Sold
				FROM
				pizza_sales)*100,2),'N2') AS per_sales_by_pizza_Size
FROM
	pizza_sales
GROUP BY
	pizza_size;

-- Total Pizzas Sold by Pizza Category
SELECT
	pizza_category,
	SUM(quantity) AS qunatity_per_cat
FROM
	pizza_sales
GROUP BY
	pizza_category;
	
-- Top 5 Pizzas By Revenue
SELECT
	TOP 5
	pizza_name,
	SUM(total_price) AS Tot_revenue
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY 
	SUM(total_price) DESC;

-- Bottom 5 Pizzas By Revenue

SELECT
	TOP 5
	pizza_name,
	SUM(total_price) AS Tot_revenue
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY 
	SUM(total_price);

-- Top 5 Pizzas By Quantity
SELECT
	TOP 5
	pizza_name,
	SUM(quantity) AS Tot_qauntity
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY 
	SUM(quantity) DESC;

-- Bottom 5 Pizzas By Quantity
SELECT
	TOP 5
	pizza_name,
	SUM(quantity) AS Tot_qauntity
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY 
	SUM(quantity);

-- Top 5 Pizzas by total Orders
SELECT
	TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) AS Tot_Order
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY 
	COUNT(order_id) DESC;

-- Bottom 5 Pizzas by total Orders
SELECT
	TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) AS Tot_Order
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY 
	COUNT(order_id);