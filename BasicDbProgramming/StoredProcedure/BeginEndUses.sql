/*
	overview of Begin End statement
	The BEGIN...END statement is used to define a statement block.
	A statement block consists of a set of SQL statements that execute together.
	A statement block is also known as a batch.
	Begin...End is use to wrap up the sql statement 

*/

begin
	select 
		FirstName,
		LastName,
		BaseValue
	from 
		player
	where 
		BaseValue > 2000;
	if @@rowcount = 0
		print 'no player found ';
end;


--Nesting begin...end 
--we can create a block inside a block of sql statement.

begin 
	declare @FullName varchar(100);
	declare @BaseValue money;
	select Top 1
		@FullName = FirstName+'  '+LastName,
		@BaseValue = BaseValue
	from
		player
	order by Basevalue desc;
	if @@rowcount <> 0
	begin
		print 'the most expensive player name is '+ @FullName;
		print 'Player basevalue is '+ convert(varchar(100),@BaseValue);
	end
	else
	begin
		print 'no player found'
	end;
end;


