
Use TournamentDataBase ;

/*

	a transaction is a single work unit that performs single or multiple activities on the database.
	it consists of read,write,update,delete or combination of these.
	transactions are importeant when you have series of activities and you want to make assure that
	either all will get excuted successfuly or no from them get excuted .

	four main properties of transaction is ACID
	Atomicity,
	consistency,
	Isolation,
	Durability

	there can be three mode of transactions.

	Autocommit Transaction mode 
	is the default transaction for the SQL Server. 
	In this mode, 
	each T-SQL statement is evaluated as a transaction and they are committed or rolled back 
	according to their results. The successful statements are committed and the failed statements are rolled back immediately

	Implicit transaction mode 
	enables to SQL Server to start an implicit transaction for every DML statement 
	but we need to use the commit or rolled back commands explicitly at the end of the statements

	Explicit transaction mode 
	provides to define a transaction exactly with the starting and ending points of the transaction

	Tip: 
	@@TRANCOUNT function returns the number of BEGIN TRANSACTION statements in the current session 
	and we can use this function to count the open local transaction numbers 

*/

--implicit transaction in sql 

--set implicit transaction on to enable implicit transaction

set implicit_transaction on
update player
set
	FirstName = 'tim',
	LastName = 'southe'
where
	Id = 4
select 
	iif(@@options & 4 = 4,
	'implicit transaction mode on ',
	'implicit transaction mode off ')
	as 'Transaction mode '
select 
	@@TRANCOUNT as opentransactions
commit tran
select 
		@@TRANCOUNT as opentransactions;

--commit transaction will applies on the data changes in the Db and than that
--data will become permanent.

--explicit transaction 
--begin transaction is use to start the explicit transaction.

begin transaction
update player
set
	FirstName = 'jack',
	LastName = 'chakosva '
where
	Id = 9
select 
	@@TRANCOUNT as opentransactions
commit tran
select 
		@@TRANCOUNT as opentransactions;

--rollback in transaction 

begin tran
update player
set
	FirstName = 'lobin',
	LastName = 'schwenger'
where 
	Id = 7
select * from player
rollback tran
select * from player;

--save point in transaction
--save point are used for save the step for rollback rather than start entire transaction again.

begin tran 
insert into player
values('kavan','lotha','kaval','leak','kavan@lotha',1342,'csk')
save tran insertstatement
select * from player
rollback tran insertstatement
commit
select * from Player

--auto rollback in  transaction 
-- if any error occur in any of transaction sql statement than tran rollback it self
--its called auto rollback.

--mark transaction in sql server
--its important feature through which we can add discription to a specific trasaction into log file.
--its hard to get transaction at specific point if we donot know timing of transaction.

begin tran deleteplayer with mark 'delete player details '
	delete player where Id between 3 and 4

	commit tran deleteplayer;

--The logmarkhistory table stores details about each marked transactions that have been committed and it is placed in the msdb database.
SELECT * FROM msdb.dbo.logmarkhistory

--STOPATMARK 
--rolls forward to the mark and includes the marked transaction in the roll forward

--STOPBEFOREMARK 
--rolls forward to the mark and excludes the marked transaction from the roll forward

