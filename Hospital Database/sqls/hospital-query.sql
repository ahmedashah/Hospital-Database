SELECT SUM(total_amount) AS 'Total Amount Due to Hospital' FROM payment;

SELECT COUNT(patient_id) AS 'Number of Patients' FROM patient;

SELECT SUM(capacity) AS 'Hospital Capacity' FROM room;

SELECT (COUNT(patient.patient_id) / SUM(capacity)) * 100 AS 'Percentage of Capacity Filled' FROM patient, room;

SELECT d.name AS 'Doctor Name', p.name AS 'Patient Name', duration FROM monitor
JOIN patient p ON p.patient_id = monitor.patient_id
JOIN physician d ON d.physician_id = monitor.physician_id;

SELECT name FROM NURSE 
WHERE nurse.nurse_id IN 
(SELECT nurse_id FROM Execute_Orders
WHERE patient_id = 1);

SELECT name FROM Patient 
WHERE patient.patient_id IN (SELECT patient_id FROM Health_record 
WHERE status = 'active'); 

SELECT name FROM Patient 
WHERE patient.patient_id NOT IN (SELECT patient_id FROM Health_record 
WHERE status = 'active'); 


SELECT Patient.name, Health_record.disease, Health_record.status FROM Patient 
JOIN Health_record ON Health_record.patient_id = Patient.patient_id
JOIN Monitor ON Monitor.patient_id = Patient.Patient_id  
WHERE Monitor.Physician_id IN (SELECT physician_id FROM Physician WHERE Physician.name = 'Drew Shulman');

SELECT name, ((Hospitalized.no_of_days * Room.room_id) + Instructions.fee) AS TOTAL FROM Patient 
JOIN Hospitalized ON Patient.patient_id = Hospitalized.patient_id
JOIN Payment ON Patient.Patient_id = payment.patient_id 
JOIN room ON Room.room_id = Payment.room_id 
JOIN instructions ON instructions.code_id = payment.instruction_id;

SELECT Physician.physician_id, Physician.name , COUNT(Monitor.Physician_id)
FROM Monitor 
JOIN Physician ON Monitor.physician_id = Physician.physician_id
GROUP BY Monitor.Physician_id
Having COUNT(Monitor.Physician_id) >1; 

-- max number of nurses working on an instruction
SELECT instructions.code_id, instructions.physician_id, physician.name, COUNT(nurse_id) AS No_of_Nurses FROM execute_orders
JOIN instructions ON execute_orders.code_id = instructions.code_id 
JOIN physician ON physician.physician_id = instructions.physician_id
GROUP BY instructions.code_id, instructions.physician_id, physician.name
HAVING COUNT(execute_orders.nurse_id) = (
SELECT MAX(nurse_count)
FROM (SELECT code_id, COUNT(nurse_id) as nurse_count
FROM execute_orders
GROUP BY code_id
) AS nurse_counts
);

-- Instruction Order on which no nurse is working
SELECT code_id, Instructions.physician_id, Physician.name 
FROM instructions 
JOIN Physician ON physician.physician_id = instructions.physician_id
WHERE instructions.code_id NOT IN (SELECT code_id FROM execute_orders);

-- Medicine prescibed by doctor for each patient 
SELECT Monitor.Physician_id, Physician.name, Monitor.Patient_id, Patient.name, Medication.medicine, Medication.dosage
FROM Monitor
JOIN Physician ON Monitor.Physician_id = Physician.Physician_id 
JOIN Patient ON Monitor.Patient_id = Patient.Patient_id 
JOIN Medication On Medication.Patient_id = Patient.Patient_id ;

-- Instructions that are as much expensive or more than $1000
SELECT Instructions.code_id ,Instructions.Physician_id, Physician.name, Patient.Patient_id, fee, description
FROM Instructions 
JOIN Physician On Physician.Physician_id = Instructions.physician_id 
JOIN Payment On Instructions.code_id = Payment.instruction_id 
JOIN Patient ON Patient.patient_id =  Payment.patient_id 
WHERE fee >= 1000
ORDER BY Instructions.code_id  ;

