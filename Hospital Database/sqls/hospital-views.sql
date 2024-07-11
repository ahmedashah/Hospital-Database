CREATE VIEW room_check AS
SELECT p.name AS 'Patient Name', room_id as 'Room number', no_of_days as 'Days In' FROM hospitalized
JOIN patient p ON p.patient_id = hospitalized.patient_id;

CREATE VIEW price_check AS
SELECT p.name as 'Patient Name', total_amount as 'Total Due', payment_date as 'Due Date' FROM payment
JOIN patient p ON p.patient_id = payment.patient_id;

CREATE VIEW medication_information AS
SELECT n.name AS 'Nurse in charge', p.name AS 'Recieving Patient', medicine, dosage FROM medication
JOIN patient p ON p.patient_id = medication.patient_id
JOIN nurse n ON n.nurse_id = medication.nurse_id;