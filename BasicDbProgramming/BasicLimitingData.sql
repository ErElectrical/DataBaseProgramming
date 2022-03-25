Use TournamentDataBase ;

--Limit the number of rows returned by the query

--The OFFSET and FETCH clauses are the options of the ORDER BY clause. 
--They allow you to limit the number of rows to be returned by a query.

--The OFFSET clause specifies the number of rows to skip before starting to return rows from the query. 
--value of it can be constant , varible and expression

--The FETCH clause specifies the number of rows to return after the OFFSET clause has been processed.
-- there is no meaning of fetch without offset
-- offset is mandatory where fetch is optional

--insert more data into player table 

insert into Player(FirstName,LastName,City,State,Email)
values('jam','som','bhirandi','saumaliya','jam@som');

insert into Player(FirstName,LastName,City,State,Email)
values('paul','lee','Chain','kuwan','paul@lee');

insert into Player(FirstName,LastName,City,State,Email)
values('mack','randy','andheri','mumbai','mack@randy');

select * from Player;

--skip first 4 records and show rest

select * from Player
order by FirstName desc
offset 4 rows;

--skip first 4 records and show next 4 rows.

select FirstName,LastName,Email
from Player
order by FirstName
offset 4 rows
fetch first 3 rows only;

--the FIRST and NEXT are synonyms respectively so you can use them interchangeably. 