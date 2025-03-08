--From the above given tables perform the following queries:
-- Create the Customers table
CREATE TABLE Customers (
 Customer_id INT PRIMARY KEY,
 Customer_Name VARCHAR(250) NOT NULL,
 Email VARCHAR(50) UNIQUE
);
-- Create the Orders table
CREATE TABLE Orders (
 Order_id INT PRIMARY KEY,
 Customer_id INT,
 Order_date DATE NOT NULL,
 FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

--BEGIN TRY
--END TRY
--BEGIN CATCH
--END CATCH
--Part – A
--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
BEGIN TRY
	DECLARE @N INT
	SET @N=9/0
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
END CATCH

--2. Try to convert string to integer and handle the error using try…catch block.
BEGIN TRY
	DECLARE @STR VARCHAR(50), @N2 INT
	SET @STR='KEVIN'
	SET @N2=CAST(@STR AS INT)
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
END CATCH

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle
--exception with all error functions if any one enters string value in numbers otherwise print result.
CREATE OR ALTER PROCEDURE PR_CALCULATION
	@NUM1 NVARCHAR(20),
	@NUM2 NVARCHAR(20)
AS 
BEGIN
	BEGIN TRY
		DECLARE @INTNUM1 INT = CAST(@NUM1 AS INT)
		DECLARE @INTNUM2 INT = CAST(@NUM2 AS INT)
		PRINT CAST(@INTNUM1+@INTNUM2 AS NVARCHAR(20))
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY()
	END CATCH
END

EXEC PR_CALCULATION '10', 'HELLO'

--4. Handle a Primary Key Violation while inserting data into customers table and print the error details
--such as the error message, error number, severity, and state.
	INSERT INTO Customers(Customer_id, Customer_Name, Email) VALUES (101, 'ROHAN', 'RA@GMAIL.COM')

BEGIN TRY
	INSERT INTO Customers(Customer_id, Customer_Name, Email) VALUES (101, 'RAHUL', 'R@GMAIL.COM')
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_PROCEDURE(), ERROR_SEVERITY(), ERROR_LINE()
END CATCH

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws
--Error like no Customer_id is available in database.
CREATE OR ALTER PROCEDURE PR_CHECK_CUSTOMERID
	@CUSTOMER_ID INT
AS BEGIN
	IF NOT EXISTS (SELECT 1 Customer_ID FROM Customers WHERE Customer_id=@CUSTOMER_ID)
	BEGIN 
		THROW 50001, 'NO CUSTOMER_ID IS AVALABLE IN DATABASE', 14
	END 
	ELSE
	BEGIN  
		PRINT 'CUSTOMER IS EXISTS'
	END 
END

EXEC PR_CHECK_CUSTOMERID 101
EXEC PR_CHECK_CUSTOMERID 102

--Part – B
--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error
--message.
	INSERT INTO Orders(Order_id, Customer_id, Order_date) VALUES (1, 101, '2024-12-9')

BEGIN TRY
	INSERT INTO Orders(Order_id, Customer_id, Order_date) VALUES (1, 101, '2024-11-5')
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_PROCEDURE(), ERROR_SEVERITY(), ERROR_LINE()
END CATCH

--7. Throw custom exception that throws error if the data is invalid.
CREATE OR ALTER PROCEDURE PR_CHECK_DATA
	@VALUE INT
AS BEGIN
	IF @VALUE < 0
	BEGIN 
		THROW 50002, 'Invalid data: Value cannot be negative', 13
	END 
	ELSE
	BEGIN  
		PRINT 'Data is valid'
	END 
END

EXEC PR_CHECK_DATA -9

--8. Create a Procedure to Update Customer’s Email with Error Handling
CREATE OR ALTER PROCEDURE PR_CHECK_CUSTOMERID
	@CUSTOMER_ID INT,
	@EMAIL VARCHAR(20)
AS BEGIN
	BEGIN TRY
		UPDATE Customers SET Email=@EMAIL WHERE Customer_id=@CUSTOMER_ID
	END TRY
	
	BEGIN CATCH 
		SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_PROCEDURE(), ERROR_SEVERITY(), ERROR_LINE()
	END CATCH
END

EXEC PR_CHECK_CUSTOMERID 102, 12345
SELECT * FROM Customers

--Part – C
--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another
--one”.
CREATE OR ALTER PROCEDURE PR_TRY_CHECK_CUSTOMERID
	@CUSTOMER_ID INT
AS BEGIN
	IF NOT EXISTS (SELECT 1 Customer_ID FROM Customers WHERE Customer_id=@CUSTOMER_ID)
	BEGIN 
		THROW 50001, 'NO CUSTOMER_ID IS AVALABLE IN DATABASE', 14
	END 
	ELSE
	BEGIN  
		PRINT 'CUSTOMER_ID IS EXISTS'
	END 
END

exec PR_TRY_CHECK_CUSTOMERID 101
exec PR_TRY_CHECK_CUSTOMERID 102

--10. Handle Duplicate Email Insertion in Customers Table.	INSERT INTO Customers(Customer_id, Customer_Name, Email) VALUES (101, 'ROHAN', 'RA@GMAIL.COM')

IF NOT EXISTS (SELECT 1 EMAIL FROM Customers WHERE Email=@Email)
BEGIN 
	INSERT INTO Customers(Customer_id, Customer_Name, Email) VALUES (101, 'RAHUL', 'R@GMAIL.COM')
END
ELSE
BEGIN 
	SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_PROCEDURE(), ERROR_SEVERITY(), ERROR_LINE()
END 