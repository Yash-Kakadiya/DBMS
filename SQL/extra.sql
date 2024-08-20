CREATE DATABASE EXTRA
USE EXTRA

CREATE TABLE [dbo].[CUSTOMER2]
(
    [customer_id] [int] NULL,
    [cust_name] [varchar](30) NULL,
    [city] [varchar](30) NULL,
    [Grade] [int] NULL,
    [salesman_id] [int] NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[ORDERS]
(
    [ord_no] [int] NULL,
    [purch_amt] [decimal](8, 2) NULL,
    [ord_date] [datetime] NULL,
    [customer_id] [int] NULL,
    [salesman_id] [int] NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[SALESMAN]
(
    [salesman_id] [int] NULL,
    [name] [varchar](30) NULL,
    [city] [varchar](30) NULL,
    [commission] [decimal](4, 2) NULL
) ON [PRIMARY]

INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3002, N'Nick Rimando', N'New York', 100, 5001)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3007, N'Brad Davis', N'New York', 200, 5001)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3005, N'Graham Zusi', N'California', 200, 5002)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3008, N'Julian Green', N'London', 300, 5002)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3004, N'Fabian Johnson', N'Paris', 300, 5006)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3009, N'Geoff Cameron', N'Berlin', 100, 5003)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3003, N'Jozy Altidor', N'Moscow', 200, 5007)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (3001, N'Brad Guzan', N'London', NULL, 5005)
INSERT [dbo].[CUSTOMER2]
    ([customer_id], [cust_name], [city], [Grade], [salesman_id])
VALUES
    (4001, N'abc', N'ABC', 900, NULL)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70001, CAST(150.50 AS Decimal(8, 2)), CAST(N'2012-12-05 00:00:00.000' AS DateTime), 3005, 5002)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70009, CAST(270.65 AS Decimal(8, 2)), CAST(N'2012-11-10 00:00:00.000' AS DateTime), 3001, 5005)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70001, CAST(65.26 AS Decimal(8, 2)), CAST(N'2012-10-05 00:00:00.000' AS DateTime), 3002, 5001)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70004, CAST(110.50 AS Decimal(8, 2)), CAST(N'2012-08-17 00:00:00.000' AS DateTime), 3009, 5003)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70007, CAST(948.50 AS Decimal(8, 2)), CAST(N'2012-11-10 00:00:00.000' AS DateTime), 3005, 5002)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70005, CAST(2400.60 AS Decimal(8, 2)), CAST(N'2012-07-27 00:00:00.000' AS DateTime), 3007, 5001)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70008, CAST(5760.00 AS Decimal(8, 2)), CAST(N'2012-11-10 00:00:00.000' AS DateTime), 3002, 5001)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70010, CAST(1983.43 AS Decimal(8, 2)), CAST(N'2012-10-10 00:00:00.000' AS DateTime), 3004, 5006)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70003, CAST(2480.40 AS Decimal(8, 2)), CAST(N'2012-10-10 00:00:00.000' AS DateTime), 3009, 5003)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70012, CAST(250.45 AS Decimal(8, 2)), CAST(N'2012-06-27 00:00:00.000' AS DateTime), 3008, 5002)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70011, CAST(75.29 AS Decimal(8, 2)), CAST(N'2012-08-17 00:00:00.000' AS DateTime), 3003, 5007)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70013, CAST(3045.60 AS Decimal(8, 2)), CAST(N'2012-04-25 00:00:00.000' AS DateTime), 3002, 5001)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70001, CAST(150.50 AS Decimal(8, 2)), CAST(N'2012-12-05 00:00:00.000' AS DateTime), 3005, 5002)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70009, CAST(270.65 AS Decimal(8, 2)), CAST(N'2012-11-10 00:00:00.000' AS DateTime), 3001, 5005)
INSERT [dbo].[ORDERS]
    ([ord_no], [purch_amt], [ord_date], [customer_id], [salesman_id])
VALUES
    (70001, CAST(65.26 AS Decimal(8, 2)), CAST(N'2012-10-05 00:00:00.000' AS DateTime), 3002, 5001)
INSERT [dbo].[SALESMAN]
    ([salesman_id], [name], [city], [commission])
VALUES
    (5001, N'James Hoog', N'New York', CAST(0.15 AS Decimal(4, 2)))
INSERT [dbo].[SALESMAN]
    ([salesman_id], [name], [city], [commission])
VALUES
    (5002, N'Nail Knite', N'Paris', CAST(0.13 AS Decimal(4, 2)))
INSERT [dbo].[SALESMAN]
    ([salesman_id], [name], [city], [commission])
VALUES
    (5005, N'Pit Alex', N'London', CAST(0.11 AS Decimal(4, 2)))
INSERT [dbo].[SALESMAN]
    ([salesman_id], [name], [city], [commission])
VALUES
    (5006, N'Mc Lyon', N'Paris', CAST(0.14 AS Decimal(4, 2)))
INSERT [dbo].[SALESMAN]
    ([salesman_id], [name], [city], [commission])
VALUES
    (5007, N'Paul Adam', N'Rome', CAST(0.13 AS Decimal(4, 2)))
INSERT [dbo].[SALESMAN]
    ([salesman_id], [name], [city], [commission])
VALUES
    (5003, N'Lauson Hen', N'San Jose', CAST(0.12 AS Decimal(4, 2)))

SELECT *
FROM CUSTOMER2
SELECT *
FROM ORDERS
SELECT *
FROM SALESMAN


--From the above given tables perform the following SQL queries (Join):

-------------Part A -----------

--1. Write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman,cust_name and city.

SELECT S.NAME AS SALESMAN, C.cust_name AS CUSTOMER, C.CITY
FROM CUSTOMER2 AS C JOIN SALESMAN AS S
    ON C.CITY=S.CITY;

-- ON C.CITY=S.CITY;

--2. Write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no,purch_amt, cust_name, city.

SELECT O.ORD_NO AS ORDER_NUMBER, O.PURCH_AMT AS AMOUNT, C.CITY, C.cust_name, C.CITY
FROM CUSTOMER2 AS C JOIN ORDERS AS O
    ON C.customer_id=O.customer_id
WHERE O.purch_amt BETWEEN 500 AND 2000;

--3. Write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name,city, Salesman, commission.



--4. Write a SQL query to find salespeople who received commissions of more than 12 percent from thecompany. Return Customer Name, customer city, Salesman, commission.



--5. Write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.



--6. Write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade,Salesman, commission.



--7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.



--8. Write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.



--9. Write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. --10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.


-------------Part B -----------

-- 01. Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

SELECT C.cust_name, C.CITY, O.ORD_NO, O.ORD_DATE, O.purch_amt, S.NAME, S.commission
FROM CUSTOMER2 AS C LEFT JOIN ORDERS AS O
    ON C.customer_id=O.customer_id
    JOIN SALESMAN AS S
    ON C.salesman_id = S.salesman_id

-- 02. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers. 

SELECT S.NAME, COUNT(s.salesman_id)
FROM CUSTOMER2 AS C RIGHT JOIN SALESMAN AS S
    ON C.salesman_id = S.salesman_id
GROUP by s.name
ORDER by COUNT(s.salesman_id);

-- 03. Write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.



-- 04. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.



-- 05. For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount.



-- 06. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.



-- 07. Write a SQL query to combine each row of the salesman table with each row of the customer table.



-- 08. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.



-- 09. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.



-- 10. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who mu


