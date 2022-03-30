Use TournamentDataBase ;

/*
	triggers are special type of SP.
	triggers are responsed automatically to database object,sql server events.

	three types of triggers we have 

	Data manipulation language (DML) triggers 
	which are invoked automatically in response to INSERT, UPDATE, and DELETE events against tables.

	Data definition language (DDL) triggers 
	which fire in response to CREATE, ALTER, and DROP statements. 
	DDL triggers also fire in response to some system stored procedures that perform DDL-like operations.

	Logon triggers which fire in response to LOGON events

	The CREATE TRIGGER statement allows you to create a new trigger 
	that is fired automatically 
	whenever an event such as INSERT, DELETE, or UPDATE occurs against a table.

	syntax to create trigger
	CREATE TRIGGER [schema_name.]trigger_name
	ON table_name
	AFTER  {[INSERT],[UPDATE],[DELETE]}
	[NOT FOR REPLICATION]
	AS
	{sql_statements}

	The event is listed in the AFTER clause. 
	The event could be INSERT, UPDATE, or DELETE. 
	A single trigger can fire in response to one or more actions against the table.

	The NOT FOR REPLICATION option instructs SQL Server not to fire the trigger 
	when data modification is made as part of a replication process.

	inserted and deleted are two virtual table  
	SQL Server uses these tables to capture the data of the modified row 
	before and after the event occurs.



*/

select * from player;


--we will store transaction record on player table through a trigger.
--that will help us to get understand about transaction record on table such as insert,update,delete.

--create a table to store transaction of player table 
-- we will use inserted and deleted virtual table to get 
--this are virtual tables that sql server use to take records of transactions 

create table Player_Audit_Trans
(
	Id int identity,
	Audit_trans text
);

create trigger trg_insert_player
on player
for insert
as
begin
	declare @id int
	select @id = Id from inserted
	insert into Player_Audit_Trans
	values('New player added = ' + cast(@id as varchar(max)) + 'is added at ' + cast( getdate() as varchar(max)))
end

insert into Player
values('joseph','sang','nun','vetican','joseph@sang',3478,'kkr');

select * from Player_Audit_Trans;

create trigger trg_Delete_player
on player
for delete
as
begin
	declare @id int
	select @id = Id from deleted
	insert into Player_Audit_Trans
	values('New player deleted =  ' + cast(@id as varchar(max)) + '  is added at  ' + cast( getdate() as varchar(max)))
end

delete from player
where Id = 13;

-- drop trigger

drop trg_Delete_player;