---Lab-3

--Select into Operation
--Part-A

--Create table as per following.

CREATE TABLE CRICKET
(
    NAME VARCHAR(50),
    CITY VARCHAR(20),
    AGE INT
);

INSERT INTO CRICKET
VALUES
    ('SACHIN TENDULKAR', 'MUMBAI', 30);
INSERT INTO CRICKET
VALUES
    ('Rahul Dravid' , 'Bombay', 35);
INSERT INTO CRICKET
VALUES
    ('M. S. Dhoni', 'Jharkhand', 31);
INSERT INTO CRICKET
VALUES
    ('Suresh Raina', 'Gujarat', 30);

--01.Create table Worldcup from cricket with all the columns and data.  

SELECT *
INTO WORLDCUP
FROM CRICKET

--02.Create table T20 from cricket with first two columns with no data. 

SELECT NAME, CITY
INTO T20
FROM CRICKET
WHERE 1=2

--03.Create table IPL From Cricket with No Data 

SELECT *
INTO IPL
FROM CRICKET
WHERE 1=2

SELECT *
FROM CRICKET
SELECT *
FROM WORLDCUP
SELECT *
FROM T20
SELECT *
FROM IPL

--Part-B

--Create table as per following.

CREATE TABLE EMPLOYEE
(
    NAME VARCHAR(50),
    CITY VARCHAR(20),
    AGE INT
);

INSERT INTO EMPLOYEE
VALUES
    ('JAY PATEL', 'RAJKOT', 30);
INSERT INTO EMPLOYEE
VALUES
    ('RAHUL DAVE', 'BARODA', 35);
INSERT INTO EMPLOYEE
VALUES
    ('JEET PATEL', 'SURAT', 31);
INSERT INTO EMPLOYEE
VALUES
    ('VIJAY RAVAL', 'RAJKOT', 30);

--01.Create table Employee_detail from Employee with all the columns and data.  

SELECT *
INTO Employee_detail
FROM EMPLOYEE

SELECT *
FROM Employee_detail

--02.Create table Employee_data from Employee with first two columns with no data. 

SELECT NAME, CITY
INTO Employee_data
FROM EMPLOYEE
WHERE 1=2

SELECT *
FROM Employee_data

--03.Create table Employee_info from Employee with no Data 

SELECT *
INTO Employee_info
FROM EMPLOYEE
WHERE 1=2

SELECT *
FROM Employee_info


--Part-C

--01.Insert the Data into Employee_info from Employee whose CITY is Rajkot

INSERT INTO Employee_info
SELECT *
FROM EMPLOYEE
WHERE CITY='RAJKOT'


--02.nsert the Data into Employee_info from Employee whose age is more than 32.

INSERT INTO Employee_info
SELECT *
FROM EMPLOYEE
WHERE AGE > 32

--------------------------------------------------------------------------------------------

--Update Operation
--Part-A

--01.Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT = 5000
WHERE AMOUNT=3000

--02.Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table) 

UPDATE BORROW
SET BNAME='C.G. ROAD'
WHERE CNAME='ANIL' AND BNAME='VRCE'

--03.Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table)

UPDATE DEPOSIT
SET ACTNO=111, AMOUNT=5000
WHERE CNAME='SANDIP'

--04.Update amount of KRANTI to 7000. (Use Deposit Table) 

UPDATE DEPOSIT
SET AMOUNT=7000
WHERE CNAME='KRANTI'

--05.Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table) 

UPDATE BRANCH
SET BNAME='ANDHERI WEST'
WHERE BNAME='ANDHERI'

--06.Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table) 

UPDATE DEPOSIT
SET BNAME='NEHRU PALACE'
WHERE CNAME='MEHUL'

--07.Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit Table) 

UPDATE DEPOSIT
SET AMOUNT=5000
WHERE ACTNO BETWEEN 103 AND 107

--08.Update ADATE of ANIL to 1-4-95. (Use Deposit Table) 

UPDATE DEPOSIT
SET ADATE='1995-04-01'
WHERE CNAME='ANIL'

--09.Update the amount of MINU to 10000. (Use Deposit Table) 

UPDATE DEPOSIT
SET AMOUNT=10000
WHERE CNAME='MINU'

--10.Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)

UPDATE DEPOSIT
SET AMOUNT=5000, ADATE='1996-04-01'
WHERE CNAME='PRAMOD'

SELECT *
FROM DEPOSIT
SELECT *
FROM BORROW

--Part-B

--01.Give 10% Increment in Loan Amount. (Use Borrow Table)

UPDATE BORROW
SET AMOUNT=AMOUNT+AMOUNT*0.1;

SELECT *
FROM BORROW

--02.Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table)


UPDATE DEPOSIT
SET AMOUNT=AMOUNT+AMOUNT*0.2;

SELECT *
FROM DEPOSIT


--Part-C

--01.Update amount of loan no 321 to NULL. (Use Borrow Table) 

UPDATE BORROW
set LOANNO=null
WHERE LOANNO=321

SELECT *
FROM BORROW

--02.Update branch name of KRANTI to NULL (Use Borrow Table) 

UPDATE BORROW
set BNAME=null
WHERE CNAME='KRANTI'

SELECT *
FROM BORROW

--03.Display the name of borrowers whose amount is NULL. 

SELECT *
FROM BORROW
WHERE CNAME IS NULL

--04.Display the Borrowers whose having branch. (Use Borrow Table)

SELECT *
FROM BORROW
WHERE CNAME IS NOT NULL

--05.Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481.(Use Borrow Table) 

UPDATE BORROW
SET AMOUNT=5000, BNAME='VRCE', CNAME='DARSHAN'
WHERE LOANNO=481

SELECT *
FROM BORROW

--06.Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less than 2000. 

UPDATE DEPOSIT
SET ADATE='2021-01-01'
WHERE AMOUNT<2000

SELECT *
FROM DEPOSIT

--07.Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 110. 

UPDATE DEPOSIT
SET ADATE=NULL, BNAME='ANDHERI'
WHERE ACTNO=110

SELECT *
FROM DEPOSIT