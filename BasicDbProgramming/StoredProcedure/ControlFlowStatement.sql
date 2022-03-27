
--Control flow statement

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


--The WHILE statement is a control-flow statement that allows you to execute a statement block repeatedly as long as a specified condition is TRUE.

--syntax for while statement
/*
	while boolean_expression
		{sql statement | sql block }

    First, the Boolean_expression is an expression that evaluates to TRUE or FALSE.

    Second, sql_statement | statement_block is any Transact-SQL statement or a set of Transact-SQL statements.
	A statement block is defined using the BEGIN...END statement.

    If the Boolean_expression evaluates to FALSE when entering the loop, 
	no statement inside the WHILE loop will be executed.

    Inside the WHILE loop, you must change some variables to make the Boolean_expression returns FALSE at some points.
	Otherwise, you will have an indefinite loop.

    Note that if the Boolean_expression contains a SELECT statement,
	it must be enclosed in parentheses.

    To exit the current iteration of the loop immediately, you use the BREAK statement. 
	To skip the current iteration of the loop and start the new one, you use the CONTINUE statement.


*/

declare @counter int = 1;
while @counter <= 5
begin 
	print @counter;
	set @counter = @counter+1;
end

--BREAK – exit the loop immediately and skip the rest of the code after it within a loop.

declare @count int = 1;
while @count <= 5
begin 
	if(@count = 4)
	begin
		break;
	end
	print @count;

	set @count = @count+1;
end




