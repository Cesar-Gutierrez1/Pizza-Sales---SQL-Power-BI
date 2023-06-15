SELECT SUM(total_price) AS Total_Revenue FROM [pizza data]

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM [pizza data]

SELECT SUM(quantity) AS Total_pizza_sold FROM [pizza data]

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM [pizza data]

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM [pizza data]

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM [pizza data]
GROUP BY DATENAME(DW, order_date)

SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from [pizza data]
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [pizza data]) AS DECIMAL(10,2)) AS PCT
FROM [pizza data]
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [pizza data]) AS DECIMAL(10,2)) AS PCT
FROM [pizza data]
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM [pizza data]
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [pizza data]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [pizza data]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

