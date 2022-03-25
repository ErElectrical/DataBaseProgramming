Use TournamentDataBase ;

create table Player
(
	Id int identity(1,1) primary key,
	FirstName varchar(100),
	LastName varchar(100),
	City varchar(100),
	State varchar(100),
	Email varchar(200)
);

insert into Player(FirstName,LastName,City,State,Email)
values('Tahir','randy','Columb','bihar','tahir@randy');

insert into Player(FirstName,LastName,City,State,Email)
values('sam','lokhand','jammu','kashmir','sam@lokhand');

insert into Player(FirstName,LastName,City,State,Email)
values('shyam','sharma','nalanda','bihar','shyam@sharma');

insert into Player(FirstName,LastName,City,State,Email)
values('kufri','parak','asaudha','Hr','kufri@parak');

insert into Player(FirstName,LastName,City,State,Email)
values('Db','agnitok','asamina','aasam','Db@agnitok');

select * from Player;

/*
	When you use the SELECT statement to query data from a table, 
	the order of rows in the result set is not guaranteed.
    It means that SQL Server can return a result set with an unspecified order of rows.

    The only way for you to guarantee that the rows in the result set are sorted 
	is to use the ORDER BY clause.

	It can be in ascending and descending order.
*/

-- Sorting data

-- Sort a result set by one column 

select * from Player
order by city;

--sort a result set by one column in descending

select FirstName,LastName
from Player
order by City desc;

--sort result set by multiple column

select * from Player
order by 
 City,State;

--sort a result set by multiple column but in different order

select FirstName,LastName,Email
from Player
order by FirstName desc,
LastName asc;

--sort a result set by column that not exist in select items.
--It is possible to sort the result set by a column that does not appear on the select list.

select FirstName,LastName,Email
from Player
order by City desc;

--sort a result set by evalating an expression

select FirstName,LastName,Email
from Player
order by len(FirstName) desc




