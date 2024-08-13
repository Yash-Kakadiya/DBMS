--- Lab 11 Implement SQL Joins

-- Create below tables as per following data

CREATE TABLE STU_INFO
(
    RNO INT PRIMARY KEY,
    NAME VARCHAR(25),
    BRANCH VARCHAR(25),
);

CREATE TABLE RESULT
(
    RNO INT FOREIGN KEY REFERENCES STU_INFO(RNO),
    SPI DECIMAL(3,2)
);

CREATE TABLE EMPLOYEE_MASTER
(
    EMPLOYEENO INT,
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
    (106, 8.9)

SELECT *
FROM RESULT

