---lab-04

---Alter Operation
--Part-A

--01.Add two more columns City VARCHAR (20) and Pincode INT.

ALTER TABLE DEPOSIT
ADD CITY VARCHAR(20), PINCODE INT;

SELECT *
FROM DEPOSIT

--02.Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).

ALTER TABLE DEPOSIT
ALTER COLUMN CNAME VARCHAR(35);

SELECT *
FROM DEPOSIT;

--03.Change the data type DECIMAL to INT in amount Column.

ALTER TABLE DEPOSIT
ALTER COLUMN AMOUNT INT;

SELECT *
FROM DEPOSIT;

--04.Rename Column ActNo to ANO. 

SP_RENAME 'DEPOSIT.ACTNO', 'ANO';
--WRITE EXEC BEFORE SP_RENAME IF NOT WORKED

SELECT *
FROM DEPOSIT;

--05.Delete Column City from the DEPOSIT table.

ALTER TABLE DEPOSIT
DROP COLUMN CITY;

SELECT *
FROM DEPOSIT;

--06.Change name of table DEPOSIT to DEPOSIT_DETAIL.

SP_RENAME 'DEPOSIT', 'DEPOSIT_DETAIL';
--WRITE EXEC BEFORE SP_RENAME IF NOT WORKED

-- SELECT * FROM DEPOSIT;

SELECT *
FROM DEPOSIT_DETAIL;

--PATR-B

--01.Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.

SP_RENAME 'DEPOSIT_DETAIL.ADATE', 'AOPENDATE';

SELECT *
FROM DEPOSIT_DETAIL;

--02.Delete Column AOPENDATE from the DEPOSIT_DETAIL table.

ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN AOPENDATE


SELECT *
FROM DEPOSIT_DETAIL;

--03.Rename Column CNAME to CustomerName.

SP_RENAME 'DEPOSIT_DETAIL.CNAME', 'CUSTOMBERNAME';

SELECT *
FROM DEPOSIT_DETAIL;

--Part-C

--Create following table using query according to the definition.

CREATE TABLE STUDENT_DETAIL
(
    ENROLLMENT_NO VARCHAR(20),
    NAME VARCHAR(25),
    CPI DECIMAL(5,2),
    BIRTHDATE DATETIME
);

-- 01.Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null)

ALTER TABLE STUDENT_DETAIL
ADD CITY VARCHAR(20) NOT NULL, BACKLOG INT NOT NULL

SELECT *
FROM STUDENT_DETAIL

--02.Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN NAME VARCHAR(35);

SELECT *
FROM STUDENT_DETAIL


--03.Change the data type DECIMAL to INT in CPI Column.

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN CPI INT;

SELECT *
FROM STUDENT_DETAIL

--04.Rename Column Enrollment_No to ENO.

SP_RENAME
'STUDENT_DETAIL.ENROLLMENT_NO', 'ENO';

SELECT *
FROM STUDENT_DETAIL;

--05.Delete Column City from the student_detail table.

ALTER TABLE STUDENT_DETAIL
DROP COLUMN CITY;

SELECT *
FROM STUDENT_DETAIL;

--06.Change name of table student_detail to STUDENT_MASTER. 


SP_RENAME
'STUDENT_DETAIL', 'STUDENT_MASTER';

SELECT *
FROM STUDENT_MASTER;


---DELETE, Truncate, Drop Operation
--Part-A

--01.Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.  

DELETE FROM DEPOSIT_DETAIL
WHERE AMOUNT>4000;

SELECT*
FROM DEPOSIT_DETAIL;

--02.Delete all the accounts CHANDI BRANCH. 

DELETE FROM DEPOSIT_DETAIL
WHERE BNAME='CHANDI';

SELECT*
FROM DEPOSIT_DETAIL;

--03.Delete all the accounts having account number (ANO) is greater than 105. 

DELETE FROM DEPOSIT_DETAIL
WHERE ANO>105;

SELECT*
FROM DEPOSIT_DETAIL;

--04.Delete all the records of Deposit_Detail table. (Use Truncate) 

TRUNCATE TABLE DEPOSIT_DETAIL;

SELECT*
FROM DEPOSIT_DETAIL;

--05.Remove Deposit_Detail table. (Use Drop) 

DROP TABLE DEPOSIT_DETAIL;

-- SELECT* FROM DEPOSIT_DETAIL;

--Part-B

--Create following table using query according to the definition.
CREATE TABLE EMPLOYEE_MASTER
(
    EMPNO INT,
    EMPNAME VARCHAR(25),
    JOININGDATE DATETIME,
    SALARY DECIMAL(8,2),
    CITY VARCHAR(20)
);

--Insert the following records in the EMPLOYEE_MASTER table.
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('101', 'KEYUR', '2002-01-05', 12000.00, 'Rajkot');
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('102', 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad');
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('103', 'Kajal', '2006-03-14', 15000.00, 'Baroda');
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('104', 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad');
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('105', 'Harmit', '2004-02-15', 14000.00, 'Rajkot');
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('106', 'Mitesh', '2001-09-25', 5000.00, 'Jamnagar');
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('107', 'Meera', NULL, 7000.00, 'Morbi');
INSERT INTO EMPLOYEE_MASTER
VALUES
    ('108', 'Kishan', '2003-02-06', 10000.00, NULL);

SELECT *
FROM EMPLOYEE_MASTER

--01.Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.  

DELETE FROM EMPLOYEE_MASTER
WHERE SALARY>=14000

SELECT *
FROM EMPLOYEE_MASTER

--02.Delete all the Employees who belongs to ‘RAJKOT’ city. 

DELETE FROM EMPLOYEE_MASTER
WHERE CITY='RAJKOT';

SELECT *
FROM EMPLOYEE_MASTER

--03.Delete all the Employees who joined after 1-1-2007. 

DELETE FROM EMPLOYEE_MASTER
WHERE JOININGDATE>'2007-01-01';

SELECT *
FROM EMPLOYEE_MASTER

--04.Delete the records of Employees whose joining date is null and Name is not null. 

DELETE FROM EMPLOYEE_MASTER
WHERE JOININGDATE IS NULL AND EMPNAME IS NOT NULL;

SELECT *
FROM EMPLOYEE_MASTER

--05.Delete the records of Employees whose salary is 50% of 20000.

DELETE FROM EMPLOYEE_MASTER
WHERE SALARY = 20000*0.5;

SELECT *
FROM EMPLOYEE_MASTER

--06.Delete the records of Employees whose City Name is not empty.

DELETE FROM EMPLOYEE_MASTER
WHERE CITY IS NOT NULL;

SELECT *
FROM EMPLOYEE_MASTER

--07.Delete all the records of Employee_MASTER table. (Use Truncate).

TRUNCATE TABLE EMPLOYEE_MASTER;

SELECT *
FROM EMPLOYEE_MASTER

--08.Remove Employee_MASTER table. (Use Drop)

DROP TABLE EMPLOYEE_MASTER

-- SELECT * FROM EMPLOYEE_MASTER
