CREATE DATABASE SPORT_ACADEMY;
USE SPORT_ACADEMY;

CREATE TABLE IF NOT exists students(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
age  TINYINT NOT NULL ,
averageMark FLOAT NOT NULL, 
scholarship ENUM('ordinary', 'excellent', 'none') not null
);


CREATE TABLE  IF NOT exists  coaches(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT exists sports(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL, 

coach_id INT Unique default null,
Constraint FOREIGN KEY (coach_id) REFERENCES coaches(id)
);

CREATE TABLE  IF NOT exists student_sport(
student_id int not null,  
CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(id),
sport_id int not null,
CONSTRAINT FOREIGN KEY (sport_id) REFERENCES sports(id),
PRIMARY KEY(student_id,sport_id)
);

drop table if exists taxes;
CREATE TABLE taxes(
id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
amount double NOT NULL,
dateOfPayment date not null,
CONSTRAINT FOREIGN KEY (student_id) references students(id)
);



INSERT INTO students(name, age, averageMark, scholarship) values('Mariq Petrova', 18, 3.50, 'ordinary');
INSERT INTO students(name, age, averageMark, scholarship) values('Nadejda Stefanova', 19, 6.00, 'excellent');
INSERT INTO students(name, age, averageMark, scholarship) values('Ivan Ivanov', 20, 5.25, 'ordinary');
INSERT INTO students(name, age, averageMark, scholarship) values('Stoqn Svetoslavov', 18, 5.83, 'excellent');
INSERT INTO students(name, age, averageMark, scholarship) values('Maq Georgieva', 20, 5.18, 'ordinary');
INSERT INTO students(name, age, averageMark, scholarship) values('Georgi Dimitrov', 19, 4.10, 'ordinary');
INSERT INTO students(name, age, averageMark, scholarship) values('Petq Mollova', 17, 3.28, 'none');
INSERT INTO students(name, age, averageMark, scholarship) values('Random Chovek', 17, 3.28, 'excellent');
INSERT INTO students(name, age, averageMark, scholarship) values('Random 2', 15, 6.00, 'none');

INSERT INTO coaches(name) value('Dimitur Stoqnov');
INSERT INTO coaches(name) value('Veronika Atanasova');
INSERT INTO coaches(name) value('Petur Petrov');
INSERT INTO coaches(name) value('Desislava Aleksieva');
INSERT INTO coaches(name) value('Marin Mitev');



INSERT INTO sports(name,coach_id) VALUES('volleyball',2);
INSERT INTO sports(name,coach_id) VALUES('football',1);
INSERT INTO sports(name,coach_id) VALUES('baseball',5);
INSERT INTO sports(name,coach_id) VALUES('basketball',3);
INSERT INTO sports(name,coach_id) VALUES('tennis',4);
INSERT INTO sports(name) VALUES('randomSport');




INSERT INTO student_sport VALUES(1,5);
INSERT INTO student_sport VALUES(2,1);
INSERT INTO student_sport VALUES(3,4);
INSERT INTO student_sport VALUES(4,2);
INSERT INTO student_sport VALUES(5,3);
INSERT INTO student_sport VALUES(6,2);
INSERT INTO student_sport VALUES(7,1);

INSERT INTO taxes (student_id, amount,dateOfPayment) VALUES 
('1', '200', CURDATE()),
('1', '200', '2014-10-24'),
('1', '200', '2015-11-14'),
('1', '200', '2016-04-12'),
('1', '450', '2015-04-13'),
('2', '250', CURDATE()),
('2', '200', '2014-08-20'),
('2', '200', '2015-10-11'),
('2', '200', '2016-03-18'),
('3', '200', CURDATE()),
('3', '250', '2014-02-20'),
('3', '200', '2015-06-14'),
('3', '200', '2016-09-12'),
('4', '250', '2013-05-22'),
('4', '200', '2012-07-10'),
('4', '200', '2016-05-11'),
('5', '280', CURDATE()),
('5', '200', '2014-06-21'),
('5', '200', '2015-07-19'),
('5', '220', '2016-10-13'),
('6', '200', CURDATE()),
('6', '300', '2014-02-20'),
('6', '230', '2014-09-14'),
('6', '200', '2016-02-10'),

('7', '230', '2012-02-12'),
('7', '300', '2015-01-18'),
('7', '250', '2016-03-10');



Drop database sport_academy;

-- 2.

SELECT * FROM students WHERE id BETWEEN 2 AND 5;

SELECT * FROM students WHERE scholarship='ordinary';

SELECT * FROM students WHERE age>17 AND averageMark>=5.30;

SELECT students.name AS 'Name' , students.age AS 'Age', sports.name AS 'Sport',
coaches.name AS 'Couch' 
FROM students JOIN student_sport
ON students.id = student_sport.student_id
JOIN sports ON sports.id = student_sport.sport_id
Join coaches ON coaches.id = sports.coach_id
WHERE sports.name!='baseball' AND coaches.name != 'Desislava Aleksieva';



-- 3.

SELECT students.id, students.name as StudentName, SUM(taxes.amount) as SumOfTaxes
FROM taxes JOIN students 
ON taxes.student_id = students.id
GROUP BY  student_id
having sumOfTaxes>=800 ;

-- 4.

SELECT students.id, students.name AS 'Name' , sports.name AS 'Sport',coaches.name AS 'Couch' 
FROM students JOIN student_sport
ON students.id = student_sport.student_id
JOIN sports ON sports.id = student_sport.sport_id
Join coaches ON coaches.id = sports.coach_id
ORDER BY students.id;


SELECT sports.id, sports.name AS Sport,
coaches.name AS Couch
FROM sports LEFT OUTER JOIN coaches
ON sports.coach_id = coaches.id
ORDER BY sports.id;

SELECT sports.id, sports.name AS Sport,
coaches.name AS Couch
FROM sports RIGHT OUTER JOIN coaches
ON sports.coach_id = coaches.id
ORDER BY sports.id;


-- 5.

SELECT students.id, students.name as StudentName, Count(taxes.amount) as NumOfTaxes
FROM taxes JOIN students 
ON taxes.student_id = students.id
GROUP BY  student_id;

SELECT students.id, students.name as StudentName, MAX(taxes.amount) as MAX_Tax
FROM taxes JOIN students 
ON taxes.student_id = students.id
GROUP BY  student_id;

-- 6.

drop procedure if exists GiveOutScholarships;
delimiter |
create procedure GiveOutScholarships()
begin
DECLARE cnt INT DEFAULT 1;
DECLARE studentsMaxId INT;
DECLARE tmpAverage DOUBLE;
SELECT MAX(id) INTO studentsMaxId FROM students;

WHILE cnt <= studentsMaxId
	DO
		IF(SELECT id FROM students WHERE id = cnt)
			THEN
			SET tmpAverage =( select averageMark from students where id=cnt);
			IF (tmpAverage<3.5)
			THEN UPDATE students SET scholarship='none' where id=cnt;
                             
			ELSE IF (tmpAverage>=3.5 AND tmpAverage<5.50)
			THEN UPDATE students SET scholarship='ordinary' where id = cnt;
                              
			ELSE IF (tmpAverage>5.49)
			THEN  UPDATE students SET scholarship='excellent' where id=cnt;
						   
          
			END IF;
			END IF;
			END IF;
		END IF;
		SET cnt = cnt + 1;
		SET tmpAverage = NULL;
END WHILE;
end;
|
delimiter ;


--
drop procedure if exists InsertIntoStudents;
delimiter |
create procedure InsertIntoStudents(IN in_name VARCHAR(255), IN in_age TINYINT, IN in_averageMark DOUBLE)
begin
			IF (in_averageMark<3.5)
			then INSERT INTO students(name, age, averageMark, scholarship) values(in_name, in_age, in_averagemark, 'none');
                             
			ELSE IF (in_averageMark>=3.5 AND in_averageMark<5.50)
			THEN INSERT INTO students(name, age, averageMark, scholarship) values(in_name, in_age, in_averagemark, 'ordinary');
                              
			ELSE IF (in_averageMark>5.49)
			THEN INSERT INTO students(name, age, averageMark, scholarship) values(in_name, in_age, in_averagemark, 'excellent');
			END IF;
			END IF;
			END IF;
end;
|
delimiter ;



-- 

drop procedure if exists ReturnInformationBySportName;
delimiter |
create procedure ReturnInformationBySportName( IN in_sport_name VARCHAR(20))
begin

SELECT sports.name AS 'Sport',coaches.name AS 'Couch' , students.name AS 'Student', students.id AS Student_ID
from sports 
join student_sport on
sports.id = student_sport.sport_id
join students on 
students.id = student_sport.student_id
join coaches on coaches.id = sports.coach_id
where sports.name = in_sport_name;

end;
|
delimiter ;

call ReturnInformationBySportName('volleyball');
call InsertIntoStudents('inserted From Procedure', 15, 4.84);
call GiveOutScholarships();
