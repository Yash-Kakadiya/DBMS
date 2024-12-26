--->Lab-03-UDF

-- Note: for Table valued function use tables of Lab-2.

--Part - A

--01. Write a function to print "hello world".

CREATE FUNCTION PrintHello()
Returns varchar(50)
AS
BEGIN
    return 'Hello world';
END

Select dbo.PrintHello() as Print_Statement

--02. Write a function which returns addition of two numbers.

CREATE FUNCTION Addition
(
	@n1 INT,
	@n2 INT
)
Returns INT
AS
BEGIN
    return @n1+@n2
END

Select dbo.Addition(1,2) as SUMOFGIVEN

--03. Write a function to check whether the given number is ODD or EVEN.

CREATE FUNCTION OddEven(@n INT)
Returns varchar(4)
AS
BEGIN
    Return CASE
		When @n%2!=0 Then 'Odd'
		When @n%2=0 Then 'Even'
	END
End

Select dbo.OddEven(3) as Odd_Even
Select dbo.OddEven(4) as Odd_Even

--04. Write a function which returns a table with details of a person whose first name starts with B.

CREATE FUNCTION PersonDetails()
Returns table
AS
	return (Select *
from Person
where Person.FirstName LIKE 'B%');

Select *
from PersonDetails() AS PersonName

--05. Write a function which returns a table with unique first names from the person table.

CREATE FUNCTION PersonUnique()
Returns table
AS
	return (Select DISTINCT FirstName
from Person );

Select *
from PersonUnique() AS UniquePersonName

--06. Write a function to print number from 1 to N. (Using while loop)

CREATE OR ALTER FUNCTION Print1ToN(@N INT)
Returns varchar(100)
AS
BEGIN
    Declare @ans varchar(100), @i INT
    SET @ans = '';SET @i = 1
    While @i<=@N
		BEGIN
        SET @ans = @ans + CAST(@i as varchar)+' '
        SET @i = @i+1
    END
    return ans
END

Select dbo.Print1ToN(10)

--07. Write a function to find the factorial of a given integer.

CREATE OR ALTER FUNCTION Factorial(@n INT)
Returns INT
AS
BEGIN
    Declare @ans INT
    SET @ans = 1
    While @n!=0
		BEGIN
        SET @ans = @ans*@n
        SET @n = @n - 1
    END
    Return @ans
END

Select dbo.Factorial(5) as factorialOf5

--Part - B

--08. Write a function to compare two integers and return the comparison result. (Using Case statement)

CREATE OR ALTER FUNCTION Compare(@n1 INT, @n2 INT)
Returns varchar(50)
AS
BEGIN
    return CASE
        When @n1 > @n2 Then CAST(@n1 AS VARCHAR) + ' is greater'
        When @n1 < @n2 Then CAST(@n2 AS VARCHAR) + ' is greater'
        ELSE 'Both are equal'
    END
END

Select dbo.Compare(3,4)
Select dbo.Compare(5,2)

--09. Write a function to print the sum of even numbers between 1 to 20.

CREATE OR ALTER FUNCTION SUMOf20()
Returns INT
AS
BEGIN
    Declare @ans INT, @i INT
    SET @ans = 0
    SET @i = 1
    While @i<=20
		BEGIN
        SET @ans = @ans+@i
        SET @i = @i + 1
    END
    Return @ans
END

Select dbo.SUMOf20()

--10. Write a function that checks if a given string is a palindrome.

CREATE OR ALTER FUNCTION Palindrome(@str varchar(100))
Returns varchar(3)
AS
BEGIN
    Return case
		When REVERSE(@str) = @str Then 'Yes'
		When REVERSE(@str) != @str Then 'No'
	END
END

Select dbo.Palindrome('abccba') as isPalindrome
Select dbo.Palindrome('abccb') as isPalindrome

--Part - C
--11. Write a function to check whether a given number is prime or not.
--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.
--13. Write a function which accepts two parameters year & month in integer and returns total days each year.

--14. Write a function which accepts personID as a parameter & returns a detail of the persons.

CREATE FUNCTION PersonDetail(@ID INT)
Returns table
AS
	return (Select *
from Person
where PersonID = @ID)

Select *
from PersonDetail(102) AS Person

--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.

CREATE OR ALTER FUNCTION PersonDetailJoiningDate()
Returns table
AS
	return (Select *
from Person
where JoiningDate>'1991-1-1')

Select *
from PersonDetailJoiningDate()
