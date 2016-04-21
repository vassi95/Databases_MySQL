SELECT 
    t.name, s.no, sh.time
FROM
    theater t
        JOIN
    screen s ON t.id = s.theater_id
        JOIN
    `show` sh ON sh.screen_no = s.no
        AND sh.theater_id = s.theater_id
        JOIN
    movie m ON m.id = sh.movie_id
WHERE
    m.name = 'Fast and furious 7'
        AND (s.type = 'VIP' OR s.type = 'deluxe')
ORDER BY t.name , s.no;



SELECT SUM(visitors) as Visitors
FROM
    theater t
        JOIN
    screen s ON t.id = s.theater_id
        JOIN
    `show` sh ON sh.screen_no = s.no
        AND sh.theater_id = s.theater_id
        JOIN
    movie m ON m.id = sh.movie_id
WHERE
    m.name = 'Fast and furious 7'
        AND s.type = 'VIP'
        AND t.name = 'Arena Mladost';
