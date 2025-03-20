DELETE FROM bikeshare.trip_data
WHERE 
    ride_id IS NULL OR
    rideable_type IS NULL OR rideable_type = '' OR
    started_at IS NULL OR
    ended_at IS NULL OR
    start_station_name IS NULL OR start_station_name = '' OR
    start_station_id IS NULL OR start_station_id = '' OR
    end_station_name IS NULL OR end_station_name = '' OR
    end_station_id IS NULL OR end_station_id = '' OR
    start_lat IS NULL OR
    start_lng IS NULL OR
    end_lat IS NULL OR
    end_lng IS NULL OR
    member_casual IS NULL OR member_casual = '';
    
    SELECT 
    SUM(duplicate_count - 1) AS total_duplicates
FROM (
    SELECT 
        ride_id, COUNT(*) AS duplicate_count
    FROM bikeshare.trip_data
    GROUP BY ride_id
    HAVING COUNT(*) > 1
) AS duplicates;

SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN TRIM(start_station_name) <> start_station_name THEN 1 ELSE 0 END) AS whitespace_start_station,
    SUM(CASE WHEN TRIM(end_station_name) <> end_station_name THEN 1 ELSE 0 END) AS whitespace_end_station,
    SUM(CASE WHEN TRIM(rideable_type) <> rideable_type THEN 1 ELSE 0 END) AS whitespace_bike_types,
    SUM(CASE WHEN TRIM(member_casual) <> member_casual THEN 1 ELSE 0 END) AS whitespace_customer_types
FROM bikeshare.trip_data;

    
UPDATE bikeshare.trip_data
SET 
    start_station_name = TRIM(start_station_name),
    end_station_name = TRIM(end_station_name),
    rideable_type = TRIM(rideable_type),
    member_casual = TRIM(member_casual);

ALTER TABLE rides ADD COLUMN start_location POINT;
ALTER TABLE rides ADD COLUMN end_location POINT;

UPDATE bikeshare.trip_data 
SET start_location = POINT(start_lat, start_lng),
    end_location = POINT(end_lat, end_lng);

ALTER TABLE bikeshare.trip_data
ADD COLUMN distance_km FLOAT;

UPDATE bikeshare.trip_data
SET distance_km = ST_Distance_Sphere(start_location, end_location) / 1000;

SELECT DISTINCT (start_station_name,end_station_name,start_station_id, end_station_id)
FROM bikeshare.trip_data;

ALTER TABLE bikeshare.trip_data 
ADD COLUMN start_date DATE,
ADD COLUMN start_time TIME,
ADD COLUMN end_date DATE,
ADD COLUMN end_time TIME;

UPDATE rides 
SET 
    start_date = DATE(started_at),
    start_time = TIME(started_at),
    end_date = DATE(ended_at),
    end_time = TIME(ended_at);
    
ALTER TABLE trip_data
ADD COLUMN year INT,
ADD COLUMN month INT,
ADD COLUMN hour INT;

UPDATE trip_data
SET 
    year = YEAR(started_at),
    month = month(started_at),
    hour = HOUR(started_at);
    
SELECT 
    start_station_id, start_station_name, COUNT(*) AS count
FROM trip_data
GROUP BY start_station_id, start_station_name
HAVING COUNT(DISTINCT start_station_name) > 1;

SELECT 
    end_station_id, end_station_name, COUNT(*) AS count
FROM trip_data
GROUP BY end_station_id, end_station_name
HAVING COUNT(DISTINCT end_station_name) > 1;

