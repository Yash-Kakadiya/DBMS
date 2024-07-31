---lab-06- Implement SQL In-built functions (Math, String, and Date Functions)

--- Math functions

-- Part – A: 

-- 01. Display the result of 5 multiply by 30.

SELECT (5*30)

-- 02. Find out the absolute value of -25, 25, -50 and 50. 

SELECT ABS(-25), ABS(25), ABS(-50), ABS(50)

-- 03. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 

SELECT CEILING(25.2), CEILING(25.7), CEILING(-25.2)

-- 04. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 

SELECT FLOOR(25.2), FLOOR(25.7), FLOOR(-25.2)

-- 05. Find out remainder of 5 divided 2 and 5 divided by 3. 

SELECT (5%2), (5%3)

-- 06. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 

SELECT POWER(3,2), POWER(4,3)

-- 07. Find out the square root of 25, 30 and 50. 

SELECT SQRT(25), SQRT(30), SQRT(50)

-- 08. Find out the square of 5, 15, and 25. 

SELECT SQUARE(5), SQUARE(15), SQUARE(25)

--09. Find out the value of PI. 

SELECT PI()

--10.  Find out round value of 157.732 for 2, 0 and -2 decimal points. 

SELECT ROUND(157.732,2), ROUND(157.732,0), ROUND(157.732,-2)

--11.  Find out exponential value of 2 and 3. 

SELECT EXP(2), EXP(3)

--12.  Find out logarithm having base e of 10 and 2. 

SELECT LOG(10), LOG(2)

--13.  Find out logarithm having base b having value 10 of 5 and 100. 

SELECT LOG10(5), LOG10(100)

--14.  Find sine, cosine and tangent of 3.1415. 

SELECT SIN(3.1415), COS(3.1415), TAN(3.1415)

--15.  Find sign of -25, 0 and 25. 

SELECT SIGN(-25), SIGN(0), SIGN(25)

--16.  Generate random number using function.

SELECT RAND();

--Part-B

-- Create and Insert the following records in the EMP_MASTER table.

CREATE TABLE EMP_MASTER
(
    EMPNO INT,
    EMPNAME VARCHAR(25),
    JOININGDATE DATE,
    SALARY DECIMAL(7,2),
    COMMISSION DECIMAL(4,0),
    CITY VARCHAR(25),
    DEPTCODE VARCHAR(5)
);

INSERT INTO EMP_MASTER
VALUES(101, 'Keyur', '5-1-02', 12000.00, 4500, 'Rajkot', '3@g'),
    (102, 'Hardik', '2-15-04', 14000.00, 2500, 'Ahmedabad', '3@'),
    (103, 'Kajal', '3-14-06', 15000.00, 3000, 'Baroda', '3-GD' ),
    (104, 'Bhoomi', '6-26-05', 12500.00, 1000, 'Ahmedabad', '1A3D'),
    (105, 'Harmit', '2-15-04', 14000.00, 2000, 'Rajkot', '312A');

SELECT *
FROM EMP_MASTER

--01. Display the result of Salary plus Commission. 

SELECT EMPNAME, (SALARY+COMMISSION) AS TOTAL
FROM EMP_MASTER

--02. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2. 

SELECT CEILING(55.2), CEILING(35.7), CEILING(-55.2)

--03. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2. 

SELECT FLOOR(55.2), FLOOR(35.7), FLOOR(-55.2)

--04. Find out remainder of 55 divided 2 and 55 divided by 3. 

SELECT (55%2), (55%3)

--05. Find out value of 23 raised to 2nd power and 14 raised 3rd power.

SELECT POWER(23,2), POWER(14,3)

-- Part – C: 

-- 01. Find out the square root of 36, 49 and 81. 

SELECT SQRT(36), SQRT(49), SQRT(81)

-- 02. Find out the square of 3, 9, and 12. 

SELECT SQUARE(3), SQUARE(9), SQUARE(12)

-- 03. Find out round value of 280.8952 for 2, 0 and -2 decimal points. 

SELECT ROUND(280.8952,2), ROUND(280.8952,0), ROUND(280.8952,-2)

-- 04. Find sine, cosine and tangent of 4.2014. 

SELECT SIN(4.2014), COS(4.2014), TAN(4.2014)

-- 05. Find sign of -55, 0 and 95.

SELECT sign(-55), sign(0), sign(95)

--- String functions

-- Part – A: 
-- 01. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 

SELECT LEN(NULL), LEN('   hello     '), LEN('');

-- 02. Display your name in lower & upper case. 

SELECT UPPER('YASH'), LOWER('YASH')

-- 03. Display first three characters of your name. 

SELECT SUBSTRING('YASH',1,3)

-- 04. Display 3rd to 10th character of your name. 

SELECT SUBSTRING('YASH KAKADIYA',3,(10-3));

-- 05. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 

SELECT REPLACE('abc123efg','123','XYZ'), REPLACE('abcabcabc','C','5')

-- 06. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 

SELECT ASCII('a'), ASCII('A'), ASCII('z'), ASCII('Z'), ASCII(0), ASCII(9)

-- 07. Write a query to display character based on number 97, 65,122,90,48,57. 

SELECT CHAR(97), CHAR(65), CHAR(122), CHAR(90), CHAR(48), CHAR(57)

-- 08. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 

SELECT LTRIM('   hello world  ')

-- 09. Write a query to remove spaces from right of a given string ‘ hello world  ‘. 

SELECT RTRIM(' hello world  ')

-- 10.  Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 

SELECT LEFT('SQL Server',4), RIGHT('SQL Server',5)

-- 11.  Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 

SELECT CAST('1234.56' AS DECIMAL(6,2)), CONVERT(DECIMAL(6,2),'1234.56')

-- 12.  Write a query to convert a float 10.58 to integer (Use cast and convert function). 

SELECT CAST(10.58 AS INT), CONVERT(INT, 10.58)

-- 13.  Put 10 space before your name using function. 

SELECT SPACE(10)+'YASH'
SELECT REPLICATE(' ',10)+'YASH'

-- 14.  Combine two strings using + sign as well as CONCAT (). 

SELECT ('YASH'+' KAKADIYA'), CONCAT('YASH',' KAKADIYA')

-- 15.  Find reverse of “Darshan”. 

SELECT REVERSE('DARSHAN')

-- 16.  Repeat your name 3 times. 

SELECT REPLICATE('YASH ',3)

