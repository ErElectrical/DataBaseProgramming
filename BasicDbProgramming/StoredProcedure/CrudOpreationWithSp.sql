Use TournamentDataBase ;

--stored procedure is a precompiled sql code that is available for us whenever we need it
--we can call stored procedure by its name.
--stored procedures are used efficiently to deal with data from code .
--A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.
--So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

--perform retrival opreation on table through sp
create procedure GetAllPlayerDetails
as
begin
	select * 
	from player
end;

exec GetAllPlayerDetails;

--perform insert opreation on table through sp

create procedure InsertPlayerDetails
	@FirstName varchar(100),
	@LastName varchar(100),
	@City varchar(100),
	@State varchar(100),
	@Email varchar(200),
	@Basevalue money
as
begin
	insert into player(FirstName,LastName,City,State,Email,BaseValue)
	values(@FirstName,@LastName,@City,@State,@Email,@Basevalue)
end;

exec InsertPlayerDetails  @FirstName='samuya',@LastName='chakma',@City='gangtok',@State='agartala',@Email='saumya@chakma', @Basevalue = 1290;

select * from player;

--Perform Delete opreation on table through a sp

create procedure DeletePlayerDetails
	@FirstName varchar(100),
	@LastName varchar(100),
	@Team varchar(100)
as
begin
	delete from Player
	where FirstName = @FirstName and LastName = @LastName and TeamName = @Team
end;

exec DeletePlayerDetails @FirstName = 'Tahir', @LastName = 'randy', @Team = 'csk';

--create a stored procedure of text type 
--in this SP we provide a glimpse of FirstName and LastName and fetch BaseValue of Player .
select * from Player;

create procedure dbo.FindBaseValueOfPLayer
(
	@FirstName varchar(100),
	@LastName varchar(100),
	@TeamName varchar(100)
)
as
begin
	select FirstName,LastName,BaseValue,Email
	from player
	where 
		FirstName Like '%' + @FirstName + '%' and
		LastName Like '%' + @LastName + '%' and
		TeamName = @TeamName
	order by BaseValue desc
end;

exec dbo.FindBaseValueOfPLayer 'sa','lok','csk';


--passing optional parameter 
--as when we declare some parameter for SP
--we can provide some default value to it
--if value is provided to parameter it will surpass that value
--we are providing here null value we can also provide default value also.

create procedure dbo.FindBaseValueProvideOptionalParameter
(
	@FirstName varchar(100) = null,
	@LastName varchar(100) = null,
	@TeamName varchar(100)
)
as
begin
	select FirstName,LastName,BaseValue,Email
	from Player
	where
	 FirstName like '%'+@FirstName+'%' and 
	 LastName like '%'+@LastName+'%' and
	 TeamName = @TeamName
	order by
		BaseValue
end;

exec dbo.FindBaseValueProvideOptionalParameter 
	@FirstName = 'db',
	@TeamName = 'csk';


--A variable is an object that holds a single value of a specific type e.g., integer, date, or varying character string.

--We typically use variables in the following cases:

--As a loop counter to count the number of times a loop is performed.
--To hold a value to be tested by a control-of-flow statement such as WHILE.
--To store the value returned by a stored procedure or a function

--declare a varible and use it in sql statement 

declare 
	@FirstName varchar(100);
set @FirstName = 'Db';
select * from player
where FirstName = @FirstName
order by BaseValue;

--Storing query result in a variable
--we can also store the result of query into varible 

declare 
	@result int
set @result = (
	select count(*)
	from player
);

--you can see the result trough print statement
print @result;

--we can also do it through selelct statement

select @result;

--we can also provide some msg with print statement
print ' The number of entity is : ' +cast(@result as varchar(100)); 

--we can also hide the number of rows affected .
set nocount on;

--Selecting a record into variables
--we will put data into varible and than 
--we fetch specific data from it

declare 
	@FirstName varchar(100),
	@BaseValue money;
select 
	@FirstName=FirstName,
	@BaseValue=BaseValue
from 
	Player
where 
	Id = 10;

select 
	@FirstName as 'First Name',
	@BaseValue as 'Base Value ';

--Output parameter
--it is use to return data from the SP to calling program 
--syntax to create output parameter
--parameter_name datatype output

--for example we will fetch all players of a particular team
--following sql statement fetch player count of a particular team through a output parameter
-- we will use @@rowcount Note that the @@ROWCOUNT is a system variable that returns the number of rows read by the previous statement.

create procedure dbo.FetchAllPlayersOfATeam
	@TeamName varchar(100),
	@TeamCount int output
as
begin
	select * 
	from player
	where
		TeamName = @TeamName
	order by FirstName;
	select
		@TeamCount = @@rowcount;
end;

--to excute output parameter stored procedure

--declare a varible first

declare @count int;

--initialise varible to output varible of SP.
--provide it other parameter
exec FetchAllPlayersOfATeam
	@TeamName = 'csk',
	@TeamCount = @count output;

--fetch data and provide alias to output varible
select @count as 'Number of Team Found';


select * from player;

