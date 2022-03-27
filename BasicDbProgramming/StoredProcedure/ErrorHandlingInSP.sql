/*
	The TRY CATCH construct allows you to gracefully handle exceptions in SQL Server. 
	To use the TRY CATCH construct, 
	you first place a group of Transact-SQL statements that could cause an exception in a BEGIN TRY...END TRY block.
	Then you use a BEGIN CATCH...END CATCH block immediately after the TRY block

	if statement inside the try block excuted successfully
	than it will not come to catch block 
	if exception occur than control goes to catch block

	The CATCH block functions
    Inside the CATCH block, you can use the following functions to get the detailed information on the error that occurred:

    ERROR_LINE()    returns the line number on which the exception occurred.

    ERROR_MESSAGE() returns the complete text of the generated error message.

    ERROR_PROCEDURE() returns the name of the stored procedure or trigger where the error occurred.

    ERROR_NUMBER() returns the number of the error that occurred.

    ERROR_SEVERITY() returns the severity level of the error that occurred.

    ERROR_STATE() returns the state number of the error that occurred.

	these functions only works inside catch block outside of catch block
	these functions returns null

	we can also do nesting in try catch block if needed.

	syntax for nested try catch block

	BEGIN TRY
    --- statements that may cause exceptions
    END TRY
BEGIN CATCH
    -- statements to handle exception
    BEGIN TRY
        --- nested TRY block
    END TRY
    BEGIN CATCH
        --- nested CATCH block
    END CATCH
END CATCH

*/

--an exaple to understand try catch block

create procedure dbo.DivideFunction
(
	@num1 decimal,
	@num2 decimal,
	@result decimal output
)
as
begin 
	begin try
		set @result = @num1/@num2;
	end try
	begin catch
		SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
	end catch
end;
go

--its time to execute the SP

declare 
	@ans decimal ;
exec DivideFunction 20,0,@ans output;
print @ans;

/*
	to understand Try catch block with transaction

	for this purpose we are going to add two more table in our database

	Inside a CATCH block, you can test the state of transactions by using the XACT_STATE() function.

	If the XACT_STATE() function returns -1, 
	it means that an uncommittable transaction is pending, 
	you should issue a ROLLBACK TRANSACTION statement.

	In case the XACT_STATE() function returns 1,
	it means that a committable transaction is pending. 
	You can issue a COMMIT TRANSACTION statement in this case.

	If the XACT_STATE() function return 0, 
	it means no transaction is pending, therefore, you don’t need to take any action.

	
	It is a good practice to test your transaction state before issuing a COMMIT TRANSACTION or ROLLBACK TRANSACTION statement in a CATCH block to ensure consistency.

*/

-- we are going to add a table namead as contract that have data regarding the contract of players
-- who are playing in our Tournament 

select * from player;


--create table 
create table Contract
(
	contract_id int 
	primary key identity,
	player_id int not null,
	Contract_note varchar(100),
	foreign key(player_id) REFERENCES dbo.player(Id)
);

--insert data into contract
insert into Contract(player_id,Contract_note)
values(2,'sam lokhand contract for single match');

insert into Contract(player_id,Contract_note)
values(3,'shyam sharma contract for two match');

insert into Contract(player_id,Contract_note)
values(4,'kufri parak contract for Five match');

insert into Contract(player_id,Contract_note)
values(5,'Db agnitok contract for three match');

insert into Contract(player_id,Contract_note)
values(6,'jam som contract for full session');

insert into Contract(player_id,Contract_note)
values(7,'paul lee contract for ten match');

insert into Contract(player_id,Contract_note)
values(8,'mack randy contract for ten session');

insert into Contract(player_id,Contract_note)
values(9,'Db agnitok contract for single match');

insert into Contract(player_id,Contract_note)
values(10,'kufri parak contract for full session');

insert into Contract(player_id,Contract_note)
values(11,'sam lokhand contract for 12 match');

insert into Contract(player_id,Contract_note)
values(12,'samuya chakma contract for full session');

select * from Contract;

create procedure dbo.ReportError
as
		select
		ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage;  
GO

create Procedure dbo.DeletePlayer
	@Id int 
as
begin
	begin try
		--delete the person
		delete from player
		where Id = @Id;
		--if delete success than commit transaction
		commit transaction;
	end try
	begin catch
		--report exceptions
		exec dbo.ReportError;
		--check if transaction is uncommitable
		if(XACT_STATE()) = -1
		begin
			print 'opreation unsuccessfull rollback '
			rollback transaction;
		end;
		--check if transaction is commitable
		if(XACT_STATE()) = 1
		begin
			print 'opreation is commitable '
			commit transaction;
		end;
		--check if we have do action or not
	    if(XACT_STATE()) = 0 
		begin
			print ' nothing to do no action requires '
		end;

		end catch;
end;

exec dbo.DeletePlayer 4;

/*
	The THROW statement raises an exception and transfers execution to a CATCH block of a TRY CATCH construct.
	syntax of throw is 

	THROW [ error_number ,  
        message ,  
        state ];

	error_number
	The error_number is an integer that represents the exception. 
	The error_number must be greater than 50,000 and less than or equal to 2,147,483,647.

	message
	The message is a string of type NVARCHAR(2048) that describes the exception.

	state
	The state is a TINYINT with the value between 0 and 255. 
	The state indicates the state associated with the message.

	If you don’t specify any parameter for the THROW statement, 
	you must place the THROW statement inside a CATCH block:

	BEGIN TRY
		-- statements that may cause errors
	END TRY
	BEGIN CATCH
		-- statement to handle errors 
    THROW;   
	END CATCH

	difference between Throw and Raiseerror

	RaiseError : 
	-message_id pass to raiseerror must be defined in sys.messages views
	-message parameter can be defined through printf format such as %s and %d.
	-The severity parameter indicates the severity of the exception.	

	Throw :
	-error_number does not have to be defined in sys.message views.
	--not accept printf formatting use formatmessage() function to substitute parameter.
	--severity always set to 16.
*/






		
	