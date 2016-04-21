begin;
use school_sport_clubs1;

INSERT into taxespayments(student_id,group_id, paymentAmount,month,year, dateOfPayment) values('1', '1', 200, 1, 2016, now());

INSERT into salarypayments(coach_id,month, year,salaryAmount,dateOfPayment)
 VALUES ((SELECT coach_id from sportgroups where id=1),1,2016,200, now());

commit;