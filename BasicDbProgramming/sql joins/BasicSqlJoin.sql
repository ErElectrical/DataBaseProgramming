Use TournamentDataBase ;

/*we store our data in multiple logical tables that are linked together by a common key value in relational databases
 like SQL Server, Oracle
, MySQL
, and others. 
As a result, we constantly need to get data from two or more tables into the desired output based on some conditions.
 We can quickly achieve this type of data in SQL Server using the SQL JOIN clause.

 The join clause allows us to retrieve data from two or more related tables into a meaningful result set.
  We can join the table using a SELECT statement and a join condition. 

  Choose columns from each table that should be used in the join.
   A join condition indicates a foreign key from one table and its corresponding key in the other table.
  Specify the logical operator to compare values from the columns like =, <, or >.

 */

 create table TournamentFee
 (
	TeamName varchar(100) not null,
	fee money,
	Game varchar(100)
 );

 insert into TournamentFee(TeamName,fee,Game)
 values('csk',15000,'cricket');

  insert into TournamentFee(TeamName,fee,Game)
 values('csk',17000,'football');

  insert into TournamentFee(TeamName,fee,Game)
 values('kkr',10000,'cricket');

  insert into TournamentFee(TeamName,fee,Game)
 values('lsk',5000,'cricket');

 insert into TournamentFee(TeamName,fee,Game)
 values('lsk',25000,'football');

  insert into TournamentFee(TeamName,fee,Game)
 values('msk',15000,'cricket');

  insert into TournamentFee(TeamName,fee,Game)
 values('msk',15000,'football');

   insert into TournamentFee(TeamName,fee,Game)
 values('maaha',15000,'cricket');

   insert into TournamentFee(TeamName,fee,Game)
 values('leo',15000,'shoutput
 ');

   insert into TournamentFee(TeamName,fee,Game)
 values('kombi',1500,'rugby');

 select * from player;

 select * from TournamentFee;

 --Inner join
 --This JOIN returns all records from multiple tables that satisfy the specified join condition. 
 --It is the simple and most popular form of join and assumes as a default join. 
 --If we omit the INNER keyword with the JOIN query, we will get the same output.
 --Inner join basically provide common of both the tables 

 select * 
 from player as p
 inner join TournamentFee as T
 on p.TeamName = t.TeamName
 order by FirstName;

 --Left join 
 --Left join selects data starting from the left table and matching rows in the right table.
 -- The left join returns all rows from the left table and the matching rows from the right table.
 -- If a row in the left table does not have a matching row in the right table, the columns of the right table will have nulls.
--The left join is also known as the left outer join. The outer keyword is optional.
--left table is table that is with from clause
--right table is table that is with left join

select * 
from TournamentFee as T
left join  player as p
on p.TeamName = t.TeamName
order by BaseValue;

--Right join
--The right join or right outer join selects data starting from the right table.
-- It is a reversed version of the left join.
--The right join returns a result set that contains all rows from the right table and the matching rows in the left table. 
--If a row in the right table does not have a matching row in the left table, all columns in the left table will contain nulls.

select * 
from player as p
right join TournamentFee as t
on t.TeamName = p.TeamName
order by FirstName;

 --Full join 
 --The full outer join or full join returns a result set that contains all rows from both left and right tables,
 -- with the matching rows from both sides where available. In case there is no match, 
 --the missing side will have NULL values.

 select *
 from player as p
 full join TournamentFee as t
 on t.TeamName = p.TeamName
 order by p.BaseValue asc,t.fee desc;








