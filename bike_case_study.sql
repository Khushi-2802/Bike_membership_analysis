CREATE TABLE temp_union( 
ride_id text,
rideable_type text,
started_at timestamp,
ended_at timestamp,
member_casual text,
start_day text,
Duration FLOAT,
start_month TEXT);
INSERT INTO temp_union
SELECT * FROM(
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.april22
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.may22
UNION ALL 
SELECT ride_id,rideable_type,started_at,ended_at,member_casual, dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.june22
UNION ALL 
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.july22
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at,member_casual, dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.august22
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.september22
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.october22
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.november22
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.december22
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.january23
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.february23
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.march23
UNION ALL
SELECT ride_id,rideable_type,started_at,ended_at, member_casual,dayname(started_at) as start_day,timestampdiff(MINUTE,started_at,ended_at) AS Duration , monthname(started_at) AS start_month FROM bellabeat_case_study.april23
)AS temp;


#inferences

SELECT avg(Duration) AS MEAN_RIDE_LENGTH,member_casual
FROM bellabeat_case_study.temp_union
GROUP BY member_casual;


SELECT AVG(Duration) AS MEAN_DURATION,start_day as DAY_OF_WEEK
FROM bellabeat_case_study.temp_union
GROUP BY start_day;

SELECT AVG(Duration) AS MONTH_MEAN ,start_month
FROM bellabeat_case_study.temp_union
GROUP BY start_month;

SELECT COUNT(ride_id) AS NO_OF_RIDERS, start_month AS RIDE_MONTH
FROM bellabeat_case_study.temp_union
GROUP BY start_month;

SELECT COUNT(ride_id) AS NO_OF_RIDERS, start_month AS RIDE_MONTH,member_casual AS membership
FROM bellabeat_case_study.temp_union
GROUP BY start_month,membership;

SELECT COUNT(ride_id) AS NO_OF_RIDERS, start_day AS WEEK_DAY
FROM bellabeat_case_study.temp_union
GROUP BY start_day;

SELECT COUNT(ride_id) AS NO_OF_RIDERS, member_casual AS membership
FROM bellabeat_case_study.temp_union
GROUP BY member_casual;

SELECT COUNT(ride_id) AS NO_OF_RIDERS, rideable_type
FROM bellabeat_case_study.temp_union
GROUP BY rideable_type;

SELECT COUNT(ride_id) AS NO_OF_RIDERS, start_month AS RIDE_MONTH,member_casual AS membership
FROM bellabeat_case_study.temp_union
GROUP BY start_month,member_casual;

