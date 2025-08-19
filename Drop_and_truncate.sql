alter table Students 
drop constraint FK_Students_Fields_ID


alter table Students
add constraint FK_Students_Fields_ID
Foreign key (FieldID) references Fields(ID)


Delete from Fields  
/*
All rows in the table will be deleted (but the table structure remains).

Use WHERE to avoid deleting everything accidentally.
*/

Truncate table Fields
--If you want to delete all rows but keep auto-increment counters reset, use TRUNCATE



Select *from Fields

