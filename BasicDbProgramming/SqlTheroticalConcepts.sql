/*
	sql called as structured query language 
	it is a language that is designed for retrival and management of relational database.

	it is a combination of 4 types of language
	1. DDL(Data Defination Language)
	2. DML (Data Manipulation Langauge)
	3. DCL (Data Controll language )
	4. TCL (Transaction Control language )

	DDL -
	It is used to create and modify the structure of database objects in SQL.
	so we can perform create ,Alter, Drop, Rename under DDL .

	DML -
	It is  used to retrieve, store, Modify, delete, insert and update data in database. 
	we perform insert,update,select,Delete under DML.

	DCL -
	it is used to create roles, permissions, and referential integrity as well. 
	It is used to control access to database by securing it.
	we can perform Grant,Revoke in it.
	Grant - providing access.
	Revoke - take back the access.

	TCL -
	These commands are used to manage different transactions occurring within a database.
	we can perform commit,rollback and saveTransaction in TCL.

	Differnce Between Drop,Delete,Truncate

	Drop -
	comes under DDL commands.
	Delete the table with its structure.

	Delete -
	Comes under DML commands.
	can delete whole table rows
	can delete table rows one by one using where clause.
	rollback is available for us.

	Trucate -
	comes under DDL commands.
	can delete all table rows 
	but structure of table is still available
	it just reset the table .

	Differnce Between varchar and nvarchar
	the main differnce is the way both data type stores the data.
	nvarchar takes 2 bytes to store each charcter
	can only store 4000 charcter
	takes large amount of memory

	varchar takes 1 bytes to store each charcter
	can store 8000 charcter
	takes lesser memory to store same charcter as compare to nvarchar.
