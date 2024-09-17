--- Perform SQL queries for Set operator and, Subqueries  
---  Sub Queries

CREATE TABLE STUDENT_DATA
(
    RNO INT,
    NAME VARCHAR(25),
    CITY VARCHAR(25),
    DID INT
);

CREATE TABLE ACADEMIC
(
    RNO INT,
    SPI DECIMAL(3,2),
    BKLOG INT
);

CREATE TABLE DEPARTMENT
(
    DID INT,
    DNAME VARCHAR(25)
);

INSERT INTO STUDENT_DATA
VALUES
    (101, 'Raju', 'Rajkot', 10 ),
    (102, 'Amit', 'Ahmedabad', 20 ),
    (103, 'Sanjay', 'Baroda', 40 ),
    (104, 'Neha', 'Rajkot', 20 ),
    (105, 'Meera', 'Ahmedabad', 30 ),
    (106, 'Mahesh', 'Baroda', 10);

SELECT *
FROM STUDENT_DATA

INSERT INTO ACADEMIC
VALUES
    (101, 8.8, 0 ),
    (102, 9.2, 2 ),
    (103, 7.6, 1 ),
    (104, 8.2, 4 ),
    (105, 7.0, 2 ),
    (106, 8.9, 3 );

SELECT *
FROM ACADEMIC

INSERT INTO DEPARTMENT
VALUES
    (10, 'Computer') ,
    (20, 'Electrical') ,
    (30, 'Mechanical') ,
    (40, 'Civil');

SELECT *
FROM DEPARTMENT

-- Part – A: 
-- 01. Display details of students who are from computer department. 

SELECT *
FROM STUDENT_DATA
WHERE DID=
        (SELECT DID
        FROM DEPARTMENT
        WHERE DNAME='COMPUTER');

-- 02. Displays name of students whose SPI is more than 8. 

SELECT NAME
FROM STUDENT_DATA
WHERE RNO IN
            (SELECT RNO
            FROM ACADEMIC
            WHERE SPI>8);

-- 03. Display details of students of computer department who belongs to Rajkot city. 

SELECT *
FROM STUDENT_DATA
WHERE CITY='RAJKOT' AND DID=
                            (SELECT DID
                                FROM DEPARTMENT
                                WHERE DNAME='COMPUTER')

-- 04. Find total number of students of electrical department. 

SELECT COUNT(RNO)
FROM STUDENT_DATA
WHERE DID=
        (SELECT DID
        FROM DEPARTMENT
        WHERE DNAME='ELECTRICAL')

-- 05. Display name of student who is having maximum SPI. 

SELECT NAME
FROM STUDENT_DATA
WHERE RNO IN
            (SELECT RNO
             FROM ACADEMIC
             WHERE SPI=
                        (SELECT MAX(SPI)
                        FROM ACADEMIC)
            );
-- 06. Display details of students having more than 1 backlog.

SELECT NAME
FROM STUDENT_DATA
WHERE RNO IN 
            (SELECT RNO
            FROM ACADEMIC
            WHERE BKLOG>1);

-- 1. Display name of students who are either from computer department or from mechanical department.

SELECT Name
FROM STUDENT_DATA
WHERE DID IN
            (SELECT DID
            FROM DEPARTMENT
            WHERE DNAME = 'COMPUTER' OR DNAME = 'MECHANICAL');

-- 2. Display name of students who are in same department as 102 studying in.

SELECT Name
FROM STUDENT_DATA
WHERE DID IN 
            (SELECT DID
            FROM STUDENT_DATA
            WHERE RNO = 102);


-- Part – C:

-- 1. Display name of students whose SPI is more than 9 and who is from electrical department.

SELECT Name
FROM STUDENT_DATA
WHERE DID = 
            (SELECT DID
            FROM DEPARTMENT
            WHERE DNAME = 'ELECTRICAL')
    AND RNO IN 
            (SELECT RNO
            FROM ACADEMIC
            WHERE SPI > 9);

-- 2. Display name of student who is having second highest SPI.

