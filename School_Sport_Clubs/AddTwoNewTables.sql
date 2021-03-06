USE school_sport_clubs;

DROP TABLE IF EXISTS taxesPayments;
CREATE TABLE taxesPayments(
id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
group_id INT NOT NULL,
paymentAmount double NOT NULL,
month TINYINT,
year YEAR,
dateOfPayment datetime not null,
CONSTRAINT FOREIGN KEY (student_id) references students(id),
CONSTRAINT FOREIGN KEY (group_id) references sportgroups(id)
);


DROP TABLE IF EXISTS salaryPayments;
CREATE TABLE salaryPayments(
id INT AUTO_INCREMENT PRIMARY KEY,
coach_id INT NOT NULL,
month TINYINT,
year YEAR,
salaryAmount double,
dateOfPayment datetime not null,
CONSTRAINT FOREIGN KEY (coach_id) references coaches(id)
);


truncate table `school_sport_clubs`.`taxespayments`;
/**2015**/
INSERT INTO `school_sport_clubs`.`taxespayments` (`student_id`, `group_id`, `paymentAmount`, `month`, `year`,`dateOfPayment`) VALUES ('1', '1', '200', '1', 2015, now()),
('1', '1', '200', '2', 2015, now()),
('1', '1', '200', '3', 2015, now()),
('1', '1', '200', '4', 2015, now()),
('1', '1', '200', '5', 2015, now()),
('1', '1', '200', '6', 2015, now()),
('1', '1', '200', '7', 2015, now()),
('1', '1', '200', '8', 2015, now()),
('1', '1', '200', '9', 2015, now()),
('1', '1', '200', '10', 2015, now()),
('1', '1', '200', '11', 2015, now()),
('1', '1', '200', '12', 2015, now()),

('2', '1', '250', '1', 2015, now()),
('2', '1', '250', '2', 2015, now()),
('2', '1', '250', '3', 2015, now()),
('2', '1', '250', '4', 2015, now()),
('2', '1', '250', '5', 2015, now()),
('2', '1', '250', '6', 2015, now()),
('2', '1', '250', '7', 2015, now()),
('2', '1', '250', '8', 2015, now()),
('2', '1', '250', '9', 2015, now()),
('2', '1', '250', '10', 2015, now()),
('2', '1', '250', '11', 2015, now()),
('2', '1', '250', '12', 2015, now()),

('3', '1', '250', '1', 2015, now()),
('3', '1', '250', '2', 2015, now()),
('3', '1', '250', '3', 2015, now()),
('3', '1', '250', '4', 2015, now()),
('3', '1', '250', '5', 2015, now()),
('3', '1', '250', '6', 2015, now()),
('3', '1', '250', '7', 2015, now()),
('3', '1', '250', '8', 2015, now()),
('3', '1', '250', '9', 2015, now()),
('3', '1', '250', '10', 2015, now()),
('3', '1', '250', '11', 2015, now()),
('3', '1', '250', '12', 2015, now()),


('1', '2', '200', '1', 2015, now()),
('1', '2', '200', '2', 2015, now()),
('1', '2', '200', '3', 2015, now()),
('1', '2', '200', '4', 2015, now()),
('1', '2', '200', '5', 2015, now()),
('1', '2', '200', '6', 2015, now()),
('1', '2', '200', '7', 2015, now()),
('1', '2', '200', '8', 2015, now()),
('1', '2', '200', '9', 2015, now()),
('1', '2', '200', '10', 2015, now()),
('1', '2', '200', '11', 2015, now()),
('1', '2', '200', '12', 2015, now()),

