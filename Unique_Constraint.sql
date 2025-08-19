Select *from Employee
Select *from Employees



-- Adding UNIQUE constraint to Email column

ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Email UNIQUE(Email)


-- During Creating a table:

CREATE TABLE Students (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,  -- Email must be unique
    BirthDate DATE
);

-- Add UNIQUE to multiple columns (composite unique key)
CREATE TABLE Fields (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FieldName NVARCHAR(100) NOT NULL,
    MentorID INT NOT NULL,
    CONSTRAINT UQ_Field_Mentor UNIQUE (FieldName, MentorID)
);



SELECT *FROM Students
SELECT *FROM Fields