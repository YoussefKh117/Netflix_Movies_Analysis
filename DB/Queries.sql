-- Get all movies with their details
SELECT * FROM Complete_Shows_Info WHERE Type = 'Movie';

-- Find shows by genre
SELECT s.Title, s.Type, g.Genre_name
FROM Shows s
JOIN Listed l ON s.Show_id = l.Show_id
JOIN Genres g ON l.Genre_id = g.Genre_id
WHERE g.Genre_name = 'Action';

-- Find shows by director
SELECT s.Title, s.Type, d.Director_Name
FROM Shows s
JOIN Producer p ON s.Show_id = p.Show_id
JOIN Directors d ON p.Director_id = d.Director_id
WHERE d.Director_Name = 'Christopher Nolan';

-- Find shows by country
SELECT s.Title, s.Type, cnt.Country_name
FROM Shows s
JOIN Made_in m ON s.Show_id = m.Show_id
JOIN Countries cnt ON m.Country_id = cnt.Country_id
WHERE cnt.Country_name = 'United States';

-- Count shows by rating
SELECT Rating, COUNT(*) as Count
FROM Shows
GROUP BY Rating
ORDER BY Count DESC;

-- Get shows added in a specific year
SELECT Title, Data_Added, Type, Rating
FROM Shows
WHERE YEAR(Data_Added) = 2020
ORDER BY Data_Added DESC;

-- Find the most common genres
SELECT g.Genre_name, COUNT(*) as Show_Count
FROM Listed l
JOIN Genres g ON l.Genre_id = g.Genre_id
GROUP BY g.Genre_id
ORDER BY Show_Count DESC;

-- Find actors who appear in multiple shows
SELECT c.Cast_name, COUNT(*) as Appearance_Count
FROM Shows_Cast sc
JOIN Cast_Members c ON sc.Cast_id = c.Cast_id
GROUP BY c.Cast_id
HAVING Appearance_Count > 1
ORDER BY Appearance_Count DESC;