-- Data Exploration

-- Checking Data Types:

describe cyclistic_2022;

-- Checking the number of NULL values in the columns:
SELECT COUNT(*) - COUNT(ride_id) as ride_id,
COUNT(*) - COUNT(rideable_type) as rideable_type,
COUNT(*) - COUNT(started_at) as started_at,
COUNT(*) - COUNT(ended_at) AS ended_at,
COUNT(*) - COUNT(start_station_name) as start_station_name,
COUNT(*) - COUNT(start_station_id) as start_station_id,
COUNT(*) - COUNT(end_station_name) as end_station_name,
COUNT(*) - COUNT(end_station_id) as end_station_id,
COUNT(*) - COUNT(start_lat) as start_lat,
COUNT(*) - COUNT(start_lng) as start_lng,
COUNT(*) - COUNT(end_lat) as end_lat,
COUNT(*) - COUNT(end_lng) as end_lng,
COUNT(*) - COUNT(member_casual) as member_casual
FROM cyclistic_2022;
-- A total of 854,844 records are missing both start_station_name and start_station_id. 
-- And A total of 915,082 records are missing both end_station_name and end_station_id. 
-- A total of 5,874 records are missing both end_lat (ending latitude) and end_lng (ending longitude).

-- Checking if there is duplicates in the ride_id Column:
Select count(*) - count (disctict ride_id )from cyclistic_2022;
-- There is no duplicates

-- Checking the Length of ride_id:
Select char_length(ride_id) from cyclistic
group by ride_id;
-- ride_id is consistent with 16 characters

-- Checking the rideable types of bikes in the column rideable_type:
select distinct rideable_type,
count(rideable_type) as numero_de_viagens
from cyclistic_2022
group by rideable_type;
-- According to the results, there are three types of bikes: electric_bike, classic_bike, and docked_bike.

-- This verification assesses whether bike trips exceed a 24-hour interval or fall below a 1-minute duration:
SELECT COUNT(*) AS mais_longo_que_um_dia
FROM cyclistic_2022
WHERE (ended_at - started_at) >= INTERVAL '1 day';
SELECT COUNT(*) AS menos_que_um_minuto
FROM cyclistic_2022
WHERE (ended_at - started_at) <= INTERVAL '1 minute';
-- 5,395 trips exceeded a 1-day duration (potential outliers or logging errors).
-- 121,410 invalid trips had either: A duration of less than 1 minute, or end time earlier than the start time.

-- Checking the distinct values of member_casual:
select distinct member_casual, count(member_casual) as no_of_trips
from cyclistic_2022
group by member_casual;
-- There is two types of memberships casual and member.



