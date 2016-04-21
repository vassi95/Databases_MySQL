CREATE DATABASE SCHOOL_SPORT_CLUBS;
USE SCHOOL_SPORT_CLUBS;

CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
egn VARCHAR(10) NOT NULL UNIQUE,
address VARCHAR(255) NOT NULL,
phone VARCHAR(20) NULL DEFAULT NULL,
class VARCHAR(10) NULL DEFAULT NULL   
);

CREATE TABLE sportGroups(
id INT AUTO_INCREMENT PRIMARY KEY,
location VARCHAR(255) NOT NULL,
dayOfWeek ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
hourOfTraining TIME NOT NULL,
UNIQUE KEY(location,dayOfWeek,hourOfTraining)
);

CREATE TABLE student_sport(
student_id int not null,  
CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(id),
sportGroup_id int not null,
CONSTRAINT FOREIGN KEY (sportGroup_id) REFERENCES sportGroups(id),
PRIMARY KEY(student_id,sportGroup_id)
);

CREATE TABLE sports(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

ALTER TABLE sportGroups
ADD sport_id INT NOT NULL;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY(sport_id) REFERENCES sports(id);

CREATE TABLE coaches(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
egn VARCHAR(10) NOT NULL UNIQUE
);

ALTER TABLE sportGroups
ADD coach_id INT;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY (coach_id) REFERENCES coaches(id);