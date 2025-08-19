/* JOINs  in SQL Server*/


SELECT *FROM Students
SELECT *FROM Fields


/*JOIN OR INNER JOIN*/

SELECT s.ID, s.FullName, f.FieldName
FROM Students s
INNER JOIN Fields f on s.FieldID=f.ID

select *from students
/*Shows only students who have a valid FieldID in the Fields table.*/

INSERT INTO Students (FullName) VALUES
('Abdullayev Doston'),
('Bahodirov Javohir')

SELECT *FROM Students
SELECT *FROM Fields



/*LEFT JOIN(LEFT OUTER JOIN)*/
/*Returns all rows from the left table (Students), even if there is no match in Fields.*/

SELECT s.ID, s.FullName, f.FieldName
FROM Students s
LEFT JOIN Fields f ON s.FieldID=f.ID
-- ALTERNATIVELY:

/*Returns all rows from the left table (Students), even if there is no match in Fields.*/



/*RIGHT JOIN (RIGHT OUTER JOIN)*/

SELECT s.ID, s.FullName, f.FieldName
FROM Students s
RIGHT JOIN Fields f ON s.FieldID=f.ID

Insert into Fields (FieldName) values
('Genetics')




/*
4. FULL JOIN (FULL OUTER JOIN)
Returns all rows from both tables, with NULLs where there is no match.
*/

SELECT s.ID, s.FullName, f.FieldName
FROM Students s
FULL JOIN Fields f ON s.FieldID=f.ID
--Shows all students and all fields (with NULL values if no match).


/* CROSS JOIN

Returns all possible combinations (Cartesian product).
Be careful: if you have 10 students and 10 fields → result = 100 rows.*/

SELECT s.FullName, f.FieldName
FROM Students s
CROSS JOIN Fields f;

/* SELF JOIN

A table joined with itself. (Not directly useful for Students + Fields, but an example:)*/

SELECT s1.FullName AS Student1, s2.FullName AS Student2
FROM Students s1
INNER JOIN Students s2 ON s1.FieldID = s2.FieldID
WHERE s1.ID <> s2.ID;


SELECT *from Students
SELECT *FROM Fields

--Finds students who are in the same field.


/* JOIN with Filtering

Example: find Computer Science students only:*/

SELECT s.ID, s.FullName, f.FieldName
FROM Students s
INNER JOIN Fields f ON s.FieldID = f.ID
WHERE f.FieldName = 'Information Technology';