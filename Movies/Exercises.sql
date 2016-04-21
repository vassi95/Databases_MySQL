

SELECT actors.name
FROM actors
WHERE actors.address LIKE '%Sofia%' OR gender="m";



SELECT *
FROM movies
WHERE movies.year BETWEEN 1990 AND 2000
ORDER BY movies.budget DESC
LIMIT 3;


SELECT movies.title, actors.name
FROM movies 
JOIN movies_actors
ON movies.id = movies_actors.movie_id
JOIN actors 
ON actors.id = movies_actors.actor_id
WHERE studio_id = (
	SELECT id
    FROM studios
    WHERE name = 'IFS-200'
);


SELECT movies.title, studios.name, producers.name
FROM movies
JOIN studios
ON studios.id = movies.studio_id
JOIN producers 
ON producers.id = movies.producer_id;


SELECT actors.name, movies.title, MIN(movies.budget) as Budget
FROM movies JOIN actors
ON actors.id IN(
SELECT actor_id
FROM movies_actors
WHERE movies_actors.movie_id = movies.id) 
GROUP BY actors.name
ORDER BY Budget;


SELECT actors.name, AVG(movies.length) as `Average movie length`
FROM movies JOIN actors
ON actors.id IN(
SELECT actor_id
FROM movies_actors
WHERE movies_actors.movie_id = movies.id) 
WHERE movies.length > 
(SELECT AVG(movies.length)
FROM movies
WHERE movies.year < 2000)
GROUP BY actors.name;


SELECT actors.name
FROM actors JOIN movies
ON actors.id IN(
SELECT actor_id
FROM movies_actors
WHERE movies_actors.movie_id = movies.id) 
WHERE actors.gender = 'F'
AND movies.title = 'MGM';


SELECT producers.name, movies.title
FROM producers
JOIN movies
ON producers.id = movies.producer_id
WHERE producers.id = 
(SELECT producers.id
FROM producers
JOIN movies
ON producers.id = movies.producer_id
WHERE movies.title = 'Star Wars');


SELECT actors.name
FROM actors
LEFT JOIN movies_actors
ON actors.id = movies_actors.actor_id
WHERE movies_actors.movie_id IS NULL;


SELECT Actor
FROM
(SELECT actors.name as Actor, COUNT(movies_actors.movie_id) AS Movies
FROM actors
JOIN movies_actors
ON actors.id = movies_actors.actor_id
GROUP BY actors.name
ORDER BY Movies
LIMIT 1) as ActorsMovies;


SELECT Actor
FROM
(SELECT actors.name as Actor, COUNT(movies_actors.movie_id) AS Movies
FROM actors
JOIN movies_actors
ON actors.id = movies_actors.actor_id
WHERE actors.gender = 'M'
GROUP BY actors.name
ORDER BY actors.birthday, Movies DESC
LIMIT 1) as ActorsMovies