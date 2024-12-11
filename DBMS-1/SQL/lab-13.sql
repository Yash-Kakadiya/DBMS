---------------------------- LAB 13 -----------------------------------------------------

--Advanced level Joins --

-- Part – A: Create table as per following data. 

CREATE TABLE City
(
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village
(
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City
    (CityID, Name, Pincode, Remarks)
VALUES
    (1, 'Rajkot', 360005, 'Good'),
    (2, 'Surat', 335009, 'Very Good'),
    (3, 'Baroda', 390001, 'Awesome'),
    (4, 'Jamnagar', 361003, 'Smart'),
    (5, 'Junagadh', 362229, 'Historic'),
    (6, 'Morvi', 363641, 'Ceramic');


INSERT INTO Village
    (VID, Name, CityID)
VALUES
    (101, 'Raiya', 1),
    (102, 'Madhapar', 1),
    (103, 'Dodka', 3),
    (104, 'Falla', 4),
    (105, 'Bhesan', 5),
    (106, 'Dhoraji', 5);

SELECT *
FROM City;
SELECT *
FROM Village;

-- 01. Display all the villages of Rajkot city.  

SELECT VILLAGE.NAME AS RAJKOT_VILLAGES
FROM VILLAGE JOIN CITY
    ON Village.CityID=City.CityID
WHERE CITY.Name='RAJKOT';

-- 02. Display city along with their villages & pin code. 

SELECT VILLAGE.NAME AS VILLAGES, City.Name AS CITY, Pincode
FROM VILLAGE JOIN CITY
    ON Village.CityID=City.CityID

-- 03. Display the city having more than one village. 

SELECT City.Name AS COUNT_1
FROM City JOIN Village
    ON Village.CityID=City.CityID
GROUP BY CITY.NAME
HAVING COUNT(Village.CityID)>1;

-- 04. Display the city having no village. 

SELECT City.Name
FROM City LEFT JOIN Village
    ON City.CityID=Village.CityID
GROUP BY City.Name
HAVING COUNT(VID)=0;

-- 05. Count the total number of villages in each city. 

SELECT City.Name, COUNT(VID) AS VILLAGES
FROM CITY LEFT JOIN Village
    ON City.CityID=Village.CityID
GROUP BY City.Name;

-- 06. Count the number of cities having more than one village. 

SELECT COUNT(CITY.CityID) AS COUNT
FROM CITY
WHERE CITY.NAME IN (
SELECT City.Name AS COUNT_1
FROM City JOIN Village
    ON Village.CityID=City.CityID
GROUP BY CITY.NAME
HAVING COUNT(Village.CityID)>1
);

-- Create below table with following constraints 
-- 01. Do not allow SPI more than 10 
-- 02. Do not allow Bklog less than 0. 
-- 03. Enter the default value as ‘General’ in branch to all new records IF no other value is specified. 

CREATE TABLE STU_MASTER
(
    RNO INT PRIMARY KEY,
    NAME VARCHAR(25),
    BRANCH CHAR(20) default 'GENERAL',
    SPI DECIMAL(4,2) CHECK (SPI<=10),
    BKLOG INT CHECK (BKLOG>=0)
);

INSERT INTO STU_MASTER
VALUES
    (101, 'Raju', 'CE', 8.80, 0 );
INSERT INTO STU_MASTER
VALUES
    (102, 'Amit', 'CE', 2.20, 3 );
INSERT INTO STU_MASTER
VALUES
    (103, 'Sanjay', 'ME', 1.50, 6 );
INSERT INTO STU_MASTER
VALUES
    (104, 'Neha', 'EC', 7.65 , 0 );
INSERT INTO STU_MASTER
VALUES
    (105, 'Meera', 'EE', 5.52, 2 );
INSERT INTO STU_MASTER
VALUES
    (106, 'Mahesh', default , 4.50, 3 );

SELECT *
FROM STU_MASTER

-- 04. Try to update SPI of Raju from 8.80 to 12. 

UPDATE STU_MASTER
SET SPI=12
WHERE NAME='RAJU';

-- 05. Try to update Bklog of Neha from 0 to -1. 

UPDATE STU_MASTER
SET BKLOG=-1
WHERE NAME='NEHA';

---------------------- PART B -------------------------

--Create table as per following schema with proper validation and try to insert data which violate your validation.
-- 01. Emp_details(Eid, Ename, Did, Cid, Salary, Experience)
-- Dept_details(Did, Dname)
-- City_details(Cid, Cname) 

CREATE TABLE Dept_DETAILS
(
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL

);

CREATE TABLE City_DETAILS
(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE Emp_DETAILS
(
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_DETAILS(Did),
    FOREIGN KEY (Cid) REFERENCES City_DETAILS(Cid)
);

INSERT INTO Dept_DETAILS
    (Did, Dname)
VALUES
    (1, 'HR'),
    (2, 'Engineering'),
    (3, 'Marketing');

INSERT INTO City_DETAILS
    (Cid, Cname)
VALUES
    (1, 'New York'),
    (2, 'Los Angeles'),
    (3, 'Chicago');

INSERT INTO Emp_DETAILS
    (Eid, Ename, Did, Cid, Salary, Experience)
VALUES
    (1, 'John Doe', 1, 1, 50000.00, 5),
    (2, 'Jane Smith', 2, 2, 75000.00, 8),
    (3, 'Mike Johnson', 3, 3, 60000.00, 3);

SELECT *
FROM EMP_DETAIL;
SELECT *
FROM City_DETAILS;
SELECT *
FROM Dept_DETAILS;

-- try to insert data which violate your validation.

INSERT INTO Emp_DETAILS
VALUES
    (11, 'Johnny Doe', 1, 1, -10, -5);


----------------------- PART C -----------------------

--Create table as per following schema with proper validation and try to insert data which violate your validation.

-- 01.
-- Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
-- Dept_info(Did, Dname) 
-- City_info(Cid, Cname, Did)) 
-- District(Did, Dname, Sid) 
-- State(Sid, Sname, Cid) 
-- Country(Cid, Cname) 


CREATE TABLE Country_INFO
(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE State_INFO
(
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country_INFO(Cid)
);

CREATE TABLE District_INFO
(
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State_INFO(Sid)
);

CREATE TABLE Dept_INFO
(
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_INFO
(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District_INFO(Did)
);

CREATE TABLE Emp_INFO
(
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_INFO(Did),
    FOREIGN KEY (Cid) REFERENCES City_INFO(Cid)
);


-- 02. Insert 5 records in each table. 

INSERT INTO Country_INFO
    (Cid, Cname)
VALUES
    (1, 'USA'),
    (2, 'Canada'),
    (3, 'UK'),
    (4, 'Australia'),
    (5, 'India');

INSERT INTO State_INFO
    (Sid, Sname, Cid)
VALUES
    (1, 'California', 1),
    (2, 'Ontario', 2),
    (3, 'London', 3),
    (4, 'New South Wales', 4),
    (5, 'Gujarat', 5);

INSERT INTO District_INFO
    (Did, Dname, Sid)
VALUES
    (1, 'Los Angeles', 1),
    (2, 'Toronto', 2),
    (3, 'Westminster', 3),
    (4, 'Sydney', 4),
    (5, 'Ahmedabad', 5);


INSERT INTO Dept_INFO
    (Did, Dname)
VALUES
    (1, 'HR'),
    (2, 'Engineering'),
    (3, 'Marketing'),
    (4, 'Sales'),
    (5, 'Finance');

INSERT INTO City_INFO
    (Cid, Cname, Did)
VALUES
    (1, 'Los Angeles City', 1),
    (2, 'Toronto City', 2),
    (3, 'London City', 3),
    (4, 'Sydney City', 4),
    (5, 'Ahmedabad City', 5);

INSERT INTO Emp_INFO
    (Eid, Ename, Did, Cid, Salary, Experience)
VALUES
    (1, 'John Doe', 1, 1, 50000.00, 5),
    (2, 'Jane Smith', 2, 2, 75000.00, 8),
    (3, 'Mike Johnson', 3, 3, 60000.00, 3),
    (4, 'Alice Brown', 4, 4, 45000.00, 2),
    (5, 'Bob Green', 5, 5, 40000.00, 4);

SELECT *
FROM Emp_INFO;
SELECT *
FROM Dept_INFO;
SELECT *
FROM City_INFO;
SELECT *
FROM District_INFO;
SELECT *
FROM State_INFO;
SELECT *
FROM Country_INFO;

-- 03. Display  employeename,  departmentname,  Salary,  Experience,  City,  District,  State  and  country  of  all employees.

SELECT Emp_INFO.Ename, Dept_INFO.Dname, Emp_INFO.Salary, Emp_INFO.Experience, City_INFO.Cname, District_INFO.Dname, State_INFO.Sname, Country_INFO.Cname
FROM Emp_INFO JOIN Dept_INFO
    ON Emp_INFO.Did=Dept_INFO.Did
    JOIN City
    ON Emp_INFO.Cid=City_INFO.Cid
    JOIN District_INFO
    ON Emp_INFO.Did=District_INFO.Did
    JOIN State_INFO
    ON District_INFO.Sid=State_INFO.Sid
    JOIN Country_INFO
    ON State_INFO.Cid=Country_INFO.Cid;