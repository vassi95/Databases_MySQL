
SELECT patient.name, doctor.id, 
       procedures.room_no, procedures.time
FROM procedures
JOIN patient ON procedures.patient_egn = patient.egn
JOIN doctor ON procedures.doctor_id = doctor.id
WHERE procedures.treatment_id = 10
        AND 
      doctor.name =  "Иван Иванов";

     
SELECT patient.name, SUM(treatment.price)
FROM procedures
JOIN patient ON patient.egn = procedures.patient_egn
JOIN treatment ON treatment.id = procedures.treatment_id
WHERE procedures.doctor_id = 10 AND procedures.room_no = 15
GROUP BY patient.egn;