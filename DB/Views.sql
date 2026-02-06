-- View complete show information
CREATE VIEW Complete_Shows_Info AS
SELECT 
    s.Show_id,
    s.Title,
    s.Type,
    s.Description,
    s.Duration,
    s.Rating,
    s.Data_Added,
    s.Release_Date,
    GROUP_CONCAT(DISTINCT g.Genre_name ORDER BY g.Genre_name SEPARATOR ', ') AS Genres,
    GROUP_CONCAT(DISTINCT d.Director_Name ORDER BY d.Director_Name SEPARATOR ', ') AS Directors,
    GROUP_CONCAT(DISTINCT c.Cast_name ORDER BY c.Cast_name SEPARATOR ', ') AS Cast,
    GROUP_CONCAT(DISTINCT cnt.Country_name ORDER BY cnt.Country_name SEPARATOR ', ') AS Countries
FROM Shows s
LEFT JOIN Listed l ON s.Show_id = l.Show_id
LEFT JOIN Genres g ON l.Genre_id = g.Genre_id
LEFT JOIN Producer p ON s.Show_id = p.Show_id
LEFT JOIN Directors d ON p.Director_id = d.Director_id
LEFT JOIN Shows_Cast sc ON s.Show_id = sc.Show_id
LEFT JOIN Cast_Members c ON sc.Cast_id = c.Cast_id
LEFT JOIN Made_in m ON s.Show_id = m.Show_id
LEFT JOIN Countries cnt ON m.Country_id = cnt.Country_id
GROUP BY s.Show_id, s.Title, s.Type, s.Description, s.Duration, s.Rating, 
         s.Data_Added, s.Release_Date;
         
         
-- View for show statistics
CREATE VIEW Show_Statistics AS
SELECT 
    s.Type,
    COUNT(*) as Total_Shows,
    MIN(s.Release_Date) as Oldest_Release,
    MAX(s.Release_Date) as Newest_Release,
    COUNT(DISTINCT g.Genre_id) as Total_Genres,
    COUNT(DISTINCT c.Cast_id) as Total_Cast_Members,
    COUNT(DISTINCT cnt.Country_id) as Total_Countries
FROM Shows s
LEFT JOIN Listed l ON s.Show_id = l.Show_id
LEFT JOIN Shows_Cast sc ON s.Show_id = sc.Show_id
LEFT JOIN Made_in m ON s.Show_id = m.Show_id
LEFT JOIN Countries cnt ON m.Country_id = cnt.Country_id
LEFT JOIN Genres g ON l.Genre_id = g.Genre_id
LEFT JOIN Cast_Members c ON sc.Cast_id = c.Cast_id
GROUP BY s.Type;