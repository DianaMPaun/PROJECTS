CREATE DATABASE miniproject;

USE miniproject;

-- ARTISTS
-- 1. Select all from artists table
SELECT *
FROM artists;

-- 2. Total artists
SELECT COUNT(Artist)AS "Total artists"
FROM artists;

-- 3. Artists' names that start with "a"
SELECT artist
FROM artists
WHERE artist LIKE "a%";

-- 4. How many artists' names that start with "b"
SELECT COUNT(artist) AS total_b
FROM artists
WHERE artist LIKE "b%";

-- 5. Retrieve uppercase name of all artists
SELECT UPPER(artist)
FROM artists;

-- 6. Top 5 artists by song count
SELECT a.artist, COUNT(s.song_id) AS song_count
FROM artists a
JOIN songs s ON a.artist_id = s.artist_id
GROUP BY a.artist
ORDER BY song_count DESC
LIMIT 5;

-- 7. Rank artists by popularity
SELECT artist, popularity,
	RANK() OVER(ORDER BY popularity DESC) AS popularity_rank
FROM artists
JOIN songs;

-- 8. Artists from raggae, blues and jazz
SELECT DISTINCT artist, genre
FROM artists a
JOIN songs s USING(artist_id)
JOIN genres g USING(genre_id)
WHERE genre IN ("Reggae", "Blues", "Jazz");

-- 9. Artist with the most diverse genres
SELECT artist, COUNT(DISTINCT s.genre_id) AS genre_count
FROM artists a
JOIN songs s ON a.artist_id = s.artist_id
GROUP BY artist
ORDER BY genre_count DESC
LIMIT 5;

-- 10. Artists with songs above the average popularity
SELECT a.artist,
    ROUND(AVG(s.popularity), 2) AS artist_avg_popularity,
    (SELECT ROUND(AVG(popularity), 2) FROM songs) AS general_avg_popularity
FROM artists a
JOIN songs s ON a.artist_id = s.artist_id
GROUP BY a.artist
HAVING AVG(s.popularity) > (SELECT AVG(popularity) FROM songs)
ORDER BY artist_avg_popularity DESC;

-- 

-- GENRES

-- 1. Total genres
SELECT COUNT(Genre) AS total_genres
FROM genres;

-- 2. Distinct genres
SELECT DISTINCT(Genre)
FROM genres;

--  3. Most Common Genres - whith most number of songs
SELECT g.genre, COUNT(s.song_id) AS song_count
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
GROUP BY g.genre
ORDER BY song_count DESC
LIMIT 5;

-- 4. Top 5 Genres by Average Popularity
SELECT genre, ROUND(AVG(popularity)) AS average_popularity
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
GROUP BY genre
ORDER BY average_popularity DESC
LIMIT 5;

-- 5. Genres with highest average energy
SELECT genre, ROUND(AVG(energy)) AS average_energy
FROM genres g
JOIN songs s USING(genre_id)
GROUP BY genre
ORDER BY average_energy DESC
LIMIT 5;

-- 6. Genres with highest danceability
SELECT genre, ROUND(AVG(danceability)) AS average_danceability
FROM genres g
JOIN songs s USING(genre_id)
GROUP BY genre
ORDER BY average_danceability DESC
LIMIT 5;

-- 7. Most acoustic genres
SELECT g.genre, ROUND(AVG(s.acousticness)) AS avg_acousticness
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
GROUP BY g.genre
ORDER BY avg_acousticness DESC
LIMIT 5;

-- 8. Top genres with songs having high BPM (>110)
SELECT g.genre, COUNT(s.song_id) AS fast_songs
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
WHERE s.bpm > 110
GROUP BY g.genre
ORDER BY fast_songs DESC
LIMIT 5;

-- 9. Genres with the most 'lively' songs
SELECT g.genre, ROUND(AVG(s.liveness)) AS avg_liveness
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
GROUP BY g.genre
ORDER BY avg_liveness DESC
LIMIT 5;

-- 10. Genres with the longest songs (on average)
SELECT g.genre, ROUND(AVG(s.length)) as average_length
FROM genres g
JOIN songs s USING(genre_id)
GROUP BY genre
ORDER BY average_length DESC
LIMIT 5;

-- 11. Genres with the most popular songs
SELECT g.genre, ROUND(AVG(s.popularity)) as average_popularity
FROM genres g
JOIN songs s USING(genre_id)
GROUP BY genre
ORDER BY average_popularity DESC
LIMIT 5;

-- 12. Genres with the most songs above a popularity threshold (80)
SELECT g.genre, COUNT(s.song_id) AS popular_songs
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
WHERE s.popularity > 80
GROUP BY g.genre
ORDER BY popular_songs DESC;

--  13. Genres with most artists
SELECT g.genre, COUNT(DISTINCT s.artist_id) as total_artists
FROM genres g
JOIN songs s USING(genre_id)
GROUP BY genre
ORDER BY total_artists DESC
LIMIT 5;

-- 14. Genres by year
SELECT g.genre, s.year, COUNT(s.song_id) AS song_count
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
GROUP BY g.genre, s.year
ORDER BY s.year, song_count DESC;

