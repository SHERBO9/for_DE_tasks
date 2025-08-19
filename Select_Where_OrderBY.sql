/*Select in SQL*/


SELECT *FROM Employees



Select distinct Department from Employees

/*Return all distinct data in Department column*/


Select *from Employees Where Department='IT'

-- <>  means not equal to !=
Select *from Employees Where Department<>'IT'



/*With operators*/

Select *from Employees Where Department='IT' and Name LIKE '%a%' and Id BETWEEN 5 and 10


/*
Special Operators

BETWEEN ... AND ... → range check

IN (...) → multiple values check

LIKE → pattern matching (with wildcards, see below)

IS NULL / IS NOT NULL → checks for null

*/

SELECT * FROM Employees 
WHERE Id IN (1, 2, 3) 
  AND Age BETWEEN 20 AND 30;

/* 
%	Zero or more characters	   WHERE Name LIKE 'A%' → Names starting with A
_	Exactly one character	WHERE Name LIKE 'J_n' → Jon, Jan, Jin
[ ]	Any single character from set	WHERE Name LIKE '[ABC]%' → Names starting with A, B, or C
[^ ]	Any single character not in set	WHERE Name LIKE '[^A]%' → Names not starting with A
*/

Select *from Employees Where Name Like '%son'

Select *from Employees Where Name Like '____'

Select *from Employees Where Name Like '[JA]%'

Select *from Employees Where Name Like '%[B]%'


/* ORDER BY */

Select *from Employees Order by Age DESC


/* TOP n or TOP n percentage og rows*/


Select Top 3 Name, Age, Department from Employees

Select Top 30 PERCENT Name, Age, Department from Employees