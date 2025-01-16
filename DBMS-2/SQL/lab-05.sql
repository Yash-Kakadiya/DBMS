-- Creating PersonInfo Table
CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);
-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL,
 FOREIGN KEY (PersonID) REFERENCES PersonInfo(PersonID) ON DELETE CASCADE
);

--Part – A
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display a message “Record is Affected.”
CREATE OR ALTER TRIGGER TRIGGER_OPERATION
ON PersonInfo
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
	PRINT('Record is Affected')
END

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
--INSERT
CREATE OR ALTER TRIGGER PersonLog_Trigger_Insert
ON PersonInfo
AFTER INSERT
AS
BEGIN
	DECLARE @ID INT
	DECLARE @NAME VARCHAR(250)
	DECLARE @OPERATION VARCHAR(50)
	DECLARE @UPDATETIME DATETIME

	SELECT @ID = PersonId FROM INSERTED
	SELECT @NAME = PersonName FROM INSERTED

	INSERT INTO PersonLog values(@ID,@NAME,'INSERT',GETDATE())
END

INSERT INTO PersonInfo VALUES(1,'JEVIN',122,'2006-1-29','RAJKOT',19,'2006-1-29')

--UPDATE
CREATE OR ALTER TRIGGER PersonLog_Trigger_Update
ON PersonInfo
AFTER UPDATE
AS
BEGIN
	DECLARE @ID INT
	DECLARE @NAME VARCHAR(250)
	DECLARE @OPERATION VARCHAR(50)
	DECLARE @UPDATETIME DATETIME

	SELECT @ID = PersonId FROM INSERTED
	SELECT @NAME = PersonName FROM INSERTED

	INSERT INTO PersonLog values(@ID,@NAME,'UPDATE',GETDATE())
END

UPDATE PersonInfo
SET Salary = 121
WHERE PersonID = 2

--DELETE
CREATE OR ALTER TRIGGER PersonLog_Trigger_Delete
ON PersonInfo
AFTER DELETE
AS
BEGIN
	DECLARE @ID INT
	DECLARE @NAME VARCHAR(250)
	DECLARE @OPERATION VARCHAR(50)
	DECLARE @UPDATETIME DATETIME

	SELECT @ID = PersonId FROM DELETED
	SELECT @NAME = PersonName FROM DELETED

	INSERT INTO PersonLog values(@ID,@NAME,'DELETE',GETDATE())
END

DELETE FROM PersonInfo WHERE PersonID = 2

SELECT * FROM PersonInfo
SELECT * FROM PersonLog

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
--INSERT
CREATE OR ALTER TRIGGER PersonLog_InstedOf_Trigger_Insert
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @ID INT
	DECLARE @NAME VARCHAR(250)
	DECLARE @OPERATION VARCHAR(50)
	DECLARE @UPDATETIME DATETIME

	SELECT @ID = PersonId FROM INSERTED
	SELECT @NAME = PersonName FROM INSERTED

	INSERT INTO PersonLog values(@ID,@NAME,'INSERT',GETDATE())
END

INSERT INTO PersonInfo VALUES(3,'JEVIN',122,'2006-1-29','RAJKOT',19,'2006-1-29')

SELECT * FROM PersonInfo
SELECT * FROM PersonLog

--UPDATE
CREATE OR ALTER TRIGGER PersonLog_InstedOf_Trigger_Update
ON PersonInfo
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @ID INT
	DECLARE @NAME VARCHAR(250)
	DECLARE @OPERATION VARCHAR(50)
	DECLARE @UPDATETIME DATETIME

	SELECT @ID = PersonId FROM INSERTED
	SELECT @NAME = PersonName FROM INSERTED

	INSERT INTO PersonLog values(@ID,@NAME,'UPDATE',GETDATE())
END

UPDATE PersonInfo
SET Salary = 121
WHERE PersonID = 1

SELECT * FROM PersonInfo
SELECT * FROM PersonLog

--DELETE
CREATE OR ALTER TRIGGER PersonLog_InstedOf_Trigger_Delete
ON PersonInfo
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @ID INT
	DECLARE @NAME VARCHAR(250)
	DECLARE @OPERATION VARCHAR(50)
	DECLARE @UPDATETIME DATETIME

	SELECT @ID = PersonId FROM DELETED
	SELECT @NAME = PersonName FROM DELETED

	INSERT INTO PersonLog values(@ID,@NAME,'DELETE',GETDATE())
END

DELETE FROM PersonInfo WHERE PersonID = 3

SELECT * FROM PersonInfo
SELECT * FROM PersonLog

--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into uppercase whenever the record is inserted.
CREATE OR ALTER TRIGGER PersonInfo_UPPECASE
ON PersonInfo
AFTER INSERT
AS
BEGIN
	DECLARE @ID INT
	DECLARE @NAME VARCHAR(250)

	SELECT @ID = PersonId FROM INSERTED
	SELECT @NAME = PersonName FROM INSERTED

	UPDATE PersonInfo
	SET PersonName = UPPER(@NAME)
	WHERE PersonID = @ID
END

INSERT INTO PersonInfo VALUES(4,'jevin',122,'2006-1-29','RAJKOT',19,'2006-1-29')

SELECT * FROM PersonInfo

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
CREATE OR ALTER TRIGGER Person_Deplicate
ON PersonInfo
AFTER INSERT
AS 
BEGIN
	INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
	SELECT PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate FROM INSERTED
	WHERE PersonName NOT IN (SELECT PersonName FROM PersonInfo)
END

INSERT INTO PersonInfo VALUES(11,'jevin',122,'2006-1-29','RAJKOT',19,'2006-1-29')

SELECT * FROM PersonInfo

--6. Create trigger that prevent Age below 18 years.

--Part – B
--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update that age in Person table.
--8. Create a Trigger to Limit Salary Decrease by a 10%.

--Part – C
--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL during an INSERT.
--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints ‘Record deleted successfully from PersonLog’.