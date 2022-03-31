
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

-- as here if i deleted any record the id provide to the deleted record can not be
--reused.
--but to provide deleted id we have to do following 

set identity_insert TournamentsPrizes (PlayerId) on

--to provide sql identitiy work to sql server we have to off it

set identity_insert TournamentsPrizes off

--as if i deleted all records of table than primary key will not reuse Id of delted record.
--if we want to reuse the deleted record Id than we have to instruct it.

--dbcc means database console command checkdb ) it is used to check integrity of objects 
--in sql server DB.

dbcc checkident(TournamentsPrizes,reseed,0)

--dbcc checkident - returns current value of identity in a specific table
--we can reset it .
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

--get dictinct values of city from the table 

select distinct City,BaseValue from player

--get player who are not living in a specific city
-- <> and != both sign represent not equal to
select * from player where City != 'kufri'

--get all  players that are not from a list of specific city

select * from Player where City not in ('bhirandi','lambo','amala','kaval')

--when ever you have a list to filter better to use In opreator.

select * from player where City <> 'chain'

--match pattern while querying for firstname of Db.
--like keyword is ude to match pattern 
select * from player where FirstName like 'sa%'

--get records of a list of like of firstname.
--we get all the city player whose first letter of city is in list.
select * from player where city like '[kmla]%'

--get records of a list of not like of firstname.

select * from player where city like '[^kmla]%'

-- %,[],[^] this are some of wild card which we can use with like to match pattern more easily.

-- either of retriving all records we can use top keyword to get record
--through this query we are fetching top 5 player records whose BaseValue are high
select top 5 * from player order by BaseValue desc

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

--group by clause 
--use to group result set of selected rows based on values of one or more columns or expression.
--group by is always use with some aggregate function.

--in this way we can find totalexpenditure of a team by adding basevalue 
select TeamName,sum(BaseValue) as TotalExp 
from player group by TeamName

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

	
