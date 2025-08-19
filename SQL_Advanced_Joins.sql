/*Advanced and intelligent JOINS*/

-- Count students in each field

SELECT f.FieldName, COUNT(s.ID) AS StudentCount
FROM Fields f
LEFT JOIN Students s ON f.ID = s.FieldID
GROUP BY f.FieldName;



-- Find students who are in the largest field
SELECT s.FullName, f.FieldName
FROM Students s
INNER JOIN ( -- top 5 fields
    SELECT TOP 5 FieldID, COUNT(*) AS StudentCount
    FROM Students
    GROUP BY FieldID
    ORDER BY COUNT(*) DESC
) bigField ON s.FieldID = bigField.FieldID
INNER JOIN Fields f ON s.FieldID = f.ID;

select *from Students
select *from Fields



-- Suppose Students table has MentorID column (FK to StudentID)
SELECT s.FullName AS Student, m.FullName AS Mentor
FROM Students s
LEFT JOIN Students m ON s.MentorID = m.StudentID;


Create table Mentor(
ID int primary key not null,
MentorName Varchar(100) not null,
)

Alter table Students add  MentorID int null
Foreign key (MentorID) references Mentor(ID)

INSERT INTO Mentor (ID, MentorName) VALUES
(1, 'Dr. Alice Johnson'),
(2, 'Prof. Bob Smith'),
(3, 'Dr. Charlie Davis'),
(4, 'Prof. Diana Green'),
(5, 'Dr. Edward Wilson'),
(6, 'Prof. Fiona Brown'),
(7, 'Dr. George Clark'),
(8, 'Prof. Helen White'),
(9, 'Dr. Ian Taylor'),
(10, 'Prof. Julia Adams');

-- Students without a field OR fields without students
SELECT s.FullName, f.FieldName
FROM Students s
FULL JOIN Fields f ON s.FieldID = f.ID
WHERE s.ID IS NULL OR f.ID IS NULL;


-- Find oldest student in each field
SELECT f.ID,f.FieldName,s.ID, s.FullName, s.BirthDate
FROM Students s
INNER JOIN Fields f ON s.ID = f.ID
WHERE s.BirthDate = (
    SELECT MIN(BirthDate) 
    FROM Students s2 
   
);



