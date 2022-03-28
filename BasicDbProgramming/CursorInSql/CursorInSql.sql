/*
	A SQL cursor is a database object that is used to retrieve data from a result set one row at a time. 
	A SQL cursor is used when the data needs to be updated row by row.

	The following steps are involced in a SQL cursor life cycle. 

	Declaring Cursor
	A cursor is declared by defining the SQL statement.
 
	Opening Cursor
	A cursor is opened for storing data retrieved from the result set.
 
	Fetching Cursor
	When a cursor is opened, rows can be fetched from the cursor one by one or in a block to do data manipulation.
 
	Closing Cursor
	The cursor should be closed explicitly after data manipulation.
 
	Deallocating Cursor
	Cursors should be deallocated to delete cursor definition and release all the system resources associated with the cursor.

	where cursor can be useful
	cursors are usefull when you have to deal with one row at a time
	rather than whole row at a time .

	we use for and while loop to itearte through each rows.

	LifeCycle of sql cursor

	First, declare a cursor.

	DECLARE cursor_name CURSOR
    FOR select_statement;
	
	Next, open and populate the cursor by executing the SELECT statement:

    open cursor_name;

	Then, fetch a row from the cursor into one or more variables:

	FETCH NEXT FROM cursor INTO variable_list;

	SQL Server provides the @@FETCHSTATUS function 
	that returns the status of the last cursor FETCH statement executed against the cursor; 
	If @@FETCHSTATUS returns 0, 
	meaning the FETCH statement was successful. 
	You can use the WHILE statement to fetch all rows from the cursor as shown in the following code:

	while @@fetchstatus = 0
	begin
		fetch next from cursor_name
	end

	After that, close the cursor:

	CLOSE cursor_name;

	Finally, deallocate the cursor:

	DEALLOCATE cursor_name;

*/

--First, declare two variables to hold FullName and BaseValue, 
--and a cursor to hold the result of a query that retrieves FullName  and BaseValue  from the player table:

--declare varibles
declare 
	@FullName varchar(100),
	@BaseValue  money;

--declare cursor
declare cursor_PlayerDetails cursor
for select 
	FirstName+' '+LastName,
	BaseValue
from 
	player;

--open cursor
open cursor_PlayerDetails;

--fetch a row from the cursor and put it into varibles
fetch next from cursor_PlayerDetails into
	@FullName,
	@BaseValue;

--use while to fetch all records from the cursor.
while @@fetch_status = 0
begin
	print @FullName + cast(@BaseValue as varchar(100));
	fetch next from cursor_PlayerDetails into
		@FullName,
		@BaseValue;
end;

--close cursor
close cursor_PlayerDetails;

--deallocate cursor.
deallocate cursor_PlayerDetails;

/*

	Static Cursor
 
	A Static Cursor shows the result set as it was when the cursor was opened. 
	If we make change to the table after the opening of Static Cursor then these changes are not reflected in the cursor. 
	For example, if after opening the cursor we delete a row, 
	and fetch that record by the cursor, 
	then the cursor shows that record.

	Creation of Static Cursor 
	declare static_cursor cursor  
	static for   
	select * from emp 

	open static cursor
	open static_cursor.

	Fetching first data from Static Cursor
	fetch first from static_cursor  

	Fetching next data from Static Cursor
	fetch next from static_cursor 
	
	Fetching last data from Static Cursor
	fetch last from static_cursor  

	Fetching second data from Static Cursor
	fetch absolute 2 from static_cursor

	Fetching next 2nd data from Static Cursor
	fetch relative 2 from static_cursor  

	Closing of Static Cursor
	close static_cursor  

	Deallocating Static Cursor
	deallocate static_cursor

 */


 /*

	Dynamic Cursor
 
	Dynamic Cursor is the opposite of the Static Cursor. 
	When we make changes in the table after opening the Dynamic Cursor and scroll through a Dynamic Cursor all changes made to the table reflects the Dynamic Cursor. 
	For example, 
	If we delete the record from the table after the opening of the Dynamic Cursor, 
	we can't access that record.

	Creation of Dynamic Cursor

	declare dynamic_cursor cursor  
	dynamic for   
	select * from emp

	Opening of Dynamic Cursor
	open dynamic_cursor  

	Fetching first data from Dynamic Cursor
	fetch First from dynamic_cursor  

	Fetching next data from Dynamic Cursor
	fetch next from dynamic_cursor  

	Closing of Dynamic Cursor
	close dynamic_cursor  

	Deallocating  Dynamic Cursor
	deallocate dynamic_cursor
*/

/*
	Keyset-Driven Cursor
 
	When we open keyset-driven cursor then it creates a list of unique values in the tempdb database. 
	These values are called keyset. 
	Every keyset uniquely identifies a single row in the result set.
 
	A Keyset is created after the opening of the cursor so the number of rows is fixed until we close the cursor.

	Creation of Keyset-driven cursor
	declare key_cursor cursor  
	keyset for   
	select * from emp  

	Opening of Keyset-driven cursor
	open key_cursor  

	Fetching data from Keyset-Driven cursor 

	Fetching first data from Keyset-driven cursor
	fetch First from key_cursor  

	Fetching next data from Keyset-driven cursor
	fetch next from key_cursor  

	Closing of Keyset Drivin cursor
	close key_cursor  

	Deallocation of memory
	deallocate key_cursor

*/

























 







