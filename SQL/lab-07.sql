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

SELECT AVG(Salary) AS AVG_ADMIN_SALARY
FROM EMP
WHERE Department='ADMIN';

--08. Display total salary of HR department. 

SELECT SUM(Salary) AS TOTAL_HR_SALARY
FROM EMP
WHERE Department='HR';

--09. Count total number of cities of employee without duplication. 

SELECT COUNT(DISTINCT CITY) AS TOTAL_CITIES
FROM EMP

--10.  Count unique departments. 

SELECT COUNT(DISTINCT Department) AS UNIQUE_DEPARTMENTS
FROM EMP

--11.  Give minimum salary of employee who belongs to Ahmedabad. 

SELECT MIN(Salary) AS AHMEDABAD_MIN_SALARY
FROM EMP
WHERE CITY='AHMEDABAD';

--12.  Find city wise highest salary. 

SELECT CITY, MAX(SALARY) AS CITY_HIGHEST
FROM EMP
GROUP BY CITY

--13.  Find department wise lowest salary. 

SELECT Department, MIN(SALARY) AS Department_LOWEST
FROM EMP
GROUP BY Department

--14.  Display city with the total number of employees belonging to each city. 

SELECT CITY, SUM(SALARY) AS TOTAL_EMPS_CITY_WISE
FROM EMP
GROUP BY CITY

--15.  Give total salary of each department of EMP table. 

SELECT Department, SUM(SALARY) AS TOTAL_DEPARTMENT_WISE
FROM EMP
GROUP BY Department

--16.  Give  average  salary  of  each  department  of  EMP  table  without  displaying  the  respective  department name. 

SELECT AVG(SALARY) AS AVG_DEPARTMENT_WISE
FROM EMP
GROUP BY Department

--Part-B

--01. Count the number of employees living in Rajkot.

SELECT COUNT(EID) AS EMPS_IN_RAJKOT
FROM EMP
WHERE City='RAJKOT'

--02. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 

SELECT (MAX(Salary)-MIN(Salary)) AS DIFFERENCE
FROM EMP

--03. Display the total number of employees hired before 1st January, 1991.

SELECT COUNT(EID) AS HIRED_BEFORE_1st_January_1991
FROM EMP
WHERE JoiningDate<'1991-01-01'

--Part-C

--01. Count the number of employees living in Rajkot or Baroda. 

SELECT COUNT(EID) AS EMPS_IN_RAJKOT_OR_BARODA
FROM EMP
WHERE City IN ('RAJKOT','BARODA')

--02. Display the total number of employees hired before 1st January, 1991 in IT department. 

SELECT COUNT(EID) AS EMPS_IN_RAJKOT_OR_BARODA
FROM EMP
WHERE JoiningDate<'1991-01-01' AND Department='IT'

--03. Find the Joining Date wise Total Salaries. 

SELECT JoiningDate, SUM(SALARY) AS Joining_Date_Wise_Total_Salaries
FROM EMP
GROUP BY JoiningDate

--04. Find the Maximum salary department & city wise in which city name starts with ‘R’.

SELECT Department, CITY, MAX(SALARY) AS MAX_Salary_Department_With_City_Starts_With_R
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY  DEPARTMENT,CITY
