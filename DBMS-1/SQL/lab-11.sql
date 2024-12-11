--- Lab 11 Implement SQL Joins

-- Create below tables as per following data

CREATE TABLE STU_INFO
(
    RNO INT,
    NAME VARCHAR(25),
    BRANCH VARCHAR(25),
);

CREATE TABLE RESULT
(
    RNO INT,
    SPI DECIMAL(2,1)
);

CREATE TABLE EMPLOYEE_MASTER
(
    EMPLOYEENO CHAR(3),
    NAME VARCHAR(25),
    MANAGERNO CHAR(3)
);

INSERT INTO STU_INFO
VALUES
    (101, 'Raju', 'CE'),
    (102, 'Amit', 'CE'),
    (103, 'Sanjay', 'ME'),
    (104, 'Neha', 'EC'),
    (105, 'Meera', 'EE'),
    (106, 'Mahesh', 'ME')

SELECT *
FROM STU_INFO

INSERT INTO RESULT
VALUES
    (101, 8.8),
    (102, 9.2),
    (103, 7.6),
    (104, 8.2),
    (105, 7.0),
    (107, 8.9);

SELECT *
FROM RESULT

INSERT INTO EMPLOYEE_MASTER
VALUES
    ('E01', 'Tarun', NULL),
    ('E02', 'Rohan', 'E02'),
    ('E03', 'Priya', 'E01'),
    ('E04', 'Milan', 'E03'),
    ('E05', 'Jay', 'E01'),
    ('E06', 'Anjana', 'E04');

SELECT *
FROM EMPLOYEE_MASTER

-- Part – A: 

-- 01. Combine information from student and result table using cross join or Cartesian product. 

SELECT *
FROM STU_INFO CROSS JOIN RESULT

-- 02. Perform inner join on Student and Result tables. 

SELECT *
FROM STU_INFO INNER JOIN RESULT
    ON STU_INFO.RNO=RESULT.RNO;

-- 03. Perform the left outer join on Student and Result tables. 

SELECT *
FROM STU_INFO LEFT OUTER JOIN RESULT
    ON STU_INFO.RNO=RESULT.RNO;

-- 04. Perform the right outer join on Student and Result tables. 

SELECT *
FROM STU_INFO RIGHT OUTER JOIN RESULT
    ON STU_INFO.RNO=RESULT.RNO;

-- 05. Perform the full outer join on Student and Result tables.  

SELECT *
FROM STU_INFO FULL OUTER JOIN RESULT
    ON STU_INFO.RNO=RESULT.RNO;

-- 06. Display Rno, Name, Branch and SPI of all students. 

SELECT STU_INFO.RNO, NAME, BRANCH, SPI
FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO=RESULT.RNO;

-- 07. Display Rno, Name, Branch and SPI of CE branch’s student only. 

SELECT STU_INFO.RNO, NAME, BRANCH, SPI
FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO=RESULT.RNO
WHERE BRANCH='CE';

-- 08. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 

SELECT STU_INFO.RNO, NAME, BRANCH, SPI
FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO=RESULT.RNO
WHERE BRANCH<>'EC';

-- 09. Display average result of each branch. 

SELECT BRANCH, AVG(SPI) AS AVERAGE
FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO=RESULT.RNO
GROUP BY BRANCH;

-- 10.  Display average result of CE and ME branch. 

SELECT BRANCH, AVG(SPI) AS AVERAGE
FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO=RESULT.RNO
GROUP BY BRANCH
HAVING BRANCH IN ('CE','ME');

-- Part – B: 

-- 01. Display average result of each branch and sort them in ascending order by SPI. 

SELECT BRANCH, AVG(SPI) AS AVERAGE
FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO=RESULT.RNO
GROUP BY BRANCH
ORDER BY AVG(SPI);

-- 02. Display highest SPI from each branch and sort them in descending order.

SELECT BRANCH, MAX(SPI) AS MAX
FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO=RESULT.RNO
GROUP BY BRANCH
ORDER BY MAX(SPI) DESC;

-- Part – C: 

-- 01. Retrieve the names of employee along with their manager’s name from the Employee table

SELECT E1.NAME, E2.NAME AS MANAGER
FROM EMPLOYEE_MASTER AS E1 JOIN EMPLOYEE_MASTER AS E2
ON E1.MANAGERNO= E2.EMPLOYEENO;
