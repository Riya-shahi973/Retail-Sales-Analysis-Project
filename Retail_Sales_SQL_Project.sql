CREATE DATABASE Retail_Project;
USE Retail_Project;
CREATE TABLE Retail_Sales (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(20),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Sales DECIMAL(10,2),
    Profit DECIMAL(10,2)
);
SELECT COUNT(*) AS Total_Rows
FROM Retail_Sales;
SELECT * FROM Retail_Sales;
SHOW TABLES;
SELECT COUNT(*)
FROM `retail_sales_dataset_800_rows (1)`;
SELECT *
FROM `retail_sales_dataset_800_rows (1)`
LIMIT 10;
RENAME TABLE `retail_sales_dataset_800_rows (1)`
TO retail_sales1;
SELECT COUNT(*)
FROM retail_sales1;
 -- Total Sales 
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales1;
-- Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales1;
-- Sales by Category
SELECT Category,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales1
GROUP BY Category
ORDER BY Total_Sales DESC;
-- Region-wise Sales
SELECT Region,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales1
GROUP BY Region
ORDER BY Total_Sales DESC;
-- Top 10 Customers
SELECT Customer_Name,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales1
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
-- Top 3 Products by Sales
SELECT Product,
       SUM(Sales) AS Total_Sales
FROM retail_sales1
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 3;
-- Average Profit by Category
SELECT Category,
       ROUND(AVG(Profit),2) AS Avg_Profit
FROM retail_sales1
GROUP BY Category;
-- Sales Between Range
SELECT *
FROM retail_sales1
WHERE Sales BETWEEN 10000 AND 30000;