SELECT MAX(SPI)
FROM ACADEMIC
WHERE SPI < 
            (SELECT MAX(SPI)
            FROM ACADEMIC);

-- 3. Display city names whose students branch wise SPI is 9.2

SELECT CITY , DID
FROM STUDENT_DATA
WHERE RNO IN 
            (SELECT RNO
            FROM ACADEMIC
            WHERE SPI = 9.2)
GROUP BY DID , CITY;


-- SET OPERATORS

-- PART - A

CREATE TABLE Computer
(
    RollNo INT,
    Name VARCHAR(50)
);

INSERT INTO Computer
    (RollNo, Name)
VALUES
    (101, 'Ajay'),
    (109, 'Haresh'),
    (115, 'Manish');

CREATE TABLE Electrical
(
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Electrical
    (RollNo, Name)
VALUES
    (105, 'Ajay'),
    (107, 'Mahesh'),
    (115, 'Manish');

-- 1. Display name of students who is either in Computer or in Electrical.

    SELECT *
    FROM Electrical
UNION
    SELECT *
    FROM Computer;

-- 2. Display name of students who is either in Computer or in Electrical including duplicate data.

    SELECT *
    FROM Electrical
UNION ALL
    SELECT *
    FROM Computer;

-- 3. Display name of students who is in both Computer and Electrical.

    SELECT *
    FROM Electrical
INTERSECT
    SELECT *
    FROM Computer;

-- 4. Display name of students who are in Computer but not in Electrical.

    SELECT *
    FROM Computer
EXCEPT
    SELECT *
    FROM Electrical;

-- 5. Display name of students who are in Electrical but not in Computer.

    SELECT *
    FROM Electrical
EXCEPT
    SELECT *
    FROM Computer;

-- 6. Display all the details of students who are either in Computer or in Electrical.

    SELECT *
    FROM Computer
UNION
    SELECT *
    FROM Electrical;

-- 7. Display all the details of students who are in both Computer and Electrical.

    SELECT *
    FROM Computer
INTERSECT
    SELECT *
    FROM Electrical;


-- PART - B

CREATE TABLE Emp_DATA
(
    EID INT,
    Name VARCHAR(50)
);

INSERT INTO Emp_DATA
    (EID, Name)
VALUES
    (1, 'Ajay'),
    (9, 'Haresh'),
    (5, 'Manish');

CREATE TABLE Customer
(
    CID INT,
    Name VARCHAR(50)
);

INSERT INTO Customer
    (CID, Name)
VALUES
    (5, 'Ajay'),
    (7, 'Mahesh'),
    (5, 'Manish');

-- 1. Display name of persons who is either Employee or Customer.

    SELECT Name
    FROM Emp_DATA
UNION
    SELECT Name
    FROM Customer;

-- 2. Display name of persons who is either Employee or Customer including duplicate data.

    SELECT Name
    FROM Emp_DATA
UNION ALL
    SELECT Name
    FROM Customer;

-- 3. Display name of persons who is both Employee as well as Customer.

    SELECT Name
    FROM Emp_DATA
INTERSECT
    SELECT Name
    FROM Customer;

-- 4. Display name of persons who are Employee but not Customer.

    SELECT Name
    FROM Emp_DATA
EXCEPT
    SELECT Name
    FROM Customer;

-- 5. Display name of persons who are Customer but not Employee.

    SELECT Name
    FROM Customer
EXCEPT
    SELECT Name
    FROM Emp_DATA;


-- Part – C:


-- 1. Perform all the queries of Part-B but display ID and Name columns instead of Name only.

    SELECT *
    FROM Emp_DATA
UNION
    SELECT *
    FROM Customer;

    SELECT *
    FROM Emp_DATA
UNION ALL
    SELECT *
    FROM Customer;

    SELECT *
    FROM Emp_DATA
INTERSECT
    SELECT *
    FROM Customer;

    SELECT *
    FROM Emp_DATA
EXCEPT
    SELECT *
    FROM Customer;

    SELECT *
    FROM Customer
EXCEPT
    SELECT *
    FROM Emp_DATA;
