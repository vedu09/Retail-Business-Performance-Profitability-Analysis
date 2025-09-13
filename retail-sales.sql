create database retail;

use retail;

-- Remove NULL values
DELETE FROM retail_sales
WHERE Date IS NULL 
   OR Branch IS NULL 
   OR City IS NULL 
   OR Product_line IS NULL 
   OR Unit_price IS NULL 
   OR Quantity IS NULL 
   OR cogs IS NULL 
   OR Total IS NULL;
   
   
  --  Profit Margin by Category
  SELECT 
    Product_line AS Category,
    SUM(cogs) AS Total_COGS,
    SUM(gross_income) AS Total_Profit,
    ROUND((SUM(gross_income) / NULLIF(SUM(cogs),0)) * 100, 2) AS Profit_Margin_Percent
FROM retail_sales
GROUP BY Product_line
ORDER BY Profit_Margin_Percent DESC;



-- Profit Margin by Category & Sub-Category 
SELECT 
    Product_line AS Category,
    Customer_type AS SubCategory,
    SUM(cogs) AS Total_COGS,
    SUM(gross_income) AS Total_Profit,
    ROUND((SUM(gross_income) / NULLIF(SUM(cogs),0)) * 100, 2) AS Profit_Margin_Percent
FROM retail_sales
GROUP BY Product_line, Customer_type
ORDER BY Category, Profit_Margin_Percent DESC;


-- Profit Margin by City & Product Line
SELECT 
    City,
    Product_line AS Category,
    SUM(cogs) AS Total_COGS,
    SUM(gross_income) AS Total_Profit,
    ROUND((SUM(gross_income) / NULLIF(SUM(cogs),0)) * 100, 2) AS Profit_Margin_Percent
FROM retail_sales
GROUP BY City, Product_line
ORDER BY City, Profit_Margin_Percent DESC;
 