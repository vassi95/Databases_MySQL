DROP DATABASE IF EXISTS CLINIC;
CREATE DATABASE CLINIC;
USE CLINIC;

CREATE TABLE patient(
  egn BIGINT(10) UNSIGNED PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE treatment(
  id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  price DECIMAL(6,2) NOT NULL
);

CREATE TABLE doctor(
  id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);


CREATE TABLE procedures(
  room_no TINYINT UNSIGNED NOT NULL,
  time DATETIME NOT NULL,
  patient_egn BIGINT(10) UNSIGNED
              REFERENCES patient(egn),
  treatment_id SMALLINT UNSIGNED
              REFERENCES treatment(id),
  doctor_id SMALLINT UNSIGNED
              REFERENCES doctor(id),
  PRIMARY KEY (time, patient_egn, treatment_id), 
  UNIQUE(time, patient_egn, doctor_id)
);

INSERT INTO patient(egn, name)
VALUES(9010202030, 'Todor Kableshkov'),
	  (9010202620, 'Hristo Stoichkov'),
	  (9010204020, 'Neofit Rilski'),
	  (9010212020, 'Magdalena Bogurova'),
      (9010902020, 'Alexander Kableshkov'),
	  (9012202020, 'Hristo Sotirov'),
	  (9030202020, 'Ivan Rilski'),
	  (9402020200, 'Magdalena Madjarova'),
      (9710202020, 'Ivan Ivanov'),
      (8010202020, 'Peter Petrov');
      
      
INSERT INTO treatment(price)
VALUES(100),   
		(1000), 
        (1100), 
        (1200), 
        (1300), 
        (1500),   
		(500), 
        (400), 
        (300), 
        (200);
      
INSERT INTO doctor(name)
VALUES('Емануил Георгиев'),
('Иван Иванов'),
('Луиза Абраамян'),
('Любомир Антонов'),
('Нам Ву Нгуен'),
('Николай Добрев'),
('Ивайло Паскалев'),
('Йоанна Атанасова'),
('Красимир Арабаджиев'),
('Кристина Илиева'),
('Мартин Занов'),
('Иван Иванов');

INSERT INTO procedures(room_no, time, patient_egn, treatment_id, doctor_id)
VALUES(15, now(), 9010202030, 6, 2), 
(11, now(), 9010202620, 10, 10),
(12, now(), 9402020200, 10, 12),
(11, now(), 9012202020, 3, 10),
(10, now(), 8010202020, 10, 10),
 (15, now(), 9710202020, 10, 2),
 (15, now(), 9010202030, 1, 10),
 (15, now(), 9710202020, 9, 10),
 (15, now(), 9010202620, 2, 2),
 (15, now(), 9010202620, 7, 7);