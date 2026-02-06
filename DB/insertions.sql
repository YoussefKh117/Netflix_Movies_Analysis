-- =============================================
-- SAMPLE DATA INSERTION
-- =============================================

-- Insert sample genres
INSERT INTO Genres (Genre_name) VALUES 
('Action'),
('Comedy'),
('Drama'),
('Thriller'),
('Horror'),
('Sci-Fi'),
('Romance'),
('Documentary');

-- Insert sample cast members
INSERT INTO Cast_Members (Cast_name) VALUES 
('Leonardo DiCaprio'),
('Jennifer Lawrence'),
('Chris Hemsworth'),
('Emma Watson'),
('Dwayne Johnson'),
('Scarlett Johansson');

-- Insert sample countries
INSERT INTO Countries (Country_name) VALUES 
('United States'),
('United Kingdom'),
('Canada'),
('Australia'),
('India'),
('South Korea');

-- Insert sample directors
INSERT INTO Directors (Director_Name) VALUES 
('Christopher Nolan'),
('Steven Spielberg'),
('Martin Scorsese'),
('Quentin Tarantino'),
('James Cameron');

-- Insert sample shows
INSERT INTO Shows (Show_id, Title, Type, Description, Duration, Rating, Data_Added, Release_Date) VALUES 
('S001', 'Inception', 'Movie', 'A thief who steals corporate secrets', '148 min', 'PG-13', '2020-01-15', 2010),
('S002', 'Stranger Things', 'TV Show', 'Kids encounter supernatural forces', '4 Seasons', 'TV-14', '2019-07-15', 2016),
('S003', 'The Crown', 'TV Show', 'Historical drama about British monarchy', '4 Seasons', 'TV-MA', '2020-11-15', 2016),
('S004', 'Parasite', 'Movie', 'Greed and class discrimination', '132 min', 'R', '2020-02-05', 2019);

-- Link shows to genres (Listed relationship)
INSERT INTO Listed (Show_id, Genre_id) VALUES 
('S001', 1), ('S001', 4),  -- Inception: Action, Thriller
('S002', 5), ('S002', 6),  -- Stranger Things: Horror, Sci-Fi
('S003', 3),  -- The Crown: Drama
('S004', 3), ('S004', 4); -- Parasite: Drama, Thriller

-- Link shows to cast members
INSERT INTO Shows_Cast (Show_id, Cast_id) VALUES 
('S001', 1),  -- Inception: Leonardo DiCaprio
('S002', 3), ('S002', 4),  -- Stranger Things: Chris Hemsworth, Emma Watson
('S003', 2),  -- The Crown: Jennifer Lawrence
('S004', 5);  -- Parasite: Dwayne Johnson

-- Link shows to directors (Producer relationship)
INSERT INTO Producer (Show_id, Director_id) VALUES 
('S001', 1),  -- Inception: Christopher Nolan
('S002', 2),  -- Stranger Things: Steven Spielberg
('S003', 3),  -- The Crown: Martin Scorsese
('S004', 4);  -- Parasite: Quentin Tarantino

-- Link shows to countries (Made_in relationship)
INSERT INTO Made_in (Show_id, Country_id) VALUES 
('S001', 1), ('S001', 2),  -- Inception: USA, UK
('S002', 1),  -- Stranger Things: USA
('S003', 2),  -- The Crown: UK
('S004', 6);  -- Parasite: South Korea
