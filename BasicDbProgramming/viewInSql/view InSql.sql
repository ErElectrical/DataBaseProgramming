Use TournamentDataBase ;

/*
	A VIEW in SQL Server is like a virtual table that contains data from one or multiple tables. 
	It does not hold any data and does not exist physically in the database. 
	Similar to a SQL table, the view name should be unique in a database. 
	It contains a set of predefined SQL queries to fetch data from the database. 
	It can contain database tables from single or multiple databases as well.

	view doesnot hold memory as it is not available like physical table.

	Create a SQL VIEW
	syntax :

	create view name as
	select column1,column2 ...... column n from table
	where condition.

	A view is a named query stored in the database catalog that allows you to refer to it later.

	view is useful to abstract complex queries



*/

--created a view that fetch all data from table
create view playerRecord as
select * from Player;

--see data of view
select * from playerRecord;

--sql view to fetch few columns from table 

create view FetchFewColumnsRecords
as select FirstName,LastName,BaseValue,Email
from player;

--see data of views
select * from FetchFewColumnsRecords;

--sql views to fetch few columns and impose where condition on it

create view FetchFewColumnsAndImposeWhereClause
as select FirstName,LastName,BaseValue
from player
where BaseValue > 3000;

--see data of views
select * from FetchFewColumnsAndImposeWhereClause;

--sql view to fetch all player of a team .
create view [ fetch all player of a team ] as
select *
from player
where TeamName = 'csk';

select * from player;

select * from [ fetch all player of a team ];

--sql updating view

--sql create or replace view

create or alter view [ fetch all player of a team ] as
select FirstName,LastName,BaseValue
from player
where TeamName = 'lsk';

select * from [ fetch all player of a team ];

drop view [ fetch all player of a team ];

--sql view to fetch records from multiple table

--We can use VIEW to have a select statement with Join condition between multiple tables. 
--It is one of the frequent uses of a VIEW in SQL Server.

create view [fetch player details and contract note ] as
select 
	FirstName,
	LastName,
	Basevalue,
	TeamName
from 
	player as p
inner join Contract as c
on 
	p.Id = c.player_id;


--see data of view.
select * from [fetch player details and contract note ];

--We can use sp_helptext system stored procedure to get VIEW definition.
--It returns the complete definition of a SQL VIEW.
sp_helpText [fetch player details and contract note ];

--sql view for dml(insert,delete,update)
--but some condition we have to keep in mind while do dml commands
--We can use DML operation on a single table only
--VIEW should not contain Group By, Having, Distinct clauses
--We cannot use a subquery in a VIEW in SQL Server
--We cannot use Set operators in a SQL VIEW

--sql view check option 

/* 
	We can use WITH CHECK option to check the conditions in VIEW are inline with the DML statements.
    It prevents to insert rows in the table where the condition in the Where clause is not satisfied
    If the condition does not satisfy, we get an error message in the insert or update statement

*/


create view demo
as
select * from player
where FirstName like 'Ta%'
with check option;


	





