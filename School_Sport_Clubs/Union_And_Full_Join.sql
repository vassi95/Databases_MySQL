use school_sport_clubs;
(SELECT name, egn
FROM students)
UNION
(SELECT name, egn
FROM coaches);


(SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.sport_id,
coaches.name
FROM sportgroups LEFT OUTER JOIN coaches
ON sportgroups.coach_id = coaches.id)
UNION 
(SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.sport_id,
coaches.name
FROM sportgroups RIGHT JOIN coaches
ON sportgroups.coach_id = coaches.id);


(SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.sport_id,
coaches.name
FROM sportgroups LEFT OUTER JOIN coaches
ON sportgroups.coach_id = coaches.id)
UNION ALL
(SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.sport_id,
coaches.name
FROM sportgroups RIGHT JOIN coaches
ON sportgroups.coach_id = coaches.id
WHERE sportgroups.coach_id  is NULL);