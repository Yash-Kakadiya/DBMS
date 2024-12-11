---lab-08

-- Perform SQL queries for Group by with having and Order by

-- Table: SALES_DATA

CREATE TABLE SALES_DATA
(
    Region VARCHAR(25),
    Product VARCHAR(25),
    Sales_Amount DECIMAL(4,0),
    YEAR INT
);

INSERT INTO SALES_DATA
VALUES
    ('North America', 'Watch', 1500, 2023),
    ('Europe', 'Mobile', 1200 , 2023),
    ('Asia', 'Watch', 1800   , 2023 ),
    ('North America', 'TV', 900   , 2024  ),
    ('Europe', 'Watch', 2000  , 2024  ),
    ('Asia', 'Mobile', 1000   , 2024 ),
    ('North America', 'Mobile', 1600  , 2023 ),
    ('Europe', 'TV', 1500  , 2023 ),
    ('Asia', 'TV', 1100  , 2024  ),
    ('North America', 'Watch', 1700  , 2024  )

SELECT *
FROM SALES_DATA

--Part–A

--01. Display Total Sales Amount by Region. 

SELECT REGION, SUM(SALES_AMOUNT) AS TOTAL_SALES_BY_REGION
FROM SALES_DATA
GROUP BY Region

--02. Display Average Sales Amount by Product 

SELECT Product, AVG(SALES_AMOUNT) AS AVG_SALES_BY_PRODUCT
FROM SALES_DATA
GROUP BY Product

--03. Display Maximum Sales Amount by Year 

SELECT YEAR, MAX(SALES_AMOUNT) AS MAX_SALES_BY_YEAR
FROM SALES_DATA
GROUP BY YEAR

--04. Display Minimum Sales Amount by Region and Year 

SELECT YEAR, Region, MIN(SALES_AMOUNT) AS MIN_SALES_BY_YEAR
FROM SALES_DATA
GROUP BY YEAR, Region

--05. Count of Products Sold by Region 

SELECT Region, Count(Product) AS Count
FROM SALES_DATA
GROUP BY REGION

--06. Display Sales Amount by Year and Product 

SELECT YEAR, Product, SUM(Sales_Amount) AS SUM
FROM SALES_DATA
GROUP BY YEAR, Product

--07. Display Regions with Total Sales Greater Than 5000 

SELECT Region, SUM(Sales_Amount) AS SUM
FROM SALES_DATA
GROUP BY Region
HAVING SUM(Sales_Amount)>5000

--08. Display Products with Average Sales Less Than 10000 

SELECT Product, AVG(Sales_Amount) AS AVERAGE
FROM SALES_DATA
GROUP BY Product
HAVING AVG(Sales_Amount)<10000

--09. Display Years with Maximum Sales Exceeding 500 

SELECT YEAR, MAX(Sales_Amount) AS Maximum
FROM SALES_DATA
GROUP BY YEAR
HAVING MAX(Sales_Amount)>500

--10.  Display Regions with at Least 3 Distinct Products Sold. 

SELECT REGION, COUNT(DISTINCT PRODUCT) AS PRODUCT
FROM SALES_DATA
GROUP BY REGION
HAVING COUNT(DISTINCT PRODUCT)>=3

--11.  Display Years with Minimum Sales Less Than 1000 

SELECT YEAR, MIN(Sales_Amount) AS Minimum
FROM SALES_DATA
GROUP BY YEAR
HAVING MIN(Sales_Amount)<1000

--12.  Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount

SELECT YEAR, REGION, SUM(Sales_Amount) AS TOTAL
FROM SALES_DATA
WHERE YEAR=2023
GROUP BY YEAR, Region
ORDER BY SUM(Sales_Amount)

-- Part – B: 

-- 01. Display Count of Orders by Year and Region, Sorted by Year and Region 

SELECT YEAR, REGION, COUNT(Product) AS COUNT_OF_ORDERS
FROM SALES_DATA
GROUP BY YEAR, Region
ORDER BY YEAR, Region

-- 02. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region 

SELECT REGION, MAX(Sales_Amount) AS MAX
FROM SALES_DATA
GROUP BY  Region
HAVING MAX(Sales_Amount)>1000
ORDER BY  Region

-- 03. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending 

SELECT YEAR, SUM(Sales_Amount) AS TOTAL
FROM SALES_DATA
GROUP BY  Year
HAVING SUM(Sales_Amount)<1000
ORDER BY  YEAR DESC

-- 04. Display Top 3 Regions by Total Sales Amount in Year 2024 

SELECT TOP 3
    REGION, SUM(SALES_AMOUNT) AS TOTAL
FROM SALES_DATA
WHERE YEAR=2024
GROUP BY  REGION

-- Part – C: 

-- 01. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name 

SELECT PRODUCT, AVG(SALES_AMOUNT)AS AVG
FROM SALES_DATA
GROUP BY Product
HAVING AVG(SALES_AMOUNT) BETWEEN 1000 AND 2000
ORDER BY Product

-- 02. Display Years with More Than 5 Orders from Each Region 

SELECT YEAR, REGION, COUNT(Product)AS COUNT
FROM SALES_DATA
GROUP BY YEAR,REGION
HAVING COUNT(Product)>5

-- 03. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending. 

SELECT Region, AVG(SALES_AMOUNT) AS AVG
FROM SALES_DATA
WHERE YEAR=2023
GROUP BY Region
HAVING AVG(SALES_AMOUNT) >1500
ORDER BY AVG(Sales_Amount) DESC

-- 04. Find out region wise duplicate product. 

SELECT Region, Product
FROM SALES_DATA
GROUP BY Region, Product
HAVING COUNT(Product)>1

-- 05. Find out region wise highest sales amount. 

SELECT Region, MAX(Sales_Amount)
FROM SALES_DATA
GROUP BY Region
