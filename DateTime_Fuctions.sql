/*  DATETIME FUNCTIONS  */

select *from Students

SELECT GETDATE() AS CurrentDateTime;         -- returns datetime (system date & time)
SELECT SYSDATETIME() AS CurrentDateTime2;    -- returns datetime2 (more precision)
SELECT CURRENT_TIMESTAMP AS CurrentTimeStamp; -- same as GETDATE()



-- Extract part of the date
SELECT 
    YEAR(GETDATE()) AS CurrentYear,
    MONTH(GETDATE()) AS CurrentMonth,
    DAY(GETDATE()) AS CurrentDay,
    DATENAME(WEEKDAY, GETDATE()) AS DayName,
    DATEPART(DAY, GETDATE()) AS WeekNumber;


 --    Add or Subtract Dates
-- Add 10 days
SELECT DATEADD(MONTH, 10, GETDATE()) AS Plus10Days;

-- Subtract 2 months
SELECT DATEADD(MONTH, -2, GETDATE()) AS Minus2Months;


-- Difference Between Dates

-- Difference in days
SELECT DATEDIFF(DAY, '2025-01-01', GETDATE()) AS DaysPassed;

-- Difference in years
SELECT DATEDIFF(YEAR, '2000-05-10', '2025-01-01') AS Age;


-- Format Date
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy') AS FormattedDate;
SELECT FORMAT(GETDATE(), 'MMMMM dd, yyyy hh:mm tt') AS FancyDate;


Select DATEPART(WEEK, GETDATE()) --Which Week number of  year 

Select DATENAME(WEEKDAY, Getdate()) --Name of the Week  nvarchar
Select DATEPART(WEEKDAY, Getdate())  -- Which day of the week int

--Student Age Calculation
Select    
    FullName,
    BirthDate,
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Students;

Select *from Students


-- Count how many students were registered this year.

Alter PROC GetThisYearStudents
AS
BEGIN
    SELECT 
        COUNT(*) AS TotalStudentsThisYear
    FROM Students
    WHERE YEAR(Registration) = YEAR(DATEADD(Year, -3, GETDATE()));
END;



 

ALTER TABLE Students
ADD Registration DATE;

UPDATE Students
SET Registration = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 4018, '2015-01-01');

-- NEWID() - Generates a random uniqueidentifier (GUID). Example:7C9E6679-7425-40DE-944B-E07FC1F90AE7

--CHECKSUM(NEWID()) Converts that GUID into an integer. Example: -1456723987

-- Why 4018?  Because it’s the number of days between 2015-01-01 and 2025-12-31.


Select CURRENT_TIMESTAMP, 'CURRENT_TIMESTAMP'
Select SYSDATETIME()
Select SYSDATETIMEOFFSET() -- + TimeZone

SELECT GETDATE()      AS LocalDateTime, 
       GETUTCDATE()   AS UtcDateTime;  -- Returns the current UTC (Coordinated Universal Time) datetime.



/* ISDATE() */
SELECT ISDATE('2025-08-18')   AS Test1,   --  valid date → 1
       ISDATE('18/08/2025')   AS Test2,   --  valid date format → 0
       ISDATE('2025-13-01')   AS Test3,   --  invalid month → 0
       ISDATE('HelloWorld')   AS Test4,  --  not a date → 0
       ISDATE('2025-08-18 21:02:13.123')   AS Test5,
       ISDATE('2025-08-18 21:02:13.123235')   AS Test6
     -- for Datetime2 values, isdate() return 0 



     -- DAY() 
SELECT DAY('2025-08-18') AS DayPart;  
-- ✅ Output: 18

SELECT DAY(GETDATE()) AS TodayDay;  
-- ✅ Returns today's day number from current system date

SELECT ID, FullName, Registration, DAY(Registration) AS [Day of Registration]
FROM Students;


/* DateNAme() */
SELECT DATENAME(weekday, '2025-08-18') AS WeekDayName;  
-- ✅ Output: Monday

-- Returns the month name
SELECT DATENAME(month, '2025-08-18') AS MonthName;  
-- ✅ Output: August

-- Returns the year (as text)
SELECT DATENAME(year, '2025-08-18') AS YearName;  
-- ✅ Output: 2025


SELECT 
    FullName,
    Registration,
    DATENAME(weekday, Registration) AS [Registered WeekDay],
    DATENAME(month, Registration)   AS [Registered Month]
FROM Students;




/*DATE*/







