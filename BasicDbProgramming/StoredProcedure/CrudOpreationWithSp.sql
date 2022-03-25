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