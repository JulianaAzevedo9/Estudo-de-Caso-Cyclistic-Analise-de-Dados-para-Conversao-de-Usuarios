-- Query to identify the total trip count grouped by rideable_type and member_casual.
SELECT 
    rideable_type,
    member_casual,
    COUNT(*) AS trip_count
FROM cleaned_cyclistic_2022_1
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual;

-- Query to count trips by member type (casual vs. member).
SELECT 
    member_casual,
    COUNT(*) AS total_trips
FROM cleaned_cyclistic_2022_1
GROUP BY member_casual;

-- Count trips by member type (member/casual) and month
SELECT 
    COUNT(*) AS trip_count,
    member_casual,
    month
FROM cleaned_cyclistic_2022_1
GROUP BY month, member_casual
ORDER BY month, member_casual;

-- Count trips by member type (member/casual) and week day
SELECT 
    COUNT(*) AS trip_count,
    member_casual,
    month
FROM cleaned_cyclistic_2022_1
GROUP BY day_of_week, member_casual
ORDER BY day_of_week, member_casual;

-- Count trips by member type (member/casual) and hour
SELECT 
    EXTRACT(HOUR FROM started_at) AS hour_of_day,
    member_casual,
    COUNT(*) AS trip_count
FROM cleaned_cyclistic_2022_1
GROUP BY EXTRACT(HOUR FROM started_at), member_casual
ORDER BY hour_of_day, member_casual;

-- Count trips by member type (member/casual) and hour
SELECT 
    member_casual,
    month,
    COUNT(*) / COUNT(DISTINCT DATE(started_at)) AS avg_daily_trips
FROM cleaned_cyclistic_2022_1
GROUP BY month, member_casual
ORDER BY month, member_casual;

-- Average Bike Trip Duration by Month
SELECT 
    month,
    member_casual,
    AVG(ride_length) AS avg_duration
FROM cleaned_cyclistic_2022_1
GROUP BY month, member_casual
ORDER BY month, member_casual;

-- Average Bike Trip Duration by day of week
SELECT 
    day_of_week,
    member_casual,
    AVG(ride_length) AS avg_duration
FROM cleaned_cyclistic_2022_1
GROUP BY day_of_week, member_casual
ORDER BY day_of_week, member_casual;

-- Average Bike Trip Duration by Hour
SELECT 
    EXTRACT(HOUR FROM started_at) AS hour_of_day,
    member_casual,
    AVG(ride_length) AS avg_duration
FROM cleaned_cyclistic_2022_1
GROUP BY EXTRACT(HOUR FROM started_at), member_casual
ORDER BY hour_of_day, member_casual;

-- Query to select the departure locations by member type.
SELECT 
    member_casual,
    start_lat,
    start_lng,
    start_station_name
FROM cleaned_cyclistic_2022_1
WHERE start_station_name IS NOT NULL
GROUP BY 
    member_casual,
    start_lat,
    start_lng,
    start_station_name
ORDER BY member_casual, start_station_name;

-- Query to select the arrival locations by member type.
SELECT 
    member_casual,
    end_lat,
    end_lng,
    end_station_name
FROM cleaned_cyclistic_2022_1
WHERE end_station_name IS NOT NULL
GROUP BY 
    member_casual,
    end_lat,
    end_lng,
    end_station_name
ORDER BY member_casual, end_station_name;

	
	