
/* String Functions*/

/* REPLICATE() */

Select REPLICATE('Zarina', 5)

	

Select ID, Name,
SUBSTRING(Email, 1,2)+ REPLICATE('*', 5)+
SUBSTRING(Email, Charindex('@', Email), Len(Email)-CHARINDEX('@',Email)+1)
from PersonTbl;


/* Space() function*/

Select Cast(ID as Varchar) + SPACE(4) + Name
from PersonTbl


/* PATINDEX() fuction*/

Select *from PersonTbl

Select Email, PATINDEX('%@email.com', Email) as FirstOccurance
from PersonTbl
Where PATINDEX('%@email.com', Email)>0



/* Replace() function*/

Select ID, Name, REPLACE(Email, '.com', '.net')
from PersonTbl



/* STUFF() fuction*/
-- STUFF ( character_expression , start , length , replaceWith_expression )

SELECT STUFF('HelloWorld', 6, 5, 'SQL') AS Result;


SELECT STUFF('12345', 3, 0, 'ABC') AS Result;


Select *from Students

Select ID, FullName, STUFF(Phone, Len(Phone)-4+1, 4, '****')
from Students




