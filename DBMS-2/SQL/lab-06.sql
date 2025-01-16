CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

--Part - A
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE @id INT, @name VARCHAR(250), @price DECIMAL(10,2)

DECLARE fetchData CURSOR FOR
SELECT Product_id, Product_Name, Price FROM Products

OPEN fetchData

FETCH NEXT FROM fetchData INTO @id, @name, @price

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT(CAST(@id AS VARCHAR(10)) + ' ' + @name + ' ' + CAST(@price AS VARCHAR(20)))
    FETCH NEXT FROM fetchData INTO @id, @name, @price
END

CLOSE fetchData
DEALLOCATE fetchData

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. (Example: 1_Smartphone)
DECLARE @id INT, @name VARCHAR(250)

DECLARE Product_Cursor_Fetch CURSOR FOR
SELECT Product_id, Product_Name FROM Products

OPEN Product_Cursor_Fetch

FETCH NEXT FROM Product_Cursor_Fetch INTO @id, @name

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT(CAST(@id AS VARCHAR(10))+ '_' + @name)
    FETCH NEXT FROM Product_Cursor_Fetch INTO @id, @name
END

CLOSE Product_Cursor_Fetch
DEALLOCATE Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
DECLARE @id INT, @name VARCHAR(250), @price DECIMAL(10,2)

DECLARE Find_Display CURSOR FOR
SELECT Product_id, Product_Name, Price FROM Products

OPEN Find_Display

FETCH NEXT FROM Find_Display INTO @id, @name, @price

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @price>30000
		PRINT(CAST(@id AS VARCHAR(10)) + ' ' + @name + ' ' + CAST(@price AS VARCHAR(20)))
	
	FETCH NEXT FROM Find_Display INTO @id, @name, @price
END

CLOSE Find_Display
DEALLOCATE Find_Display

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
DECLARE @id INT, @name VARCHAR(250), @price DECIMAL(10,2)

DECLARE Delete_Data CURSOR FOR
SELECT Product_id FROM Products

OPEN Delete_Data

FETCH NEXT FROM Delete_Data INTO @id

WHILE @@FETCH_STATUS = 0
BEGIN
	DELETE FROM Products WHERE Product_id = @id
	FETCH NEXT FROM Delete_Data INTO @id
END

CLOSE Delete_Data
DEALLOCATE Delete_Data

--Part – B
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%.
DECLARE @id INT, @name VARCHAR(250), @price DECIMAL(10,2)

DECLARE Product_CursorUpdate CURSOR FOR
SELECT Product_id, Product_Name, Price FROM Products

OPEN Product_CursorUpdate

FETCH NEXT FROM Product_CursorUpdate INTO @id, @name, @price

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @price = @price + @price*0.1
	UPDATE Products 
	SET Price = @price
    FETCH NEXT FROM Product_CursorUpdate INTO @id, @name, @price
END

CLOSE Product_CursorUpdate
DEALLOCATE Product_CursorUpdate

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE @price decimal(10,2)

DECLARE Round_Price CURSOR FOR
SELECT Price FROM Products

OPEN Round_Price

FETCH NEXT FROM Round_Price INTO @price

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Products
	SET Price = ROUND(@price,1)
    FETCH NEXT FROM Round_Price INTO @price
END

CLOSE Round_Price
DEALLOCATE Round_Price

--Part – C
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop”. (Note: Create NewProducts table first with same fields as Products table)
CREATE TABLE NewProducts (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

DECLARE @id INT, @name VARCHAR(250), @price DECIMAL(10,2)

DECLARE FetchData CURSOR FOR
SELECT * FROM Products WHERE Product_Name = 'Laptop'

OPEN FetchData

FETCH NEXT FROM FetchData INTO @id, @name, @price

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO NewProducts VALUES (@id, @name, @price)
    
    FETCH NEXT FROM FetchData INTO @id, @name, @price
END

CLOSE FetchData
DEALLOCATE FetchData

--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products with a price above 50000 to an archive table, removing them from the original Products table.
CREATE TABLE ArchivedProduct (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

DECLARE @id INT, @name VARCHAR(250), @price DECIMAL(10,2)

DECLARE Fetch_Data CURSOR FOR
SELECT * FROM Products WHERE Price > 50000

OPEN Fetch_Data

FETCH NEXT FROM Fetch_Data INTO @id, @name, @price

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO ArchivedProduct VALUES (@id, @name, @price)
    
    FETCH NEXT FROM Fetch_Data INTO @id, @name, @price
END

CLOSE Fetch_Data
DEALLOCATE Fetch_Data