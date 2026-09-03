create database netflix_db;
use netflix_db;
CREATE TABLE netflix
(
show_id VARCHAR(20),
type VARCHAR(20),
title VARCHAR(250),
director VARCHAR(250),
cast_members TEXT,
country VARCHAR(200),
date_added VARCHAR(50),
release_year INT,
rating VARCHAR(20),
duration VARCHAR(50),
listed_in VARCHAR(250),
description TEXT
);
select * from netflix;
SHOW CREATE TABLE netflix;
DESCRIBE netflix;
LOAD DATA LOCAL INFILE 'C:\Users\harsh\OneDrive\Desktop\DS-DA project\Netflix Analysis\Dataset'
INTO TABLE netflix
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title, director, cast_members, country, date_added, release_year, rating, duration, listed_in, description);
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast_members TEXT,
    country VARCHAR(255),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(50),
    listed_in VARCHAR(255),
    description TEXT
);
select * from netflix;
use netflix_db;
SHOW TABLES;
select * from netflix;
SELECT COUNT(*) AS Total_Titles
FROM netflix;
SELECT type,
COUNT(*) AS Total
FROM netflix
GROUP BY type;
SELECT country,
COUNT(*) AS Total
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY Total DESC
LIMIT 10;
SELECT director,
COUNT(*) AS Total_Content
FROM netflix
WHERE director <> 'Unknown'
GROUP BY director
ORDER BY Total_Content DESC
LIMIT 10;
SELECT rating,
COUNT(*) AS Total
FROM netflix
GROUP BY rating
ORDER BY Total DESC;
SELECT release_year,
COUNT(*) AS Total
FROM netflix
GROUP BY release_year
ORDER BY release_year;
SELECT title,
release_year
FROM netflix
ORDER BY release_year
LIMIT 20;
SELECT director,
COUNT(*) AS Total
FROM netflix
WHERE director<>'Unknown'
GROUP BY director
ORDER BY Total DESC;
SELECT AVG(release_year) AS Average_Release_Year
FROM netflix;
SELECT title
FROM netflix
WHERE title LIKE '%Love%';
SELECT listed_in,
COUNT(*) AS Total
FROM netflix
GROUP BY listed_in
ORDER BY Total DESC;
SELECT title,
release_year
FROM netflix
WHERE type='Movie'
ORDER BY release_year DESC
LIMIT 20;
SELECT release_year,
COUNT(*) AS Total
FROM netflix
GROUP BY release_year
ORDER BY Total DESC
LIMIT 5;
SELECT director,
COUNT(*) AS Total_Titles,
RANK() OVER(ORDER BY COUNT(*) DESC) AS Director_Rank
FROM netflix
WHERE director<>'Unknown'
GROUP BY director;
SELECT FLOOR(release_year/10)*10 AS Decade,
COUNT(*) AS Total
FROM netflix
GROUP BY Decade
ORDER BY Decade;
