SELECT *
FROM students
WHERE id BETWEEN 2 AND 5;


SELECT *
FROM school_sport_clubs.students
WHERE name LIKE 'I%';


SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.dayOfWeek,
sports.name
FROM sportgroups JOIN sports
ON sportgroups.sport_id = sports.id;


SELECT coaches.name,sports.name
from coaches JOIN sports
ON coaches.id IN(
SELECT coach_id
FROM sportgroups
WHERE sportgroups.sport_id = sports.id
);


SELECT coaches.name,sports.name
from coaches JOIN sports
ON coaches.id IN(
SELECT coach_id
FROM sportgroups
WHERE sportgroups.sport_id = sports.id
)
where coaches.id = 1;


SELECT DISTINCT coaches.name,sports.name
from coaches JOIN sportgroups
ON coaches.id = sportgroups.coach_id
JOIN sports
ON sportgroups.sport_id = sports.id;


SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.sport_id,
coaches.name
FROM sportgroups JOIN coaches
ON sportgroups.coach_id = coaches.id;


SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.sport_id,
coaches.name
FROM sportgroups LEFT OUTER JOIN coaches
ON sportgroups.coach_id = coaches.id;


SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.sport_id,
coaches.name
FROM sportgroups RIGHT JOIN coaches
ON sportgroups.coach_id = coaches.id;


SELECT students.name, students.class, sportgroups.id
 FROM students JOIN sportgroups
 ON students.id IN (
	SELECT student_id
	FROM student_sport
	WHERE student_sport.sportGroup_id = sportgroups.id
 )
 WHERE sportgroups.id IN(
	SELECT sportgroup_id
    FROM student_sport
    WHERE sportGroup_id IN(
		SELECT id
		FROM sportgroups
		WHERE dayOfWeek = 'Monday'
		AND hourOfTraining = '08:00:00'
		AND coach_id IN(
			SELECT id
			FROM coaches
			WHERE name = 'Иван Тодоров Петров'
		)
        AND sport_id =(
			SELECT id
			FROM sports
            WHERE name = 'Football'
		)
    )
 );
 
 
 