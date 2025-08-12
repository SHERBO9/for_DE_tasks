

/* Creating a table */

create table GenderTbl
(
ID int NOT NULL PRIMARY KEY,
Gender varchar(50) Not null

)
 


/* relationship between tables */

alter table PersonTbl add constraint PersonTbl_GenderID_FK
foreign key (GenderID) references GenderTbl(ID)

/*Person table is connected to GenderTbl via 
GenderID(column og PersonTbl) and ID of GenderTbl*/



/*Insert data into PersontTbl table*/

INSERT INTO PersonTbl (ID, Name, Email, GenderID) VALUES
(1, 'Alice Johnson', 'alice.johnson@email.com', 2),
(2, 'Bob Smith', 'bob.smith@email.com', 1),
(3, 'Charlie Brown', 'charlie.brown@email.com', 1),
(4, 'Diana Adams', 'diana.adams@email.com', 2),
(5, 'Evan Davis', 'evan.davis@email.com', 1),
(6, 'Fiona Lee', 'fiona.lee@email.com', 2),
(7, 'George White', 'george.white@email.com', 1),
(8, 'Hannah Taylor', 'hannah.taylor@email.com', 2),
(9, 'Isaac Green', 'isaac.green@email.com', 3),
(10, 'Jamie Carter', 'jamie.carter@email.com', 4);


/* Show data in PersonTbl*/

Select *from PersonTbl



/* Adding DEFAULT constraint*/


ALTER TABLE PersonTbl 
ADD CONSTRAINT DF_PersonTbl_GenderID
DEFAULT 3 for GenderID


Insert into PersonTbl(ID, Name, Email) Values(
11, 'Linda Camelton', 'Linda@gmail.com'
)


/*Adding new column with default value*/
ALTER TABLE PERSONTbl
ADD Phone varchar(50) null
CONSTRAINT DF_Phone  DEFAULT '901234567'

Insert into PersonTbl(ID, Name, Email) Values(
12, 'Arni Jackson', 'Arni@gmail.com'
)

ALTER TABLE PersonTbl
DROP CONSTRAINT DF_Phone 
 
