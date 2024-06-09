-- Enable foreign key support
PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS prescriptions;
DROP TABLE IF EXISTS patients_prescriptions;
DROP TABLE IF EXISTS appointments:
DROP VIEW IF EXISTS patients_appointments;

-- Create patients table
CREATE TABLE patients(
    patient_pk          TEXT,
    patient_first_name  TEXT,
    patient_last_name   TEXT,
    PRIMARY KEY (patient_pk)
) WITHOUT ROWID;

-- Insert data into patients table
INSERT INTO patients VALUES
(1, "one_first", "one_last"),
(2, "two_first", "two_last"),
(3, "three_first", "three_last");

-- Create prescriptions table
CREATE TABLE prescriptions(
    prescription_pk     TEXT,
    prescription_name   TEXT,
    PRIMARY KEY (prescription_pk)
) WITHOUT ROWID;

-- Insert data into prescriptions table
INSERT INTO prescriptions VALUES
("1_p", "pescription_one"),
("2_p", "pescription_two"),
("3_p", "pescription_three");

-- Create patients_prescriptions table
CREATE TABLE patients_prescriptions(
    patient_fk          TEXT,
    prescription_fk     TEXT,
    PRIMARY KEY (patient_fk, prescription_fk),
    FOREIGN KEY(patient_fk) REFERENCES patients(patient_pk) ON DELETE CASCADE,
    FOREIGN KEY(prescription_fk) REFERENCES prescriptions(prescription_pk) ON DELETE CASCADE
) WITHOUT ROWID;

-- Insert data into patients_prescriptions table
INSERT INTO patients_prescriptions VALUES
(1, "1_p"),
(2, "2_p"),
(1, "3_p");


-- Create table appointments
CREATE TABLE appointments(
appointment_pk          TEXT,
patient_fk              TEXT,
date_time               INTEGER,

PRIMARY KEY(appointment_pk)
)WITHOUT ROWID;

-- Insert data into appointments table

INSERT INTO appointments VALUES ("ap1",1,1234),("ap2",2,1234),("ap3",2,5678);


SELECT * FROM appointments;

-- Select all data before deletion
SELECT * FROM patients;
SELECT * FROM prescriptions;
SELECT * FROM patients_prescriptions;

-- Delete a patient
PRAGMA foreign_keys = ON;
DELETE FROM prescriptions WHERE prescription_pk = "1_p";

PRAGMA foreign_keys = ON;
DELETE FROM patients WHERE patient_pk = 2;


-- Select all data after deletion
SELECT * FROM patients;
SELECT * FROM patients_prescriptions;


-- Create JOIN between patients and appointments

SELECT * FROM appointments
JOIN patients ON patients.patient_pk = appointments.patient_fk;




-- CREATE VIEW

CREATE VIEW patients_appointments AS
SELECT 
appointments.patient_fk,
appointments.date_time
FROM appointments
JOIN patients ON patients.patient_pk = appointments.patient_fk;


SELECT * FROM patients_appointments;


DROP TRIGGER IF EXIST prevent_patient_deletion;
-- Create trigger to prevent deletion of patient if it exists in an appointment
CREATE TRIGGER prevent_patient_deletion
BEFORE DELETE ON patients
BEGIN
    SELECT RAISE(ABORT, 'Cannot delete patient. Patient exists in an appointment.')
    FROM appointments
    WHERE appointments.patient_fk = OLD.patient_pk;
END;




-- create a stored procedure

CREATE PROCEDURE edit_patient_first_name
(patient_id TEXT, new_first_name TEXT) 
AS 
BEGIN 
UPDATE patients SET patient_first_name = new_first_name 
WHERE patient_pk = patient_id; 
END;


CALL edit_patient_first_name(1, 'torben');





