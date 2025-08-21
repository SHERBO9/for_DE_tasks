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

