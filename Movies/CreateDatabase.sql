DROP DATABASE IF EXISTS MOVIES_DB;
CREATE DATABASE MOVIES_DB;
USE MOVIES_DB;

CREATE TABLE studios(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL UNIQUE,
	bulstat VARCHAR(255) UNIQUE
);

INSERT INTO `studios` (`address`, `name`, `bulstat`)
VALUES ('Sofia, Boris str. 56', 'Studio Diana', '1112221'),
('London, Everest str. 355', 'Studio Express', '1457458'),
('Berlin, Kernigan str. 455', 'Studio Europa', '1114452'),
('Paris, Kernigan str. 455', 'IFS-200', '1114482');


CREATE TABLE producers(
	id int PRIMARY KEY not null AUTO_INCREMENT,
	address VARCHAR(255) NOT NULL,
	bulstat VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL
);

INSERT INTO producers(address, bulstat, name)
VALUES("London, Safary str. 477", "12124545", "John Smith"),
("Sofia, Opalchenska str. 78", '12541250',"Erna & Dina EOOD"),
("Paris, Earoh str. 626", '14514520',"Exctravaganzza Trading");


CREATE TABLE actors(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NULL DEFAULT NULL,
	gender ENUM('M', 'F') NOT NULL,
	birthday DATE NULL DEFAULT NULL
);

INSERT INTO actors(name, address, gender, birthday)
VALUES("Robert de Niro", "London, JMS str. 346", 'M','1943-08-17'),
("Paul de Niro", "London, JMS str. 346", 'M','1943-08-17'),
("Arnold Schwarzenegger", "London, Monacco str. 478", 'M','1947-07-30'),
("Stoyanka Mutafova", "Sofia, Tsar Boris str. 45", 'F','1922-02-02'),
("Maria Mutafova", "Sofia, Tsar Boris str. 48", 'F','1922-02-02'),
("Ivan Ivanov", "Sofia, Tsar Boris str. 38", 'M','1992-03-02');


CREATE TABLE movies(
	id int AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL UNIQUE,
	year YEAR NOT NULL,
	budget double NOT NULL,
	length INT UNSIGNED NOT NULL,
	studio_id int,
	producer_id int,
	FOREIGN KEY(studio_id) REFERENCES studios(id),
	FOREIGN KEY(producer_id) REFERENCES producers(id)
);

INSERT INTO movies(title, year, budget, length, studio_id, producer_id)
VALUES("Greetings",1968,5000000,120,2,3),
("Juniour",1994,50000000,115,3,1),
("If somebody loves you",2010,500000,90,4,2),
("Star Wars",1995,2000000,90,4,2),
("Another movie",1998,30000000,90,4,2),
("MGM",2011,5000,90,1,2),
("Fancy movie",1990,89562000,90,4,2);


CREATE TABLE movies_actors(
 actor_id BIGINT UNSIGNED NOT NULL REFERENCES actors(id),
 movie_id BIGINT UNSIGNED NOT NULL REFERENCES movies(id),
 PRIMARY KEY(actor_id, movie_id)
);

INSERT INTO movies_actors(actor_id,movie_id)
VALUES(1,1),
(2,2),
(2,5),
(2,4),
(1,2),
(3,3),
(2,3),
(1,4),
(3,5),
(3,6),
(3,2),
(3,1),
(4,6);