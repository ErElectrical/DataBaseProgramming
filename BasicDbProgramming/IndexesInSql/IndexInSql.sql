
-- select database to work.
Use TournamentDataBase ;

--Indexes are special data structures associated with tables or views that help speed up the query. 
--SQL Server provides two types of indexes: 
--clustered index and non-clustered index.
--with the help of indexes retrival of data and querying on data becomes easy.

--clustred indexes
--its anomalie is same as non linear datastructure say linkedlist
--A clustered index stores data rows in a sorted structure based on its key values. 
--Each table has only one clustered index because data rows can be only sorted in one order. 
--The table that has a clustered index is called a clustered table.

--when we are creating a primary key than
--sql server automatically creates a clustered index over column of primary key.

-- if a table doesnot have a primary key than we can provide a clustred index to it.

create table dbo.Game
(
	Tournament_Id int ,
	Game varchar(100)
);

--as table donot have a primary key we will impose clustred index here

create clustered index Id
on dbo.Game(Tournament_Id);

insert into dbo.Game
values(1,'cricket');

insert into dbo.Game
values(2,'chess');

insert into dbo.Game
values(3,'foootball');

insert into dbo.Game
values(4,'kabaddi');

--fetch data through clustred index 

--when this sql statement run sql server go to clustred index and fetch the data rather than checking the whole table.
select * from Game
where Tournament_Id = 2;


--non clustred index
--it improves the speed of retrival of data from database.
--unlike clustred index there can be more than one non clustred index in a table.
--non clustred index can have more than one cloumn.
--order of defineing of column name plays an important role .

--note that instead of creating a non clustred index for full name
--we can also do it through where clause 

create nonclustered index FullName 
on player(FirstName,LastName);

select * from player;

select FirstName,LastName,BaseValue,TeamName,Email
from player
where FirstName = 'sam' and
	LastName = 'lokhand';


--rename index

--a system built in stored procedure sp_rename can be use to rename any user created object in database including index,column and tables

exec sp_rename
	@objname=n'player.FullName',
	@newname=n'player_Fullname',
	@objtype=n'index';

--disable index of a table

--disable a single index 
alter index FullName
on player
disable;

--disable all indexes of a table 

alter index all 
on player
disable;

--Enable index of a table
--once index is disabled you can enabled it if needed.
--as sometimes while updating large chunk in table
--you may need to disable indexes to speed up

--enable index using alter 

alter index all
on player
rebuild;

--enable index using create
--with create index we can recreate the index

create index FullName
on player(FirstName,LastName)
with(drop_existing = on );

--unique index

--as named defines functionality
--unique index on key columns ensure that there will be no dupicate values in it,
--any attempt found to update or insert duplicate value in unique index column shows an error.
--both unique constraints and unique index plays same features 
--so it always better to check weather column values are unique or not
--before imposing unique index on it.

--check weather Email columns contains unique value or not.
select 
	Email,
	count(Email)
from 
	Player
group by Email
having count(Email) > 1;


--syntax to create unique index .

--create unique index index_name
--on table_name(column_List);

--Drop indexes.

--remove indexes compleley.

--syntax to remove index
--DROP INDEX [IF EXISTS] index_name
--ON table_name;

--if drop command do not found the indexname than it will through an error so it is better 
--to check first 

drop index if exists 
FullName on player;

--Filtered Index
--A filtered index is a nonclustered index with a predicate that allows you to specify which rows should be added to the index.
-- a non clustered index can speed up good in query speed.
--but it comes on the cost of memory and maintaince.

--The following syntax illustrates how to create a filtered index:

--CREATE INDEX index_name
--ON table_name(column_list)
--WHERE predicate;

-- prdicate is the condition where we specified which rows of the table should be included int he index. 

--benefits of filtered index

--filtered index helps us to save time where values are null in columns
--we can filtered out it first.



