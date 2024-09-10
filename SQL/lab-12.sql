-------------------------- LAB 12 -------------------------------------------------------

--Complex Joins --
-- Create following table (Using Design Mode) 

CREATE TABLE Dept
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Person
(
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Dept
    (DepartmentID, DepartmentName, DepartmentCode, Location)
VALUES
    (1, 'Admin', 'Adm', 'A-Block'),
    (2, 'Computer', 'CE', 'C-Block'),
    (3, 'Civil', 'CI', 'G-Block'),
    (4, 'Electrical', 'EE', 'E-Block'),
    (5, 'Mechanical', 'ME', 'B-Block');

INSERT INTO Person
    (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City)
VALUES
    (101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
    (102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
    (103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
    (104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
    (105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
    (106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
    (107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
    (108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
    (109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
    (110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

SELECT * FROM Dept;
SELECT * FROM Person;

-- Part – A:

-- 1. Find all persons with their department name & code.

SELECT PersonName , DepartmentName , DepartmentCode
FROM PERSON
    LEFT JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID;

-- 2. Find the person's name whose department is in C-Block.

SELECT PersonName , DepartmentName
FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE Location = 'C-Block';

-- 3. Retrieve person name, salary & department name who belongs to Jamnagar city.

SELECT PersonName , Salary , DepartmentName
FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE City = 'Jamnagar';

-- 4. Retrieve person name, salary & department name who does not belong to Rajkot city.

SELECT PersonName , Salary , DepartmentName , City
FROM PERSON
    LEFT JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE City <> 'Rajkot';

-- 5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.

SELECT PersonName , DepartmentName , JoiningDate
FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE JoiningDate > '1-Aug-2001' AND DepartmentName = 'CIVIL';

-- 6. Find details of all persons who belong to the computer department.

SELECT *
FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DepartmentName = 'COMPUTER';

-- 7. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.

SELECT PersonName , DepartmentName
FROM PERSON
    LEFT JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
WHERE DATEDIFF(DAY , JoiningDate , GETDATE()) > 365;

-- 8. Find department wise person counts.

SELECT DepartmentName , COUNT(PersonID) AS COUNT
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
GROUP BY DepartmentName;

-- 9. Give department wise maximum & minimum salary with department name.

SELECT DepartmentName , MAX(Salary) AS Max , MIN(Salary) AS Min
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
GROUP BY DepartmentName;

-- 10. Find city wise total, average, maximum and minimum salary.

SELECT City , MAX(Salary) AS Max , MIN(Salary) AS Min , AVG(Salary) AS AVG
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
GROUP BY City;

-- 11. Find the average salary of a person who belongs to Ahmedabad city.

SELECT AVG(Salary) AS AVG_Ahmedabad
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
WHERE City = 'Ahmedabad';

-- 12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)

SELECT PersonName+' lives in '+City+' and works in '+DepartmentName+' Department.'
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID;


-- Part – B:

-- 1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)

SELECT PersonName+' earns '+CONVERT(varchar,Salary)+' from '+DepartmentName+' department monthly.'
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID;

-- 2. Find city & department wise total, average & maximum salaries.

SELECT City , DepartmentName, MAX(Salary) AS Max , SUM(Salary) AS TOTAL , AVG(Salary) AS AVG
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
GROUP BY DepartmentName , City;

-- 3. Find all persons who do not belong to any department.

SELECT PersonName
FROM PERSON
    LEFT JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE PERSON.DepartmentID IS NULL;

-- 4. Find all departments whose total salary is exceeding 100000.

SELECT DepartmentName , SUM(Salary) AS Total
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
GROUP BY DepartmentName
HAVING SUM(Salary) > 100000;


-- Part – C:

-- 1. List all departments who have no person.

SELECT DepartmentName , COUNT(PersonID) AS COUNT
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
GROUP BY DepartmentName
HAVING COUNT(PersonID) = 0;

-- 2. List out department names in which more than two persons are working.

SELECT DepartmentName , COUNT(PersonID) AS COUNT
FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID = PERSON.DepartmentID
GROUP BY DepartmentName
HAVING COUNT(PersonID) > 2;

-- 3. Give a 10% increment in the computer department employee’s. (Use Update)

UPDATE PERSON
SET Salary = Salary + 0.1 * Salary
FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DepartmentName = 'Computer';

SELECT *
FROM PERSON;
