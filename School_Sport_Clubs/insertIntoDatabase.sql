USE school_sport_clubs;
INSERT INTO sports (name) VALUES ('Football');
INSERT INTO sports (name) VALUES ('Volleyball');

INSERT INTO coaches (name, egn) 
VALUES ('Иван Петков', '7509041245'),
('Георги Иванов Тодоров', '8010091245'),
('Илиян Тодоров Георгиев', '8407106352'),
('Петър Славков Йорданов', '7010102045'),
 ('Слави Петков Петков', '7106041278');


INSERT INTO students (name, egn, address, phone, class) 
VALUES ('Iliyan Ivanov', '9401150045', 'Sofia-Mladost 1', '0893452120', '10'),
('Ivan Iliev Georgiev', '9510104512', 'Sofia-Liylin', '0894123456', '11'),
('Elena Petrova Petrova', '9505052154', 'Sofia-Mladost 3', '0897852412', '11'),
('Ivan Iliev Iliev', '9510104542', 'Sofia-Mladost 3', '0894123457', '11'),
('Maria Hristova Dimova', '9510104547', 'Sofia-Mladost 4', '0894123442', '11'),
('Antoaneta Ivanova Georgieva', '9411104547', 'Sofia-Krasno selo', '0874526235', '10');

INSERT INTO student_sport (student_id, sportGroup_id) VALUES (1, 1),
 (2, 1),
 (3, 1),
 (4, 2),
 (5, 2),
 (6, 2);
 
 INSERT  INTO sportgroups(location,dayOfWeek,hourOfTraining,sport_id,coach_id)
VALUES('Sofia- Liylin 7','Sunday','09:00:00',2,2);

INSERT INTO school_sport_clubs.sportgroups 
(location, dayOfWeek, hourOfTraining, sport_id,coach_id)
 VALUES ('Sofia-Nadezhda', 'Sunday', '08:00', 1,NULL);