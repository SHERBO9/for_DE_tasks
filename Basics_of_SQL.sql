<<<<<<< HEAD
/*create a DB*/

create database Sample1


/* Alter name of a DB */
Alter database Sample1 modify name=SampleDBModified

/*alternative*/

sp_renameDB 'SampleDBModified', 'SampleNew'


/* drop DB*/

drop SampleDBModified
=======
/*create a DB*/

create database Sample1


/* Alter name of a DB */
Alter database Sample1 modify name=SampleDBModified

/*alternative*/

sp_renameDB 'SampleDBModified', 'SampleNew'


/* drop DB*/

drop SampleDBModified
>>>>>>> 15d4be632a8eac8a5ea0d57461de0b78b353006c
/*Note: If DB have any connection, it is can not be deleted */