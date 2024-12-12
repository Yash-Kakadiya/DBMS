--->Lab-2-Stored Procedure

-- Create Department Table
CREATE TABLE Department
(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation
(
	DesignationID INT PRIMARY KEY,
	DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person
(
	PersonID INT PRIMARY KEY IDENTITY(101,1),
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Salary DECIMAL(8, 2) NOT NULL,
	JoiningDate DATETIME NOT NULL,
	DepartmentID INT NULL,
	DesignationID INT NULL,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

--From the above given tables create Stored Procedures:
--Part � A
--01. Department, Designation & Person Table�s INSERT, UPDATE & DELETE Procedures.

CREATE OR ALTER PROC PR_PERSON_INSERT
	@FirstName  VARCHAR(100),
	@LastName  VARCHAR(100),
	@Salary  Decimal (8,2),
	@JoiningDate  Datetime ,
	@DepartmentID  INT,
	@DesignationID INT
AS
BEGIN
	INSERT INTO Person
	VALUES
		(@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentID, @DesignationID)
END;

CREATE OR ALTER PROC PR_PERSON_UPDATE
	@PersonID INT,
	@FirstName  VARCHAR(100),
	@LastName  VARCHAR(100),
	@Salary  Decimal (8,2),
	@JoiningDate  Datetime ,
	@DepartmentID  INT,
	@DesignationID INT
AS
BEGIN
	UPDATE PERSON
	SET FirstName = @FirstName, LastName= @LastName, Salary= @Salary, JoiningDate= @JoiningDate, DepartmentID= @DepartmentID, DesignationID= @DesignationID
	WHERE PersonID = @PersonID;
END;

CREATE OR ALTER PROC PR_PERSON_DELETE
	@PersonID INT
AS
BEGIN
	DELETE FROM Person
	WHERE PersonID=@PersonID;
END;

--------------------------------------------------

CREATE OR ALTER PROC PR_DEPARTMENT_INSERT
	@DepartmentID INT,
	@DepartmentName Varchar (100)
AS
BEGIN
	INSERT INTO DEPARTMENT
	VALUES
		(@DepartmentID, @DepartmentName);
END;

CREATE OR ALTER PROC PR_DEPARTMENT_UPDATE
	@DepartmentID INT,
	@DepartmentName Varchar (100)
AS
BEGIN
	UPDATE DEPARTMENT
	SET DepartmentName=@DepartmentName
	WHERE DepartmentID = @DepartmentID;
END;

CREATE OR ALTER PROC PR_DEPARTMENT_DELETE
	@DepartmentID INT
AS
BEGIN
	DELETE FROM DEPARTMENT
	WHERE DepartmentID=@DepartmentID;
END;

--------------------------------------------------

CREATE OR ALTER PROC PR_Designation_INSERT
	@DesignationID  INT,
	@DesignationName Varchar (100)
AS
BEGIN
	INSERT INTO Designation
	VALUES
		(@DesignationID, @DesignationName);
END;

CREATE OR ALTER PROC PR_Designation_UPDATE
	@DesignationID INT,
	@DesignationName Varchar (100)
AS
BEGIN
	UPDATE Designation
	SET DesignationName=@DesignationName
	WHERE DesignationID = @DesignationID;
END;

CREATE OR ALTER PROC PR_Designation_DELETE
	@DesignationID INT
AS
BEGIN
	DELETE FROM Designation
	WHERE DesignationID=@DesignationID;
END;

--------------------------------------------------

EXEC PR_DEPARTMENT_INSERT 1, 'Admin';
EXEC PR_DEPARTMENT_INSERT 2, 'IT';
EXEC PR_DEPARTMENT_INSERT 3, 'HR';
EXEC PR_DEPARTMENT_INSERT 4, 'ACCOUNT';
SELECT *
FROM Department

EXEC PR_Designation_INSERT 11, 'Jobber'
EXEC PR_Designation_INSERT 12, 'Welder'
EXEC PR_Designation_INSERT 13, 'Clerk'
EXEC PR_Designation_INSERT 14, 'Manager'
EXEC PR_Designation_INSERT 15, 'CEO'
SELECT *
FROM Designation

EXEC PR_PERSON_INSERT 'Rahul', 'Anshu', 56000, '01-01-1990', 1, 12
EXEC PR_PERSON_INSERT 'Hardik', 'Hinsu', 18000, '09-25-1990', 2, 11
EXEC PR_PERSON_INSERT 'Bhavin', 'Kamani', 25000, '05-14-1991', NULL, 11
EXEC PR_PERSON_INSERT 'Bhoomi', 'Patel', 39000, '02-20-2014', 1, 13
EXEC PR_PERSON_INSERT 'Rohit', 'Rajgor', 17000, '07-23-1990', 2, 15
EXEC PR_PERSON_INSERT 'Priya', 'Mehta', 25000, '10-18-1990', 2, NULL
EXEC PR_PERSON_INSERT 'Neha', 'Trivedi', 18000, '02-20-2014', 3, 15
SELECT *
FROM Person

--02. Department, Designation & Person Table�s SELECTBYPRIMARYKEY.

CREATE OR ALTER PROC PR_Department_SELECTBYPRIMARYKEY
	@DepartmentID INT
AS
BEGIN
	SELECT *
	FROM
		Department
	WHERE DepartmentID=@DepartmentID;
END;

CREATE OR ALTER PROC PR_Designation_SELECTBYPRIMARYKEY
	@DesignationID INT
AS
BEGIN
	SELECT *
	FROM
		Designation
	WHERE DesignationID=@DesignationID;
END;

CREATE OR ALTER PROC PR_Person_SELECTBYPRIMARYKEY
	@PersonID INT
AS
BEGIN
	SELECT *
	FROM
		Person
	WHERE PersonID=@PersonID;
END;

--03. Department, Designation & Person Table�s (If foreign key is available then do write join and take
--columns on select list)

CREATE OR ALTER PROC PR_Person_SelectAll
AS
BEGIN
	SELECT *
	FROM Person P
		JOIN Department D
		ON P.DepartmentID=D.DepartmentID
		JOIN Designation DG
		ON P.DesignationID=DG.DesignationID;
END

--04. Create a Procedure that shows details of the first 3 persons.

CREATE OR ALTER PROC PR_Department_TOP3
AS
BEGIN
	SELECT TOP 3
		*
	FROM
		Department
END;

CREATE OR ALTER PROC PR_Designation_TOP3
AS
BEGIN
	SELECT TOP 3
		*
	FROM
		Designation
END;

CREATE OR ALTER PROC PR_Person_TOP3
AS
BEGIN
	SELECT TOP 3
		*
	FROM
		Person
END;