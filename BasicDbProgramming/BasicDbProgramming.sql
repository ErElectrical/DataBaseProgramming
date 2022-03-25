
create database TournamentDataBase;

use TournamentDataBase;

create table TournamentsPrizes
(
	PlayerId int identity primary key,
	PlaceName varchar(100),
	PlaceNumber varchar(100),
	PrizePercentage decimal,
	PrizeAmount money,

);


insert into TournamentsPrizes(PlaceName,PlaceNumber,PrizeAmount)
values('First',1,1500);

insert into  TournamentsPrizes(PlaceName,PlaceNumber,PrizeAmount)
values('second',2,2500);

insert into  TournamentsPrizes(PlaceName,PlaceNumber,PrizeAmount)
values('Third',3,2700);

insert into  TournamentsPrizes(PlaceName,PlaceNumber,PrizeAmount,PrizePercentage)
values('second',2,2500,60.00);

insert into  TournamentsPrizes(PlaceName,PlaceNumber,PrizeAmount,PrizePercentage)
values('second',2,3500,60.00);

insert into  TournamentsPrizes(PlaceName,PlaceNumber,PrizeAmount,PrizePercentage)
values('First',1,2500,60.00);



--Quering data

--To get data from all table column
select * from TournamentsPrizes;

/*When processing the SELECT statement,
 SQL Server processes the FROM clause first and then the SELECT clause even though the SELECT clause appears first in the query.
*/

--quering data of some column from the table.

select 
	PlaceName,
	PrizePercentage,
	PrizeAmount
from 
	TournamentsPrizes;

--quering data of some column based on where condition

select 
	PlaceName,
	PrizePercentage,
	PrizeAmount
from 
	TournamentsPrizes
where
	PlayerId = 3;

/*
 When the WHERE clause is available, SQL Server processes the clauses of the query in the following sequence: FROM, WHERE, and SELECT.
 */

 --Quering data of table based on one or more column
 -- in this sql statement order by clause ordered the data in ascending order of PlaceName.
 
select 
	PlaceName,
	PrizePercentage,
	PrizeAmount
from 
	TournamentsPrizes
where
	PrizeAmount > 2000
order by
	PlaceName;

--In this case, SQL Server processes the clauses of the query in the following sequence: FROM, WHERE, SELECT, and ORDER BY.

--Quering data by groupin row into group
--group by clause is use to group rows that have same value
-- The GROUP BY statement is often used with aggregate functions 
--(COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

select 
	PlaceNumber,
	count(PrizeAmount)
from 
	TournamentsPrizes
where
	PrizeAmount > 1000
group by 
	PlaceNumber
order by
	PlaceNumber desc;

--In this case, SQL Server processes the clauses in the following sequence: FROM, WHERE, GROUP BY, SELECT, and ORDER BY.

--To filter groups based on one or more conditions, you use the HAVING clause.
--in this sql statement we are going to put condition on group to filter data from it
-- as the condition in having clause is that count of prizeAmount should be more than 1
--thats why select query donot show data for First placeName
select 
	PlaceName,
	count(PrizeAmount)
from 
	TournamentsPrizes
where
	PrizeAmount > 1000
group by 
	PlaceName
having 
	count(PrizeAmount) > 1
order by
	PlaceName desc;

	
