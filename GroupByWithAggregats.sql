/* Group BY*/

/*
The GROUP BY clause in SQL is used to arrange rows that have the same values into groups.
It is usually combined with aggregate functions like:

COUNT() → how many

SUM() → total

AVG() → average

MIN() → smallest

MAX() → largest
*/

Select *from Employees


Select Department, AVG(Age) as [Average Age]
from Employees
Group by Department
Order by [Average Age] Desc

Alter table Employees Add Salary float null

Alter table Employees Drop Column Email


/* Grouping Department employees and Summ of all emp.'s salaries*/
Select Department, SUM(Salary) as [Department salary]
from Employees
Group by Department


Select Department, MAX(Salary) as [Max Salary]
from Employees
Group by Department



/* Group by with multiple columns*/

Select Department, Job, SUM(Salary) 
from Employees
Group by Department, Job
Order by Department

/*Grouping by Department and inside the department, how much do employees in each job take salary summary  */
/*You can switch the order of column names and take results accordingly*/

/* Total number of Employees */

Select Department, Job, SUM(Salary) as [Salary], COUNT(ID) as [Total Employees]
from Employees
Group by Department, Job
Order by Department


Select *from Employees



/* Where and Having clauses */

/*
1. WHERE clause can be used with SELECT, INSERT, UPDATE statements, while HAVING clause can be used 
only with SELECT statement

2. WHERE clause filters rows before aggregation(Grouping), while HAVING filters groups
after aggregation are performed

3. Aggregation functions can not be used in Where clauses, unless it is in a subquery contained
in a HAVING clauses, whereas aggregate functions can be used in HAVING clauses


*/

Select Department, Job, SUM(Salary) as [Total salary], COUNT(ID) as [Total employees] 
From Employees
Group by Department, Job
Having SUM(Salary)>5000 

