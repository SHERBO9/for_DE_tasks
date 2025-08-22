/* Replacing Null */

Select *from Employees


Select  E.Name as Employees, ISNULL(M.Name, 'No manager') as Manager
From Employees as E
Left join Employees M on M.ID=E.ManagerID

-- Using CASE WHEN expression THEN ''  else '' END


Select  E.Name as Employees, Case When M.Name is Null then 'No Manager' else M.Name end as Manager
From Employees as E
Left join Employees M on M.ID=E.ManagerID

-- this throws an error as ManagerID's type is INT
Select ID, Name, IsNull(ManagerID, 'No Mentor')
from Employees

--Correct one:

Select ID, Name, IsNull(cast(ManagerID as varchar(50)), 'No Mentor') as ManagerID
from Employees


SELECT Name, 
       ISNULL(CONVERT(VARCHAR, ManagerID), 'No Manager') AS Manager
FROM Employees;

-- CAST() and CONVERT() convert Data into represented type




/* COALESCE  method is used to fetch first non null data in a row*/



SELECT ID,Name, COALESCE(ManagerID, 0) AS ManagerOrDept
FROM Employees;

CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Phone NVARCHAR(20) NULL,
    Email NVARCHAR(100) NULL,
    Telegram NVARCHAR(50) NULL
);

-- Sample data
INSERT INTO Contacts (ContactID, FullName, Phone, Email, Telegram) VALUES
(1, 'Alice', '998901234567', NULL, '@alice123'),
(2, 'Bob', NULL, 'bob@gmail.com', NULL),
(3, 'Charlie', NULL, NULL, '@charlie'),
(4, 'Diana', NULL, NULL, NULL);

Select *from Contacts

SELECT 
    FullName,
    COALESCE(Phone, Email, Telegram, 'No contact') AS PreferredContact
FROM Contacts;




/*UNION and UNION ALL*/

Select *from Fields
Union All
Select *from Mentors
Order by FieldName







