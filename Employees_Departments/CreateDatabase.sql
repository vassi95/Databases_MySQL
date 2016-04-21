DROP DATABASE IF EXISTS emp_depts;
CREATE DATABASE emp_depts;
USE emp_depts;

CREATE TABLE `departments` (
  `id` int AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `person` (
  `id` INT AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `egn` varchar(10) NOT NULL UNIQUE ,
  `departmentID` INT DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT  FOREIGN KEY (`departmentID`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB;



CREATE TABLE `programmers` (
  `person_id` INT AUTO_INCREMENT PRIMARY KEY,
  `front_back_end` ENUM('FRONT_END','BACK_END','FULL_STACK')  NULL,
  CONSTRAINT FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB;


CREATE TABLE `qas` (
  `person_id` INT AUTO_INCREMENT PRIMARY KEY ,
  `isAutomation` BIT(1) DEFAULT NULL,
  CONSTRAINT FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB;



CREATE TABLE languages(
`id` INT auto_increment PRIMARY KEY,
`name` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE programmer_language(
`programmer_id` INT NOT NULL,
`language_id` INT NOT NULL,
primary key(`programmer_id`,`language_id`),
CONSTRAINT FOREIGN KEY(`programmer_id`) REFERENCES `programmers`(`person_id`),
CONSTRAINT FOREIGN KEY(`language_id`) REFERENCES `languages`(`id`)
) ENGINE=InnoDB;