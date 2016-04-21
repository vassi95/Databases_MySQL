use school_sport_clubs;
SELECT COUNT(coach_id) as CountOFSportGroupsWithCoaches
FROM sportgroups;

SELECT SUM(paymentAmount) as SumOfStudentPayment
FROM taxespayments
WHERE student_id = 1;

SELECT MIN(paymentAmount) as MinOfStudentPayment
FROM taxespayments
WHERE student_id = 1;

SELECT AVG(paymentAmount) as AvgOfAllPayment
FROM taxespayments
WHERE group_id = 1;

SELECT group_id as GroupId, AVG(paymentAmount) as AvgOfAllPaymentPerGroup
FROM taxespayments
GROUP BY group_id;

SELECT students.id, students.name as StudentName, SUM(tp.paymentAmount) as SumOfAllPaymentPerGroup, tp.month as Month
FROM taxespayments as tp JOIN students 
ON tp.student_id = students.id
GROUP BY month, student_id;

SELECT students.id, students.name as StudentName, SUM(tp.paymentAmount) as SumOfAllPaymentPerGroup, tp.month as Month
FROM taxespayments as tp JOIN students 
ON tp.student_id = students.id
GROUP BY month, student_id
ORDER BY StudentName
LIMIT 15;

SELECT students.id, students.name as StudentName, SUM(tp.paymentAmount) as SumOfAllPaymentPerGroup, tp.month as Month
FROM taxespayments as tp JOIN students 
ON tp.student_id = students.id
group by month, student_id
HAVING SumOfAllPaymentPerGroup >1000;


select coaches.name, sports.name, sportgroups.location, students.name
 from sportgroups 
 join sports on sports.id = sportgroups.sport_id
 join coaches on sportgroups.coach_id = coaches.id
 join student_sport on student_sport.sportGroup_id = sportgroups.id
 join students on students.id = student_sport.student_id
 where students.address like 'Sofia%'
 and students.egn like '94%'
 and students.class>9
 and sportgroups.hourOfTraining<'12:00';
 
 select max(cast(class as unsigned))
from students;


 