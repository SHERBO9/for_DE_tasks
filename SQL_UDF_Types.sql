/*  User Defined Functions' types   */


Select *from Students
Select *from Fields
Select *from Mentors


--CREATE FUNCTION FunctionName(@param1 param1type, @param2 param2, ...)
--RETURNS INT
--AS
--BEGIN


--RETURN RETURN_DATATYPE
--END


Create function CalculateAge(@DOB Date)
Returns Int
As
Begin
Declare @Age Int

Set @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -
								Case 
									When (MONTH(@DOB)>MONTH(GETDATE())) or
										 (MONTH(@DOB)=MONTH(GETDATE()) and DAY(@DOB)>DAY(GETDATE()))
									Then 1
									Else 0
								End


Return @Age
End



-- Using UDF: You can call with two-part name:  OWNERNAME.FUNCTIONNAME(params)
Select dbo.CalculateAge('12.09.1998') 


Select ID, FullName, dbo.CalculateAge(BirthDate) as Age 
from Students
Where dbo.CalculateAge(BirthDate)>20



/* fetch text of function*/

sp_helptext CalculateAge

--Difference between Proc. and Functions

Create proc spCalculateAge
@DOB Date
As
Begin
Declare @Age Int

Set @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -
								Case 
									When (MONTH(@DOB)>MONTH(GETDATE())) or
										 (MONTH(@DOB)=MONTH(GETDATE()) and DAY(@DOB)>DAY(GETDATE()))
									Then 1
									Else 0
								End


Select @Age
End



Execute spCalculateAge '08/10/2023'




-- correct using: 
Select ID, FullName, dbo.CalculateAge(BirthDate) as Age 
from Students

-- Incorrect using: this is procedure
Select ID, FullName, spCalculate(BirthDate) as Age 
from Students








/*	 Inline UDF		*/

Select *from Students
Select *from Mentors


Create function Fn_StudentsMentors(@MentorName varchar(100))
Returns Table
As
Return (
		Select M.ID, M.MentorName, COUNT(s.ID) as StudentCount
		from Mentors M
		Left Join Students s on s.MentorID=M.ID
		Group by M.ID, M.MentorName
		Having M.MentorName=@MentorName 
	   )

Create function StudentsNumOfMentors()
Returns Table
As
Return (
		Select M.ID, M.MentorName, COUNT(s.ID) as StudentCount
		from Mentors M
		Left Join Students s on s.MentorID=M.ID
		Group by M.ID, M.MentorName
		
	   )


/* Calling it*/

Select *from Fn_StudentsMentors('Dr. Alice Johnson')


Select *from StudentsNumOfMentors() Where StudentCount >0


Select  S.ID,  S.Fullname, SM.MentorName
from Fn_StudentsMentors('Dr. Alice Johnson') SM
Left Join Students S on SM.ID=S.MentorID

/**/



/* Multi-Statement Table valued functions*/

--Inline table valued functions:

Create function GetDataStudents()
Returns Table
As
Return (
		Select S.ID, S.FullName, S.BirthDate, F.FieldName, M.MentorName
		from Students S
		Left Join Fields F on S.FieldID=F.ID
		Left Join Mentors M on M.ID=S.MentorID
			
	   )


	   /* Multi State table valued functions */

Create function FunctionName()
Returns @Table Table(ID int, Name Varchar(100), DOB date)
As
Begin
	insert into @Table
	select ID, FullName, CAST(BirthDate as date) from Students
	return

END



Select *from GetDataStudents()

Select *from FunctionName()




