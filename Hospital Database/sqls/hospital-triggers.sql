mysql> delimiter //
CREATE  TRIGGER  auto_assign_patient
BEFORE insert
ON patient FOR EACH ROW
BEGIN
IF new.patient_id IS NULL THEN
SET new.patient_id = (SELECT MAX(patient_id) FROM patient) + 1;
END IF;
END//
mysql> delimiter ;

mysql> delimiter //
CREATE  TRIGGER  auto_add_total
BEFORE insert
ON payment FOR EACH ROW
BEGIN
IF new.total_amount IS NULL THEN
SET new.total_amount = new.amount_room + new.amount_instruction;
END IF;
END//
mysql> delimiter ;

mysql> delimiter //
CREATE  TRIGGER  auto_add_instruction_fee
BEFORE insert
ON payment FOR EACH ROW
BEGIN
IF new.amount_instruction IS NULL THEN
SET new.amount_instruction = (SELECT fee FROM instructions WHERE instructions.code_id = new.instruction_id);
END IF;
END//
mysql> delimiter ;