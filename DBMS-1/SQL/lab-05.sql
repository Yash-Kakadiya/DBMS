---lab-05

---Perform SQL queries for Like operator
--Part-A

--Create following table using query according to the definition.

CREATE TABLE STUDENT
(
    STUID INT,
    FIRSTNAME VARCHAR(25),
    LASTNAME VARCHAR(25),
    WEBSITE VARCHAR(50),
    CITY VARCHAR(25),
    ADDRESS VARCHAR(100),
);
--Insert the following records in the STUDENT table.

INSERT INTO STUDENT
VALUES
    (1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'A-303 ''Vasant Kunj'', Rajkot'),
    (1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', '"Ram Krupa", Raiya Road'),
    (1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot, near 
garden'),
    (1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', '"Jig''s Home", Narol'),
    (1055, 'Harmit', 'Gajera', '@me.darshan.com', 'Rajkot', 'B-55, Raj Residency'),
    (1066, 'Ashok', 'Jani', NULL, 'Baroda', 'A502, Club House Building');

SELECT *
FROM STUDENT;

--01. Display the name of students whose name starts with ‘k’. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'K%';

--02. Display the name of students whose name consists of five characters. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '_____';

--03. Retrieve the first name & last name of students whose city name ends with a & contains six characters. 

SELECT FIRSTNAME
FROM STUDENT
WHERE CITY LIKE '_____A';

--04. Display all the students whose last name ends with ‘tel’. 

SELECT FIRSTNAME, LASTNAME
FROM STUDENT
WHERE LASTNAME LIKE '%TEL';

--05. Display all the students whose first name starts with ‘ha’ & ends with‘t’. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'HA%';

--06. Display all the students whose first name starts with ‘k’ and third character is ‘y’. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'K_Y%';

--07. Display the name of students having no website and name consists of five characters. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '_____' AND WEBSITE IS NULL;

--08. Display all the students whose last name consist of ‘jer’.   

SELECT FIRSTNAME
FROM STUDENT
WHERE LASTNAME LIKE '%JER%';

--09. Display all the students whose city name starts with either ‘r’ or ‘b’. 

SELECT FIRSTNAME, CITY
FROM STUDENT
WHERE CITY LIKE '[RB]%';
--WHERE CITY LIKE 'R%' OR CITY LIKE 'B%'; --OR

--10.  Display all the name students having websites. 

SELECT FIRSTNAME
FROM STUDENT
WHERE WEBSITE IS NOT NULL;

--11.  Display all the students whose name starts from alphabet A to H. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '[A-H]%';

--12.  Display all the students whose name’s second character is vowel. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '_[AEIOU]%';

--13.  Display the name of students having no website and name consists of minimum five characters. 

SELECT FIRSTNAME
FROM STUDENT
WHERE WEBSITE IS NOT NULL AND FIRSTNAME LIKE '%_____%';

--14.  Display all the students whose last name starts with ‘Pat’.   

SELECT FIRSTNAME
FROM STUDENT
WHERE LASTNAME LIKE 'PAT%';

--15.  Display all the students whose city name does not starts with ‘b’.

SELECT FIRSTNAME
FROM STUDENT
WHERE CITY NOT LIKE 'B%';

--Part-B

--01. Display all the students whose name starts from alphabet A or H. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '[AH]%'

-- WHERE FIRSTNAME LIKE 'A%' OR FIRSTNAME LIKE 'H%';

--02. Display all the students whose name’s second character is vowel and of and start with H. 

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'H[AEIOU]%';

--03. Display all the students whose last name does not ends with ‘a’. 

SELECT FIRSTNAME
FROM STUDENT
WHERE LASTNAME NOT LIKE '%A';

--04. Display all the students whose first name starts with consonant. 

SELECT FIRSTNAME
FROM STUDENT
WHERE LASTNAME NOT LIKE '[AEIOU]%';

--05. Display all the students whose website contains .net

SELECT FIRSTNAME
FROM STUDENT
WHERE WEBSITE LIKE '%.NET';

--Part-C

--01. Display all the students whose address consist of -. 

SELECT FIRSTNAME
FROM STUDENT
WHERE ADDRESS LIKE '%-%';

--02. Display all the students whose address contains single quote or double quote. 

SELECT FIRSTNAME
FROM STUDENT
WHERE ADDRESS LIKE '%''%''%' OR ADDRESS LIKE '%"%"%'
;

--03. Display all the students whose website contains @. 

SELECT FIRSTNAME
FROM STUDENT
WHERE WEBSITE LIKE '%@%';

--04. Display all the names those are either four or five characters.

SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '____' OR FIRSTNAME LIKE '_____';

DELETE FROM STUDENT
WHERE FIRSTNAME LIKE 'K%';

SELECT *
FROM STUDENT