
-- basic setup--

Create database Product_performance;

use  Product_performance;

show tables;

RENAME TABLE warehouse_data_named TO warehouse;

select * from warehouse;


SELECT * 
FROM cleaned_sales_data;

RENAME TABLE cleaned_sales_data TO sales;

      -- Queries on Warehouse data table--
      
select * from warehouse;

-- less stocks high demand--

select  Product_Name from warehouse
WHERE Stock_On_Hand < Reorder_Level;

-- high stocks less demand--

select  Product_Name from warehouse
WHERE Stock_On_Hand > Reorder_Level;

-- Total stock per warehouse--

SELECT Warehouse_ID , Product_Name , SUM(Stock_On_Hand) AS Total_Stock
FROM Warehouse
GROUP BY Warehouse_ID,Product_Name
order by  Total_Stock desc;


-- Top 15 expensive storage cost items --

SELECT Product_Name, Storage_Cost_Per_Unit
FROM Warehouse
ORDER BY Storage_Cost_Per_Unit DESC
LIMIT 15;

-- Damaged units percentage per product -- 

SELECT Product_Name, Damaged_Units, Stock_On_Hand,
       (Damaged_Units/Stock_On_Hand)*100 AS Damage_Percentage
FROM Warehouse
order by Damage_Percentage desc;

-- Space utilization analysis --

SELECT Warehouse_ID, product_Name, AVG(Space_Utilization) AS Avg_Utilization
FROM Warehouse
GROUP BY Warehouse_ID,product_name
order by Avg_Utilization desc;

-- Average order fulfillment time for fast-moving products --
SELECT Product_Name, Order_Fulfillment_Time
FROM Warehouse
WHERE Stock_On_Hand > 200
ORDER BY Order_Fulfillment_Time ASC;

-- Rank products by stock per warehouse --

SELECT Warehouse_ID, Product_Name, Stock_On_Hand,
       RANK() OVER (PARTITION BY Warehouse_ID ORDER BY Stock_On_Hand DESC) AS Stock_Rank
FROM Warehouse;

-- Calculate cumulative stock per warehouse -- 

SELECT Warehouse_ID, Product_Name, Stock_On_Hand,
       SUM(Stock_On_Hand) OVER (PARTITION BY Warehouse_ID ORDER BY Product_ID) AS Cumulative_Stock
FROM Warehouse;


-- Calculate percentage contribution of each product to warehouse stock --

SELECT Warehouse_ID, Product_Name, Stock_On_Hand,
       ROUND(Stock_On_Hand / SUM(Stock_On_Hand) OVER (PARTITION BY Warehouse_ID) * 100, 2) AS Stock_Percentage
FROM Warehouse;


-- Products below reorder level -- 

WITH Low_Stock AS (
    SELECT Warehouse_ID, Product_Name, Stock_On_Hand, Reorder_Level
    FROM Warehouse
    WHERE Stock_On_Hand < Reorder_Level
)
SELECT *, 'Reorder Needed' AS Status
FROM Low_Stock;


-- Average storage cost per warehouse with CTE --
WITH Avg_Cost AS (
    SELECT Warehouse_ID, AVG(Storage_Cost_Per_Unit) AS Avg_Storage_Cost
    FROM Warehouse
    GROUP BY Warehouse_ID
)
SELECT W.Warehouse_ID, W.Product_Name, W.Storage_Cost_Per_Unit, A.Avg_Storage_Cost
FROM Warehouse W
JOIN Avg_Cost A ON W.Warehouse_ID = A.Warehouse_ID;


-- Top 3 most damaged products per warehouse --

WITH Ranked_Damage AS (
    SELECT Warehouse_ID, Product_Name, Damaged_Units,
           RANK() OVER (PARTITION BY Warehouse_ID ORDER BY Damaged_Units DESC) AS Damage_Rank
    FROM Warehouse
)
SELECT *
FROM Ranked_Damage
WHERE Damage_Rank <= 3;


   -- Queries on Sales data table -- 
   
   select * from sales;
   
   -- TOTAL REVENUE --
   
   SELECT SUM(Revenue) AS Total_Revenue
FROM Sales;

   -- TOTAL REVENUE --
   
SELECT SUM(Profit_Loss_Amount) AS Total_Profit
FROM Sales
WHERE Profit_Loss_Status = 'Profit';


-- Count Products per Category --
SELECT Category, COUNT(*) AS Product_Count
FROM Sales
GROUP BY Category;

-- Top 10 Most Profitable Products --
SELECT Product_Name, SUM(Profit_Loss_Amount) AS Total_Profit
FROM Sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;


-- Profit Margin per Product --

SELECT category,
       ROUND((Profit_Loss_Amount / Revenue) * 100, 2) AS Profit_Margin_Percentage
FROM Sales
WHERE Revenue > 0
ORDER BY Profit_Margin_Percentage DESC;


SELECT 
    Category,
    ROUND((SUM(Profit_Loss_Amount) / SUM(Revenue)) * 100, 2) AS Profit_Margin_Percentage
FROM Sales
WHERE Revenue > 0
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;

-- Revenue & Profit by Category --

SELECT Category, 
       SUM(Revenue) AS Total_Revenue,
       SUM(Profit_Loss_Amount) AS Total_Profit
FROM Sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- Average Selling Price per Category --

SELECT Category, 
       AVG(Selling_Price) AS Avg_Selling_Price
FROM Sales
GROUP BY Category;

-- Rank Products by Revenue per Category --

SELECT Category, Product_Name, Revenue,
       RANK() OVER (PARTITION BY Category ORDER BY Revenue DESC) AS Revenue_Rank
FROM Sales;

-- Cumulative Revenue by Category --

SELECT Category, Product_Name, Revenue,
       SUM(Revenue) OVER (PARTITION BY Category ORDER BY Product_Name) AS Cumulative_Revenue
FROM Sales;

-- Top 3 Products per Category --

WITH Ranked_Products AS (
    SELECT Category, Product_Name, Revenue,
           RANK() OVER (PARTITION BY Category ORDER BY Revenue DESC) AS Rank_No
    FROM Sales
)
SELECT *
FROM Ranked_Products
WHERE Rank_No <= 3;

-- Loss-Making Products --

WITH Loss_Products AS (
    SELECT Product_Name, Category, Revenue, Profit_Loss_Amount
    FROM Sales
    WHERE Profit_Loss_Status = 'Loss'
)
SELECT * FROM Loss_Products;


-- Best-Selling Product (by units sold): --

SELECT Product_Name, SUM(Units_Sold) AS Total_Units
FROM Sales
GROUP BY Product_Name
ORDER BY Total_Units DESC;

-- Most Profitable Category --
SELECT Category, SUM(Profit_Loss_Amount) AS Total_Profit
FROM Sales
GROUP BY Category
ORDER BY Total_Profit DESC;











