CREATE DATABASE IF NOT EXISTS Netflix;
USE Netflix;

-- =============================================
-- 1. GENRES TABLE (from your ER diagram)
-- =============================================
CREATE TABLE Genres (
    Genre_id INT AUTO_INCREMENT PRIMARY KEY,
    Genre_name VARCHAR(100) NOT NULL UNIQUE
);

-- =============================================
-- 2. CAST_MEMBERS TABLE
-- =============================================
CREATE TABLE Cast_Members (
    Cast_id INT AUTO_INCREMENT PRIMARY KEY,
    Cast_name VARCHAR(255) NOT NULL
);

-- =============================================
-- 3. COUNTRIES TABLE
-- =============================================
CREATE TABLE Countries (
    Country_id INT AUTO_INCREMENT PRIMARY KEY,
    Country_name VARCHAR(100) NOT NULL UNIQUE
);

-- =============================================
-- 4. DIRECTORS TABLE
-- =============================================
CREATE TABLE Directors (
    Director_id INT AUTO_INCREMENT PRIMARY KEY,
    Director_Name VARCHAR(255) NOT NULL
);

-- =============================================
-- 5. SHOWS TABLE (Main table)
-- =============================================
CREATE TABLE Shows (
    Show_id VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(500) NOT NULL,
    Type VARCHAR(20),
    Description TEXT,
    Duration VARCHAR(50),
    Rating VARCHAR(20),
    Data_Added DATE,  
    Release_Date INT  
);

-- =============================================
-- 6. Mapping TABLES (relationships)
-- =============================================

-- Shows to Genres
CREATE TABLE Listed (
    Show_id VARCHAR(20),
    Genre_id INT,
    PRIMARY KEY (Show_id, Genre_id),
    FOREIGN KEY (Show_id) REFERENCES Shows(Show_id) ON DELETE CASCADE,
    FOREIGN KEY (Genre_id) REFERENCES Genres(Genre_id) ON DELETE CASCADE
);

-- Shows to Cast_Members (N:N relationship)
CREATE TABLE Shows_Cast (
    Show_id VARCHAR(20),
    Cast_id INT,
    PRIMARY KEY (Show_id, Cast_id),
    FOREIGN KEY (Show_id) REFERENCES Shows(Show_id) ON DELETE CASCADE,
    FOREIGN KEY (Cast_id) REFERENCES Cast_Members(Cast_id) ON DELETE CASCADE
);

-- Shows to Directors 
CREATE TABLE Producer (
    Show_id VARCHAR(20),
    Director_id INT,
    PRIMARY KEY (Show_id, Director_id),
    FOREIGN KEY (Show_id) REFERENCES Shows(Show_id) ON DELETE CASCADE,
    FOREIGN KEY (Director_id) REFERENCES Directors(Director_id) ON DELETE CASCADE
);

-- Shows to Countries
CREATE TABLE Made_in (
    Show_id VARCHAR(20),
    Country_id INT,
    PRIMARY KEY (Show_id, Country_id),
    FOREIGN KEY (Show_id) REFERENCES Shows(Show_id) ON DELETE CASCADE,
    FOREIGN KEY (Country_id) REFERENCES Countries(Country_id) ON DELETE CASCADE
);