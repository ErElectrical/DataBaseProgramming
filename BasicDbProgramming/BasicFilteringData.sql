Use TournamentDataBase ;

--filtering data section 

insert into Player(FirstName,LastName,City,State,Email)
values('Db','agnitok','yokvini','leh','Db@agnitok12');

select * from Player;


insert into Player(FirstName,LastName,City,State,Email)
values('kufri','parak','lambo','Hr','kufri@parak31');


insert into Player(FirstName,LastName,City,State,Email)
values('sam','lokhand','amala','kashmir','sam@lokhand');

--distinct clause 
--get only  distinct value over the columns.
--in sort remove duplicate values .

-- filtering single column
select distinct
	FirstName
from 
	Player;

--filtering multiple columns
select distinct
	FirstName,
	LastName,
	Email
from
	Player;

-- Distinct vs Group by

-- this statement group by clause return distinct values of FirstName and LastName
select 
	FirstName,
	LastName
from
	player
group by
	FirstName,
	LastName
order by
	FirstName,
	LastName;

--this distinct statement is use to get distinct values of FirstName,LastName

select distinct
	FirstName,
	LastName
from 
	player;

--where cause filter data based on condition 

select * 
from Player
where 
	Id = 7;

alter table player
add	BaseValue money ;

alter table player
add TeamName varchar(100);

select * from player;

update player
set BaseValue = 2500, TeamName ='csk'
where 
	Id = 1;

update player
set BaseValue = 2700, TeamName ='lsk'
where 
	Id = 2;

update player
set BaseValue = 1500, TeamName ='csk'
where 
	Id = 3;

update player
set BaseValue = 1900, TeamName ='kkr'
where 
	Id = 4;

update player
set BaseValue = 3500, TeamName ='lsk'
where 
	Id = 5;

update player
set BaseValue = 1200, TeamName ='kkr'
where 
	Id = 6;

update player
set BaseValue = 2500, TeamName ='csk'
where 
	Id = 7;

update player
set BaseValue = 500, TeamName ='msk'
where 
	Id = 8;

update player
set BaseValue = 4000, TeamName ='csk'
where 
	Id = 9;

update player
set BaseValue = 700, TeamName ='kkr'
where 
	Id = 10;

update player
set BaseValue = 2650,TeamName ='csk'
where 
	Id = 11;

--Finding rows that meet two condition

select FirstName,LastName,TeamName
from player
where BaseValue > 500 and TeamName = 'csk'
order by FirstName;

--Finding rows that meet any of two condition
select FirstName,LastName,TeamName,BaseValue
from player
where BaseValue > 2500 or TeamName = 'kkr'
order by firstName, BaseValue desc;

-- find Basevalue between range
select *
from player
where BaseValue between  1500 and 3000
order by firstName, BaseValue desc;

--find basevalue between range of a specific Team
select * 
from player
where BaseValue between 500 and 2000 and TeamName = 'kkr'
order by BaseValue desc;

-- get data based on basevalue in a list of money

select *
from player
where 
	BaseValue in(2500,1200,2700)
order by FirstName,BaseValue desc;

-- get data based on glimpse of firstname 
select *
from player
where FirstName like 'pa%'
order by firstName, BaseValue desc;

--column alias
--To assign a column or an expression a temporary name during the query execution, you use a column alias.
--column name can be alias with or without as keyword
--table alias is also possibel same like column alias


select FirstName+' '+LastName
from player;

-- provide column alias as fullname

select FirstName+' '+LastName as FullName
from player;

--if You want space between Column name than provide it in string
select FirstName+' '+LastName as 'Full Name'
from player;






