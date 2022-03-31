--Advance joins

--left join 
--returns all matching records + all non matching records from left table 
--but acc to our requirement we want non matching records only.

select * 
from player as p
left join TournamentFee as t
on p.TeamName = t.TeamName
-- through where clause we enforce the reult set to get only unmatched recoed from table
where t.TeamName is null


--how to handle null values.
--we can force the sql server to show something we want instead of showning null .

--first way

select isnull(null,'no team ') as Team
--if we provide null value than it will show 'no team '
--if we provide other value which is not null
--than sql server will show that value instead of 'no team'
--select only the unmatched records from the right table.

select p.FirstName as 'player name' , ISNULL(t.TeamName , 'no team ') as Team
from player as p
left join  TournamentFee as t
on p.TeamName = t.TeamName

--second way to do it
--is use coalesce function
--which is similiar to isnull function
--it return first non null values.

select coalesce(null,'no team') as team

select p.FirstName+'  '+p.LastName as 'player name' , coalesce(t.TeamName , 'no team ') as Team
from player as p
left join  TournamentFee as t
on p.TeamName = t.TeamName

--third way to do it is 
--through case 
--syntax for using case keyword is
--case when expression then ' ' else ' ' end

select p.FirstName+'  '+p.LastName as 'player name' , case when t.TeamName is null then 'no team ' else t.TeamName end as Team
from player as p
left join  TournamentFee as t
on p.TeamName = t.TeamName





select * 
from player as p
right join TournamentFee as t
on p.TeamName = t.TeamName
where t.TeamName is null

--select only the unmatched part from both tables.

select *
from player as p
full join TournamentFee as t
on p.TeamName = t.TeamName
where p.TeamName is null
or t.TeamName is null

--self join 
--join in same table 
--based on some relationship between columns of 