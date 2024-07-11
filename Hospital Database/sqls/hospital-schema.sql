DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

-- Patient table
CREATE TABLE IF NOT EXISTS Patient (
    patient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    phone_no VARCHAR(11)
);

-- Physician
CREATE TABLE IF NOT EXISTS Physician (
    physician_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    certification_no VARCHAR(20),
    field_of_expertise VARCHAR(50),
    address VARCHAR(100),
    phone_no VARCHAR(11)
);

-- Nurse 
CREATE TABLE IF NOT EXISTS Nurse (
    nurse_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    certification_no VARCHAR(20),
    address VARCHAR(100),
    phone_no VARCHAR(11)
);

-- Health_Record
CREATE TABLE IF NOT EXISTS Health_Record (
    health_record_id INT NOT NULL PRIMARY KEY,
    patient_id INT,
    disease VARCHAR(50),
    date DATE,
    status VARCHAR(50),
    description TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Room
CREATE TABLE IF NOT EXISTS Room (
    room_id INT NOT NULL PRIMARY KEY,
    capacity INT,
    fee_one_night DECIMAL(10, 2)
);

-- Hospitalized
CREATE TABLE IF NOT EXISTS Hospitalized (
    patient_id INT,
    room_id INT,
    no_of_days INT,
    PRIMARY KEY (patient_id, room_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- Monitor
CREATE TABLE IF NOT EXISTS Monitor (
    patient_id INT,
    physician_id INT,
    duration INT,
    PRIMARY KEY (patient_id, physician_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (physician_id) REFERENCES Physician(physician_id)
);

-- Instructions
CREATE TABLE IF NOT EXISTS Instructions (
    code_id INT NOT NULL PRIMARY KEY,
    physician_id INT,
    fee DECIMAL(10, 2),
    description TEXT,
    FOREIGN KEY (physician_id) REFERENCES Physician(physician_id)
);

-- Execute_Orders 
CREATE TABLE IF NOT EXISTS Execute_Orders (
    nurse_id INT,
    code_id INT,
    patient_id INT,
    date DATE,
    status VARCHAR(50),
    PRIMARY KEY (nurse_id, code_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id),
    FOREIGN KEY (code_id) REFERENCES Instructions(code_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Medication
CREATE TABLE IF NOT EXISTS Medication (
    patient_id INT,
    medicine VARCHAR(50),
    nurse_id INT,
    dosage VARCHAR(50),
    PRIMARY KEY (patient_id, medicine),
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Payment
CREATE TABLE IF NOT EXISTS Payment (
    invoice_id INT NOT NULL PRIMARY KEY,
    patient_id INT,
    room_id INT,
    instruction_id INT,
    amount_instruction INT,
    amount_room INT, 
    payment_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id),
    FOREIGN KEY (instruction_id) REFERENCES Instructions(code_id)
);