('4', '2', '200', '1', 2015, now()),
('4', '2', '200', '2', 2015, now()),
('4', '2', '200', '3', 2015, now()),
('4', '2', '200', '4', 2015, now()),
('4', '2', '200', '5', 2015, now()),
('4', '2', '200', '6', 2015, now()),
('4', '2', '200', '7', 2015, now()),
('4', '2', '200', '8', 2015, now()),
('4', '2', '200', '9', 2015, now()),
('4', '2', '200', '10', 2015, now()),
('4', '2', '200', '11', 2015, now()),
('4', '2', '200', '12', 2015, now()),
/**2014**/
('1', '1', '200', '1', 2014, now()),
('1', '1', '200', '2', 2014, now()),
('1', '1', '200', '3', 2014, now()),
('1', '1', '200', '4', 2014, now()),
('1', '1', '200', '5', 2014, now()),
('1', '1', '200', '6', 2014, now()),
('1', '1', '200', '7', 2014, now()),
('1', '1', '200', '8', 2014, now()),
('1', '1', '200', '9', 2014, now()),
('1', '1', '200', '10', 2014, now()),
('1', '1', '200', '11', 2014, now()),
('1', '1', '200', '12', 2014, now()),

('2', '1', '250', '1', 2014, now()),
('2', '1', '250', '2', 2014, now()),
('2', '1', '250', '3', 2014, now()),
('2', '1', '250', '4', 2014, now()),
('2', '1', '250', '5', 2014, now()),
('2', '1', '250', '6', 2014, now()),
('2', '1', '250', '7', 2014, now()),
('2', '1', '250', '8', 2014, now()),
('2', '1', '250', '9', 2014, now()),
('2', '1', '250', '10', 2014, now()),
('2', '1', '250', '11', 2014, now()),
('2', '1', '250', '12', 2014, now()),

('3', '1', '250', '1', 2014, now()),
('3', '1', '250', '2', 2014, now()),
('3', '1', '250', '3', 2014, now()),
('3', '1', '250', '4', 2014, now()),
('3', '1', '250', '5', 2014, now()),
('3', '1', '250', '6', 2014, now()),
('3', '1', '250', '7', 2014, now()),
('3', '1', '250', '8', 2014, now()),
('3', '1', '250', '9', 2014, now()),
('3', '1', '250', '10', 2014, now()),
('3', '1', '250', '11', 2014, now()),
('3', '1', '250', '12', 2014, now()),


('1', '2', '200', '1', 2014, now()),
('1', '2', '200', '2', 2014, now()),
('1', '2', '200', '3', 2014, now()),
('1', '2', '200', '4', 2014, now()),
('1', '2', '200', '5', 2014, now()),
('1', '2', '200', '6', 2014, now()),
('1', '2', '200', '7', 2014, now()),
('1', '2', '200', '8', 2014, now()),
('1', '2', '200', '9', 2014, now()),
('1', '2', '200', '10', 2014, now()),
('1', '2', '200', '11', 2014, now()),
('1', '2', '200', '12', 2014, now()),

('4', '2', '200', '1', 2014, now()),
('4', '2', '200', '2', 2014, now()),
('4', '2', '200', '3', 2014, now()),
('4', '2', '200', '4', 2014, now()),
('4', '2', '200', '5', 2014, now()),
('4', '2', '200', '6', 2014, now()),
('4', '2', '200', '7', 2014, now()),
('4', '2', '200', '8', 2014, now()),
('4', '2', '200', '9', 2014, now()),
('4', '2', '200', '10', 2014, now()),
('4', '2', '200', '11', 2014, now()),
('4', '2', '200', '12', 2014, now()),


/**2016**/
('1', '1', '200', '1', 2016, now()),
('1', '1', '200', '2', 2016, now()),
('1', '1', '200', '3', 2016, now()),


('2', '1', '250', '1', 2016, now()),

('3', '1', '250', '1', 2016, now()),
('3', '1', '250', '2', 2016, now()),



('1', '2', '200', '1', 2016, now()),
('1', '2', '200', '2', 2016, now()),
('1', '2', '200', '3', 2016, now()),


('4', '2', '200', '1', 2016, now()),
('4', '2', '200', '2', 2016, now());


