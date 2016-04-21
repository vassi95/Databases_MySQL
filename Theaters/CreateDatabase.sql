DROP DATABASE IF EXISTS THEATERS;
CREATE DATABASE THEATERS;
USE THEATERS;

CREATE TABLE `theater` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `city` VARCHAR(64) NOT NULL,
     UNIQUE(name, city)
);


CREATE TABLE `screen` (
    `no` INT NOT NULL,
    `type` ENUM('normal', 'deluxe', 'VIP') NOT NULL,
    `theater_id` INT NOT NULL REFERENCES `theater` (`id`),
    PRIMARY KEY (`no` , `theater_id`)
);

CREATE TABLE `show` (
    `time` DATETIME NOT NULL,
    `visitors` INT NOT NULL,
    `movie_id` INT NOT NULL REFERENCES `movie` (`id`),
    `screen_no` INT NOT NULL,
    `theater_id` INT NOT NULL REFERENCES `theater` (`id`),
    PRIMARY KEY(`time`, `screen_no`, `theater_id`),
    FOREIGN KEY (`screen_no` , `theater_id`)
        REFERENCES `screen` (`no` , `theater_id`)
);

CREATE TABLE `movie` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `year` YEAR NOT NULL,
    `country` VARCHAR(64) NOT NULL
);

INSERT INTO theater(name, city)
VALUES('Cinema City Mladost', 'Sofia'),
	  ('Cinema City Varna', 'Varna'),
	  ('Arena Mladost', 'Sofia'),
	  ('Arena Zapaden Park', 'Varna');
      
INSERT INTO screen(`no`, `type`, `theater_id`)
VALUES(1, 'Deluxe', 1),
	  (2, 'VIP', 1),
	  (3, 'normal', 1),
	  (1, 'Deluxe', 2),
      (2, 'VIP', 2),
	  (3, 'normal', 2),
      (1, 'Deluxe', 3),
      (2, 'VIP', 3),
	  (3, 'normal', 3),
      (1, 'Deluxe', 4),
      (2, 'VIP', 4),
	  (3, 'normal', 4);

INSERT INTO movie(name, year, country)
VALUES('Fast and furious 7', 2015, 'US'),
	  ('Deadpool', 2016, 'US'),
	  ('Kung Fu Panda 3', 2016, 'US'),
	  ('Star Wars 7', 2015, 'US');
      
INSERT INTO `show`(time, visitors, movie_id, screen_no, theater_id)
VALUES('2016-03-30 00:00:00', 50, 1, 2, 3),
	  ('2016-03-31 11:00:00', 70, 1, 2, 3),
	  ('2016-04-01 20:00:00', 80, 2, 3, 2),
	  ('2016-03-30 23:00:00', 100, 2, 1, 1),
	  ('2016-04-02 12:30:00', 20, 3, 3, 3),
	  ('2016-03-30 16:00:00', 30, 3, 1, 4),
	  ('2016-04-03 00:00:00', 150, 4, 3, 2),
      ('2016-03-30 21:00:00', 150, 4, 2, 1);