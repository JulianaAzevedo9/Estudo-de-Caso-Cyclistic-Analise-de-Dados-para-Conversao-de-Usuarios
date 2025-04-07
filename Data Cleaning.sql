-- All rows containing missing values were deleted.
-- adding 3 new columns ride_length, day_of_the_week and month.
-- Trips with a duration shorter than 1 minute or longer than 1 day were excluded
-- A total of 1,400,282 rows were removed during this cleaning phase.

DROP TABLE IF EXISTS cleaned_cyclistic_2022;

CREATE TABLE IF NOT EXISTS cleaned_cyclistic_2022 AS (
    SELECT
        a.ride_id,
        a.rideable_type,
        a.started_at,
        a.ended_at,
        b.ride_length,
        CASE EXTRACT(DOW FROM a.started_at)
            WHEN 0 THEN 'SUN'
            WHEN 1 THEN 'MON'
            WHEN 2 THEN 'TUES'
            WHEN 3 THEN 'WED'
            WHEN 4 THEN 'THURS'
            WHEN 5 THEN 'FRI'
            WHEN 6 THEN 'SAT'
        END AS day_of_week,
        CASE EXTRACT(MONTH FROM a.started_at)
            WHEN 1 THEN 'JAN'
            WHEN 2 THEN 'FEB'
            WHEN 3 THEN 'MAR'
            WHEN 4 THEN 'APR'
            WHEN 5 THEN 'MAY'
            WHEN 6 THEN 'JUN'
            WHEN 7 THEN 'JUL'
            WHEN 8 THEN 'AUG'
            WHEN 9 THEN 'SEP'
            WHEN 10 THEN 'OCT'
            WHEN 11 THEN 'NOV'
            WHEN 12 THEN 'DEC'
        END AS month,
        a.start_station_name,
        a.end_station_name,
        a.start_lat,
        a.start_lng,
        a.end_lat,
        a.end_lng,
        a.member_casual
    FROM
        cyclistic_2022 AS a
    JOIN (
        SELECT
            ride_id,
            EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 AS ride_length
        FROM
            cyclistic_2022
    ) b ON a.ride_id = b.ride_id
    WHERE
        a.start_station_name IS NOT NULL AND
        a.end_station_name IS NOT NULL AND
        a.end_lat IS NOT NULL AND
        a.end_lng IS NOT NULL AND
        b.ride_length > 1 AND b.ride_length < 1440  -- Use minutes for comparison
);

Select * from cleaned_clyclistic_2022


