---lab-07

---Perform SQL queries for Aggerate function and group by (without having) 
--Part-A

--Create table and inset records as per below.
CREATE TABLE EMP
(
    EID INT,
    ENAME VARCHAR(25),
    Department VARCHAR(25),
    Salary DECIMAL(5,0),
    JoiningDate DATETIME,
    City VARCHAR(25),
);

INSERT INTO EMP
VALUES
    (101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
    (102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
    (103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
    (104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
    (105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
    (106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
    (107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot');

SELECT *
FROM EMP;

--01. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.

SELECT MAX(SALARY) AS MAXIMUM, MIN(SALARY) AS MINIMUM
FROM EMP;

--02. Display  Total,  and  Average  salary  of  all  employees.  Label  the  columns  Total_Sal  and  Average_Sal, respectively. 

SELECT SUM(SALARY) AS Total_Sal, AVG(SALARY) AS Average_Sal
FROM EMP;

--03. Find total number of employees of EMPLOYEE table. 

SELECT COUNT(EID) AS NO_OF_Employees
FROM EMP;

--04. Find highest salary from Rajkot city. 

SELECT MAX(SALARY) AS Highest_Salary_Rajkot
FROM EMP
WHERE City='RAJKOT'

--05. Give maximum salary from IT department. 

SELECT MAX(SALARY) AS Highest_Salary_IT
FROM EMP
WHERE Department='IT'

--06. Count employee whose joining date is after 8-feb-91. 

SELECT COUNT(EID) AS JOINING_AFTER_8_FEB_1991
FROM EMP
WHERE JoiningDate>'1991-02-08'

--07. Display average salary of Admin department. 

--08. Display total salary of HR department. 

--09. Count total number of cities of employee without duplication. 

--10.  Count unique departments. 

--11.  Give minimum salary of employee who belongs to Ahmedabad. 

--12.  Find city wise highest salary. 

--13.  Find department wise lowest salary. 

--14.  Display city with the total number of employees belonging to each city. 

--15.  Give total salary of each department of EMP table. 

--16.  Give  average  salary  of  each  department  of  EMP  table  without  displaying  the  respective  department name. 
