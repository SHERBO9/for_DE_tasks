

-- Adding Referential Cascading Integrity


--Creating 2 relational tables

CREATE TABLE Fields (
    FieldID INT PRIMARY KEY,
    FieldName NVARCHAR(100)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    BirthDate DATE,
    Phone NVARCHAR(20),
    FieldID INT FOREIGN KEY REFERENCES Fields(FieldID)
);


/* Deleting constraints of a table*/
Alter table Students drop constraint FK_STUDENTS_FIELDS



/* Creating Referential Key*/
ALTER TABLE Students ADD CONSTRAINT FK_STUDENTS_FIELDS
FOREIGN KEY (FieldID) REFERENCES Fields(ID)
ON DELETE SET NUll
ON UPDATE CASCADE 

/*
ON DELETE NO ACTION / RESTRICT → prevents deleting a Field if students reference it.

ON DELETE CASCADE → deletes students automatically if their field is deleted.

ON DELETE SET NULL → sets FieldID = NULL in Students if field is deleted.
*/




/*Check constraint*/


INSERT INTO Students (ID, FullName, BirthDate, Phone, FieldID) VALUES
(1, 'Alice Johnson', '2001-03-15', '998901112233', 1),
(2, 'Bob Smith', '2000-07-20', '998901112244', 2),
(3, 'Charlie Davis', '2002-11-05', '998901112255', 3),
(4, 'Diana Evans', '1999-09-13', '998901112266', 4),
(5, 'Ethan Brown', '2001-01-28', '998901112277', 5),
(6, 'Fiona Clark', '2000-06-07', '998901112288', 6),
(7, 'George Wilson', '2002-04-19', '998901112299', 7),
(8, 'Hannah Lewis', '2001-12-11', '998901112200', 8),
(9, 'Ian Walker', '1999-10-22', '998901112211', 9),
(10, 'Julia Adams', '2000-02-14', '998901112222', 10);

INSERT INTO Fields (ID, FieldName) VALUES
(1, 'Computer Science'),
(2, 'Software Engineering'),
(3, 'Information Technology'),
(4, 'Mathematics'),
(5, 'Physics'),
(6, 'Biology'),
(7, 'Economics'),
(8, 'Law'),
(9, 'Business Administration'),
(10, 'Civil Engineering');

 set Identity_insert Fields off
 set identity_insert Students on



 /*Check constraint*/


 Alter table Students
 Add Constraint CK_Students_BirthDate Check(BirthDate>'1990-01-01')


 ALTER TABLE STUDENTS
 DROP CONSTRAINT CK_STUDENTS_PHONE


select *from Fields
select *from Students

ALTER TABLE STUDENTS 
WITH NOCHECK   -- ADD Check constraint without checking data rows above
ADD CONSTRAINT CK_STUDENTS_PHONE  CHECK ((LEN(phone) between 9 and 15) and Phone not like '%[^0,9]%')




