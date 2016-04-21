drop view MyView;
CREATE VIEW MyView as
SELECT students.name, students.phone,students.egn,sum(paymentAmount) as TotalPayments from students join taxespayments
on students.id=taxespayments.student_id and taxespayments.year=2016
group by students.id;

SELECT * from MyView order by TotalPayments;