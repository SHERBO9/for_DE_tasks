/*Advanced and intelligent JOINS*/


Select s.ID, s.FullName, f.FieldName
from Students s
Left Join Fields f on s.FieldID=f.ID
Where  s.FieldID is NUll -- or Where f.ID is Null

-- Only returns which FieldName is Null (Only left side of 2 matching tables)



Select s.ID, s.FullName, f.FieldName
from Students s
Right Join Fields f on s.FieldID=f.ID
Where  s.FieldID is NUll -- or Where f.ID is Null
-- Only returns which FieldName is Null (Only right side of 2 matching tables)


Select s.ID, s.FullName, f.FieldName
from Students s
Full Join Fields f on s.FieldID=f.ID
Where  s.FieldID is NUll
or  f.ID is Null





-- Count students in each field

SELECT f.FieldName, COUNT(s.ID) AS StudentCount
FROM Fields f
LEFT JOIN Students s ON f.ID = s.FieldID
GROUP BY f.FieldName;




-- Find students who are in the largest top 5 fields
SELECT s.FullName ,f.FieldName, bigField.StudentCount
FROM Students s
INNER JOIN ( -- top 5 fields
    SELECT TOP 5 FieldID, COUNT(*) AS StudentCount
    FROM Students
    GROUP BY FieldID
    Having FieldID is not Null
    ORDER BY COUNT(*) DESC
) bigField ON s.FieldID = bigField.FieldID
INNER JOIN Fields f ON s.FieldID = f.ID
Order by FieldName

select *from Students
select *from Fields
select *from Mentors


Select s.FullName, f.FieldName,m.MentorName
from Students s
Left Join Fields f on s.FieldID=f.ID
Join Mentors m on s.MentorID=m.ID
/*
Students joined with Fields

Students joined with Mentors

Result: Each student’s name + field name + mentor name.
*/

-- Show all students, their field, and mentor (if exists)
SELECT s.FullName, f.FieldName, m.MentorName
FROM Students s
LEFT JOIN Mentors m ON s.MentorID = m.ID
INNER JOIN Fields f ON s.FieldID = f.ID;

-- Show mentors with number of students in each field
SELECT m.MentorName, f.FieldName, COUNT(s.ID) AS StudentCount
FROM Mentors m
INNER JOIN Students s ON m.ID = s.MentorID
INNER JOIN Fields f ON s.FieldID = f.ID
GROUP BY m.MentorName, f.FieldName
ORDER BY StudentCount DESC;


/*SELF JOIN*/
-- Show students who have the same mentor

SELECT s1.ID, s1.FullName AS Student1, s2.FullName AS Student2, m.MentorName
FROM Students s1
INNER JOIN Students s2 ON s1.MentorID = s2.MentorID AND s1.ID < s2.ID
INNER JOIN Mentors m ON s1.MentorID = m.ID;



Select *from Employees


Select  E.Name, M.Name as Manager
from Employees E
Left join Employees M on E.ManagerID=M.ID

Select  E.Name, M.Name as Manager
from Employees E
Join Employees M on E.ManagerID=M.ID


Select  E.Name, M.Name as Manager
from Employees E
Right join Employees M on E.ManagerID=M.ID


Select  E.Name, M.Name as Manager
from Employees E
Cross join Employees M 