-- 15. Genre popularity vs. energy correlation
WITH GenreStats AS (
    SELECT 
        g.genre,
        COUNT(s.song_id) AS n,
        AVG(s.popularity) AS avg_popularity,
        AVG(s.energy) AS avg_energy,
        SUM((s.popularity - (SELECT AVG(popularity) FROM songs)) * (s.energy - (SELECT AVG(energy) FROM songs))) AS covariance,
        SQRT(SUM(POWER(s.popularity - (SELECT AVG(popularity) FROM songs), 2))) AS std_dev_popularity,
        SQRT(SUM(POWER(s.energy - (SELECT AVG(energy) FROM songs), 2))) AS std_dev_energy
    FROM genres g
    JOIN songs s ON g.genre_id = s.genre_id
    GROUP BY g.genre
)
SELECT 
    genre,
    ROUND(covariance / (std_dev_popularity * std_dev_energy), 2) AS correlation
FROM GenreStats
WHERE std_dev_popularity > 0 AND std_dev_energy > 0
ORDER BY correlation DESC;

-- SONGS
-- 1. Total songs
SELECT COUNT(song_id) AS total_songs
FROM songs;

-- 2. Songs with specific words in the title ("love")
SELECT title, artist_id, popularity
FROM songs
WHERE title LIKE '%love%'
ORDER BY popularity DESC;

-- 3. Longest song title
SELECT artist, length(title) as length
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY length
ORDER BY length;

-- 4. Longest and Shortest Songs
SELECT title, artist, max(length) AS longest_song
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY title, artist
ORDER BY longest_song DESC
LIMIT 1;

SELECT title, artist, max(length) AS shortest_song
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY title, artist
ORDER BY shortest_song
LIMIT 1;

-- 5. Year with the Most Songs
SELECT year, COUNT(title) as total_songs
FROM songs
GROUP BY year
ORDER BY total_songs DESC
LIMIT 1;

-- 6. Year with the Less Songs
SELECT year, COUNT(title) as total_songs
FROM songs
GROUP BY year
ORDER BY total_songs
LIMIT 1;

-- 7. Artist with the Most Songs
SELECT artist, COUNT(title) as total_songs
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY artist
ORDER BY total_songs DESC
LIMIT 1;

-- 8. Artists with only 1 Song
SELECT artist, COUNT(title) as total_songs
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY artist
HAVING total_songs = 1
ORDER BY artist;
 
-- 9. Most recent song and oldest song
SELECT title, artist, MAX(year) AS most_recent_songs
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY title, artist
ORDER BY most_recent_songs DESC
LIMIT 10;


SELECT title, artist, MIN(year) AS oldest_songs
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY title, artist
ORDER BY oldest_songs
LIMIT 10;

-- 10. The most popular song in each genre
SELECT s.title, g.genre, s.popularity
FROM songs s
JOIN genres g ON s.genre_id = g.genre_id
WHERE s.popularity = (
    SELECT MAX(popularity)
    FROM songs s2
    WHERE s2.genre_id = s.genre_id
)
ORDER BY g.genre;

-- 11. Energy level of songs
SELECT title, energy,
	CASE 
		WHEN energy < 30 THEN "low energy"
		WHEN energy BETWEEN 30 and 60 THEN "medium energy"
		ELSE "high energy"
	END AS "energy level"
FROM songs
GROUP BY title, energy
ORDER BY title;

-- 12. BPM Ranges
SELECT 
  CASE 
    WHEN bpm < 70 THEN 'Slow (<70)'
    WHEN bpm BETWEEN 70 AND 110 THEN 'Moderate (70-110)'
    WHEN bpm BETWEEN 111 AND 160 THEN 'Fast (111-160)'
    ELSE 'Very Fast (>160)'
  END AS bpm_range,
  COUNT(song_id) AS song_count
FROM songs
GROUP BY bpm_range
ORDER BY song_count DESC;

-- 13. Genres by Acousticness
SELECT g.genre, ROUND(AVG(s.acousticness), 2) AS avg_acousticness
FROM genres g
JOIN songs s ON g.genre_id = s.genre_id
GROUP BY g.genre
ORDER BY avg_acousticness DESC;

-- 14. Most "Happy" Songs by Valence
SELECT title, artist_id, valence
FROM songs
WHERE valence > 60
ORDER BY valence DESC;

-- 15. Artists who perform across multiple genres.
SELECT a.artist, GROUP_CONCAT(DISTINCT g.genre) AS genres
FROM artists a
JOIN songs s ON a.artist_id = s.artist_id
JOIN genres g ON s.genre_id = g.genre_id
GROUP BY a.artist
ORDER BY artist;

SELECT *
FROM artists;

-- 16. High-Energy Danceable Songs
SELECT title, energy, danceability
FROM songs
WHERE energy > 60 AND danceability > 60
ORDER BY energy DESC, danceability DESC;

-- 17. Popularity Trends Over the Years
SELECT year, ROUND(AVG(popularity), 2) AS avg_popularity
FROM songs
GROUP BY year
ORDER BY year;

-- 18. Correlation Between BPM and Popularity
SELECT ROUND(AVG(bpm), 2) AS avg_bpm, ROUND(AVG(popularity), 2) AS avg_popularity
FROM songs;

-- 19. Correlation Between Energy and Popularity
SELECT ROUND(AVG(energy), 2) AS avg_energy, ROUND(AVG(popularity), 2) AS avg_popularity
FROM songs;

-- PERFORMANCE OPTIMIZATION QUERIES:

--  Indexes for Faster Queries
-- Check if indexes are being used effectively.
EXPLAIN SELECT * FROM songs WHERE genre_id = 1;

-- Duplicate Check
SELECT title, artist_id, COUNT(*) AS duplicates 
FROM songs
GROUP BY title, artist_id
HAVING duplicates > 1;

