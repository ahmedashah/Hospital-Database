START TRANSACTION;
select @patient_id:= Max(patient_id) + 1 from patient;
insert into patient values (@patient_id,"Ahmed","UIC",12345678);

START TRANSACTION;
UPDATE Health_record
SET Health_record.description = 'Is a criminal now'
WHERE Health_record.patient_id = 1;