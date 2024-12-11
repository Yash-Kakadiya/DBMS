CREATE DATABASE DBMS_2

--->Lab-01-SQL Concepts Revision

-- Create all the tables under above database with design mode only. 

-- Table1: Artists (Artist_id (PK), Artist_name)
CREATE TABLE Artists
(
    Artist_id INT PRIMARY KEY,
    Artist_name NVARCHAR(50)
);

-- Table2: Albums (Album_id(PK), Album_title, Artist_id(FK), Release_year)
CREATE TABLE Albums
(
    Album_id INT PRIMARY KEY,
    Album_title NVARCHAR(50),
    Artist_id INT,
    Release_year INT,
    FOREIGN KEY (Artist_id) REFERENCES Artists(Artist_id)
);

-- Table3: Songs (Song_id, Song_title, Duration (in minutes), Genre, Album_id(FK))
CREATE TABLE Songs
(
    Song_id INT PRIMARY KEY,
    Song_title NVARCHAR(50),
    Duration DECIMAL(4, 2),
    Genre NVARCHAR(50),
    Album_id INT,
    FOREIGN KEY (Album_id) REFERENCES Albums(Album_id)
);

-- Insert Data into Artists Table
INSERT INTO Artists
    (Artist_id, Artist_name)
VALUES
    (1, 'Aparshakti Khurana'),
    (2, 'Ed Sheeran'),
    (3, 'Shreya Ghoshal'),
    (4, 'Arijit Singh'),
    (5, 'Tanishk Bagchi');

-- Insert Data into Albums Table 
INSERT INTO Albums
    (Album_id, Album_title, Artist_id, Release_year)
VALUES
    (1007, 'Album7', 1, 2015),
    (1001, 'Album1', 1, 2019),
    (1002, 'Album2', 2, 2015),
    (1003, 'Album3', 3, 2018),
    (1004, 'Album4', 4, 2020),
    (1005, 'Album5', 2, 2020),
    (1006, 'Album6', 1, 2009);

-- Insert Data into Songs Table 
INSERT INTO Songs
    (Song_id, Song_title, Duration, Genre, Album_id)
VALUES
    (101, 'Zaroor', 2.55, 'Feel good', 1001),
    (102, 'Espresso', 4.10, 'Rhythmic', 1002),
    (103, 'Shayad', 3.20, 'Sad', 1003),
    (104, 'Roar', 4.05, 'Pop', 1002),
    (105, 'Everybody Talks', 3.35, 'Rhythmic', 1003),
    (106, 'Dwapara', 3.54, 'Dance', 1002),
    (107, 'Sa Re Ga Ma', 4.20, 'Rhythmic', 1004),
    (108, 'Tauba', 4.05, 'Rhythmic', 1005),
    (109, 'Perfect', 4.23, 'Pop', 1002),
    (110, 'Good Luck', 3.55, 'Rhythmic', 1004);

-->Part – A 

-- 01. Retrieve a unique genre of songs. 

SELECT DISTINCT GENRE
FROM SONGS;

-- 02. Find top 2 albums released before 2010. 

SELECT TOP 2
    Album_title
FROM Albums
WHERE Release_year<2010;

-- 03. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005) 

INSERT INTO SONGS
VALUES
    (1245, 'Zaroor', 2.55, 'Feel good', 1005);

-- 04. Change the Genre of the song ‘Zaroor’ to ‘Happy’ 

UPDATE SONGS
SET GENR='Happy'
    WHERE Song_title='Zaroor';

-- 05. Delete an Artist ‘Ed Sheeran’ 

DELETE FROM Artists
WHERE Artist_name='Ed Sheeran';

-- 06. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 

ALTER TABLE Songs
ADD Rating DECIMAL(3,2);

-- 07. Retrieve songs whose title starts with 'S'. 

SELECT *
FROM Songs
WHERE Song_title LIKE 'S%';

-- 08. Retrieve all songs whose title contains 'Everybody'. 

SELECT *
FROM Songs
WHERE Song_title LIKE '%Everybody%';

-- 09. Display Artist Name in Uppercase. 

SELECT UPPER(Artist_name)
FROM Artists;

-- 10.  Find the Square Root of the Duration of a Song ‘Good Luck’ 

SELECT SQRT(Duration)
FROM Songs
WHERE Song_title='Good Luck';

-- 11.  Find Current Date. 

SELECT GETDATE();

-- 12.  Find the number of albums for each artist. 

SELECT Artist_id, COUNT(Artist_id) AS Number_of_Albums
FROM Albums
GROUP BY Artist_id;

-- 13.  Retrieve the Album_id which has more than 5 songs in it. 

SELECT Album_id
FROM Songs
GROUP BY Album_id
HAVING COUNT(Album_id) > 5;

-- 14.  Retrieve all songs from the album 'Album1'. (using Subquery)

SELECT *
FROM SONGS S JOIN Albums A
    ON S.Album_id = A.Album_id
WHERE A.Album_Title = 'Album1';

-- 15.  Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery) 

SELECT Album_title
FROM Albums
WHERE Artist_id=(
                SELECT Artist_id
WHERE Artist_name='Aparshakti Khurana'
                );

-- 16.  Retrieve all the song titles with its album title. 

SELECT S.Song_title, A.Album_title
FROM Songs S JOIN Albums A
    ON S.Album_id = A.Album_id;

-- 17.  Find all the songs which are released in 2020. 

SELECT *
FROM Songs
WHERE Release_year=2020;

-- 18.  Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.  

CREATE VIEW Fav_Songs
AS
    SELECT *
    FROM Songs
    WHERE Song_id BETWEEN 101 AND 105;

-- 19.  Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view. 

UPDATE Fav_Songs
SET Song_title='Jannat'
WHERE Song_id=101;

-- 20.  Find all artists who have released an album in 2020.  

SELECT A.Artist_name
FROM Artists A JOIN Albums AL
    ON A.Artist_id = AL.Artist_id
WHERE Realease_year=2020;

-- 21.  Retrieve all songs by Shreya Ghoshal and order them by duration.

SELECT *
FROM Songs
WHERE Artist_id=(
                SELECT Artist_id
                FROM Artists
WHERE Artist_name='Shreya Ghoshal'
                )
ORDER BY Duration;

-->Part – B 
-- 22.  Retrieve all song titles by artists who have more than one album.  

SELECT Song_title
FROM SONGS
WHERE Album_id  IN (SELECT Album_id
                    FROM Albums
                    GROUP BY Artist_ID
                    HAVING COUNT(Artist_id) > 1)

-- 23.  Retrieve all albums along with the total number of songs.  


-- 24.  Retrieve all songs and release year and sort them by release year.  


-- 25.  Retrieve the total number of songs for each genre, showing genres that have more than 2 songs. 


-- 26.  List all artists who have albums that contain more than 3 songs. 


-->Part – C 

-- 27.  Retrieve albums that have been released in the same year as 'Album4' 


-- 28.  Find the longest song in each genre 


-- 29.  Retrieve the titles of songs released in albums that contain the word 'Album' in the title. 


-- 30.  Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.

