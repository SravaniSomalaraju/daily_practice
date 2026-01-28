CREATE DATABASE superstore;



SELECT * FROM orders;

--sales greater than average sales
SELECT *
FROM orders
WHERE Sales > (
SELECT AVG(Sales)
FROM orders
);

--select top 5 cities by total sales
SELECT TOP 5
	City,
	SUM(Sales) AS total_sales
FROM orders
GROUP BY City
ORDER BY total_sales DESC;


--customer purchase behaviour
SELECT 
	Customer_ID,
	Customer_Name,
	COUNT(Order_ID) AS total_orders,
	SUM(Sales) AS total_sales
FROM orders
GROUP BY
Customer_ID,
Customer_Name
HAVING COUNT(Order_ID) > 5;


--segment performance analysis
SELECT
	Segment,
	COUNT(Order_ID) AS total_orders,
	SUM(sales) AS total_sales
FROM orders
GROUP BY segment
ORDER BY total_sales DESC;


--shipping details detection
SELECT
	Order_ID,
	Order_Date,
	Ship_Date,
	DATEDIFF(DAY, Order_Date, Ship_Date) AS shipping_days
FROM orders
WHERE DATEDIFF(DAY, Order_Date, Ship_Date) > 4;


--ship mode utilization
SELECT
	Ship_Mode,
	COUNT(*) AS mode_orders,
	((COUNT(*) * 100) / (SUM(COUNT(*))) AS perc_utilization
FROM orders
GROUP BY Ship_Mode;


--city level ranking
WITH citylevel AS (
SELECT 
	Country,
	City,
	SUM(Sales) AS total_sales
FROM orders
GROUP BY Country, City
)
SELECT 
	Country,
	City,
    total_sales,
	RANK() OVER( PARTITION BY Country ORDER BY total_sales ) AS city_rank
FROM citylevel;


--montly order trend
SELECT
 YEAR(Order_Date),
 MONTH(Order_Date),
 COUNT(Order_ID) AS total_orders
FROM orders
GROUP BY
	YEAR(Order_Date),
	MONTH(Order_Date);


--data quality validation
SELECT *
FROM orders_data
WHERE Ship_Date < Order_Date;

