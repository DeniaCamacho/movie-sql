-- Quetion 1
SELECT Id , title, genres
FROM movies;

-- Quetion 2
SELECT title, id
FROM movies 
LIMIT 10

-- Question 3
SELECT title
FROM movies
WHERE id= 485


-- Question 4
SELECT id
FROM movies
WHERE title LIKE "%Made in America%"
 

-- Question 5 
SELECT title
FROM movies
ORDER by IF (title RLIKE'^[a-z]',1,2) ,title
LIMIT 10;

-- Question 6 
SELECT title
FROM movies
WHERE title LIKE "%(2002)%";


-- Question 7
SELECT title
FROM movies
WHERE title LIKE "%Godfather%"
LIMIT 1


-- Question 8
SELECT  title, genres
FROM movies
WHERE genres LIKE "%Comedy%"

-- Question 9
SELECT  title, genres
FROM movies
WHERE title LIKE"%(2000)%" AND genres LIKE "%Comedy%"

-- Question 10
SELECT  title, genres
FROM movies
WHERE title LIKE"%death%" AND genres LIKE "%Comedy%"

-- Question 11
SELECT  title
FROM movies
WHERE title LIKE "%super%" AND title LIKE"%2001%" OR "%2002%"

-- Question 12


-- Question 13
INSERT INTO actors(name,character_name,moviesId,date_of_birth) 

VALUES
("Ryan Gosling","Noah",370,"1995-08-28"),
("Sandra Bullock","Lucy",339,"1964-07-26"),
("jim carrey","ace",19,"1962-01-17"),
("jake Gyllenhaal","Donnie",416,"2016-04-15"),
("Tom Hank","Woody",370,"1952-08-28"),
("Scarlet Johansson","Lucy",19,"1988-08-28"),
("Joseph Gordon-Levitt","Joe",339,"1992-05-28"),
("Leonardo DiCaprio","Gatsby",370,"1987-05-14"),
("Tom Hardy","Tim",370,"1985-08-28"),
("Brad Pitt","Johnny",370,"1995-10-28");

-- Question 14
ALTER TABLE movies 
ADD MPAA_rating varchar(100) not null; 


UPDATE movies
SET MPAA_rating = "3.0"
WHERE id=1 or id=3 or id=7 or id=9 or id=10

-- JOINS Question 15
SELECT m.title, r.rating
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.title LIKE "%Godfather%"

-- Question 16
SELECT m.title, r.rating
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.title LIKE "%Godfather%"
ORDER by r.timestamp DESC  

-- Question 17
SELECT title, imdb_Id 
FROM movies m
LEFT JOIN links  ON links.movie_id = m.id
WHERE title LIKE "%(2005)%" AND genres LIKE "%Comedy%"


-- Question 18
SELECT title, rating
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE rating = null
-- AGGREGATION Question 19

SELECT AVG(rating)
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 339


-- Question 20
SELECT COUNT(rating)
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 339

-- Question 21
SELECT COUNT(title)
FROM movies m
WHERE genres LIKE "%Horror%"

-- Question 22

SELECT AVG(rating)
FROM movies m
LEFT JOIN ratings r ON r.user_id = m.id
WHERE m.id = 4

-- Question 23
SELECT MAX(rating)
FROM movies m
LEFT JOIN ratings r ON r.user_id = m.id

-- Question 24

SELECT AVG(rating) h , user_id
FROM ratings
GROUP BY user_id
ORDER BY h DESC 
LIMIT 1
 

-- Question 26

SELECT AVG(rating) h , user_id , COUNT(rating) r
FROM ratings
GROUP BY user_id
HAVING r > 50
ORDER BY h DESC 
LIMIT 1
-- Question 27

SELECT m.title,AVG(rating) as avgRating 
FROM movies.ratings r
LEFT JOIN movies.movies m ON m.id=r.movie_id
GROUP BY m.title
HAVING avgRating > 4