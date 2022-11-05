select * from race_offenders
select * from race_victims
select * from race_offense

-- 1. What month has the highest hate crime rate? 
select month, sum(total_victims) as "victims_per_month"
from race_victims
group by month
order by victims_per_month desc


/*select concat (
	   month, ' ', year(incident_date)
	   ) as "incident_period",
	   sum(total_victims) as "victims_per_month" 
from race_victims
--where month = 'June'
group by month, incident_date
order by victims_per_month desc*/

/*select concat(month(rv1.incident_date), ' ', year(rv1.incident_date)) as "incident period",
	   sum(rv2.total_victims) over (partition by rv1.incident_date) as "victims_per_period"
from race_victims as rv1 
inner join race_victims as rv2 on rv1.incident_number=rv2.incident_number
group by rv1.incident_date, rv2.total_victims
order by victims_per_period desc*/


--2. What group of people are most likely to be affected by hate crimes?
select bias_category, 
       count(bias_category) as "hate_count"
from race_offense
group by bias_category
order by hate_count desc

--3. What race is more likely to commit hate crimes
select offender_race_group, count(offender_race_group) as "number_of_offenders"
from race_offenders
where offender_race_group is not NULL
group by offender_race_group
order by number_of_offenders desc*/

/*What race of offenders have commited the most crimes?
select distinct(ro.offender_race_group),
	   sum(cast(rv.total_victims as int)) over (partition by ro.offender_race) as victims_per_race_group
from race_offenders as ro 
join race_victims as rv 
	on ro.incident_number=rv.incident_number
	and ro.incident_date=rv.incident_date
where ro.offender_race_group is not NULL
order by victims_per_race_group desc*/

--4. What crimes are most common to what locations 
select offense_loc_group, 
	   offense_group, 
	   count(offense_group) as "location_freq"
from race_offense
where offense_group is not null
group by offense_group, offense_loc_group
order by location_freq desc, offense_loc_group asc
--we can see that the most common type of crime is assault and it occurs most at roads or public routes





