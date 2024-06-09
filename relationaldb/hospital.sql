PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS appointments_departments;
DROP TABLE IF EXISTS prescriptions;
DROP TABLE IF EXISTS patients_prescriptions;
DROP TABLE IF EXISTS specializations;
DROP TABLE IF EXISTS doctors_specializations;
DROP TABLE IF EXISTS audit_log;

CREATE TABLE patients(

    patient_pk              TEXT PRIMARY KEY, 
    patient_first_name      TEXT,
    patient_last_name       TEXT,
    patient_date_of_birth   INTEGER
) WITHOUT ROWID;


INSERT INTO patients VALUES(
"36d9a28a-1686-49ee-89a2-53d244e6e0dd", "Torben", "Larsen", 1021874780),
("819b7391-80cd-4f6e-8d7a-e42b88e66edd", "Sara", "Hansen", 510991580),
("c4e9f5d2-3f9a-4e6b-9e5d-8a7c6b5d4e3f", "John", "Doe", 930201200),
("a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p", "Jane", "Smith", 880512300),
("b5a4c3e2-d1f0-g9h8-i7j6-k5l4m3n2o1", "Michael", "Johnson", 760320400),
("p9o8i7u6y5t4r3e2w1q0", "Emily", "Brown", 950715100);




-- *******************************************************************************


CREATE TABLE doctors(
doctor_pk           TEXT,
doctor_first_name   TEXT,
doctor_last_name    TEXT,
PRIMARY KEY(doctor_pk)
)WITHOUT ROWID;


INSERT INTO doctors VALUES
("4728925d-2e41-441f-9063-2bdd987152ce", "Hansi", "schnitzel"),
("f8e7d6c5-b4a3-9z8y-7x6w5v4u3t2", "Maria", "Gonzalez"),
("l2k3j4h5-g6f7-e8d9-c0b1a2", "David", "Lee"),
("s9a8m7p6l5e4-d3o2c1t0o9r8", "Jessica", "Wang"),
("q1w2e3r4t5y6-u7i8o9p0a1s2d3", "Mohammed", "Ali");







-- *******************************************************************************


-- Create the appointments table with foreign keys
CREATE TABLE appointments (
    appointment_pk      TEXT,
    doctor_fk           TEXT,
    patient_fk          TEXT,
    date_time           INTEGER,
    PRIMARY KEY(appointment_pk),
    FOREIGN KEY (doctor_fk) REFERENCES doctors(doctor_pk) ON DELETE CASCADE,
    FOREIGN KEY (patient_fk) REFERENCES patients(patient_pk) ON DELETE CASCADE
)WITHOUT ROWID;


INSERT INTO appointments VALUES
("d9607a79-5212-4c42-851f-ecf49a73e204", "4728925d-2e41-441f-9063-2bdd987152ce", "36d9a28a-1686-49ee-89a2-53d244e6e0dd", 1634563200),
("8ba2f768-b0e1-4e21-b1a2-ec2f981874a8", "f8e7d6c5-b4a3-9z8y-7x6w5v4u3t2", "819b7391-80cd-4f6e-8d7a-e42b88e66edd", 1634566800),
("65bfa0f1-2bb1-4c8c-94d1-b68c29cb8c8d", "l2k3j4h5-g6f7-e8d9-c0b1a2", "c4e9f5d2-3f9a-4e6b-9e5d-8a7c6b5d4e3f", 1634570400),
("93d7e7c2-62c4-4625-9954-68e1b6e2d876", "s9a8m7p6l5e4-d3o2c1t0o9r8", "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p", 1634574000),
("3f212f6b-e23d-4a7b-a2a1-c30adff29c84", "q1w2e3r4t5y6-u7i8o9p0a1s2d3", "b5a4c3e2-d1f0-g9h8-i7j6-k5l4m3n2o1", 1634577600),
("de0a13bc-291a-4b9b-946e-92ae3c742ba6", "4728925d-2e41-441f-9063-2bdd987152ce", "p9o8i7u6y5t4r3e2w1q0", 1634581200);





-- *******************************************************************************



CREATE TABLE departments(
department_pk               TEXT,
department_name             TEXT,
PRIMARY KEY(department_pk)
)WITHOUT ROWID;


INSERT INTO departments VALUES
("ab774aad-d0b7-4886-9238-46ca9c3d70a6", "Surgery"),
("e1f2g3h4-i5j6-k7l8m9n0o1p", "Cardiology"),
("q2w3e4r5-t6y7-u8i9o0p1a2s3d4", "Orthopedics"),
("f5g6h7i8-j9k0-l1m2n3o4p5", "Neurology"),
("q6w7e8r9-t0y1-u2i3o4p5a6s7d8", "Oncology");





-- *******************************************************************************


CREATE TABLE appointments_departments(
  appointment_fk          TEXT,
  department_fk           TEXT,
  PRIMARY KEY(appointment_fk, department_fk),
  FOREIGN KEY(appointment_fk) REFERENCES appointments(appointment_pk),
  FOREIGN KEY(department_fk) REFERENCES departments(department_pk)
  )WITHOUT ROWID;

INSERT INTO appointments_departments VALUES
("d9607a79-5212-4c42-851f-ecf49a73e204", "ab774aad-d0b7-4886-9238-46ca9c3d70a6"),
("8ba2f768-b0e1-4e21-b1a2-ec2f981874a8", "e1f2g3h4-i5j6-k7l8m9n0o1p"),
("65bfa0f1-2bb1-4c8c-94d1-b68c29cb8c8d", "e1f2g3h4-i5j6-k7l8m9n0o1p"),
("93d7e7c2-62c4-4625-9954-68e1b6e2d876", "f5g6h7i8-j9k0-l1m2n3o4p5");






-- *******************************************************************************


CREATE TABLE prescriptions(
prescription_pk             TEXT,
prescription_name           TEXT,
PRIMARY KEY(prescription_pk)
)WITHOUT ROWID;

INSERT INTO prescriptions VALUES
("d35f47bb-499e-4e91-93b6-b1c55af848a5", "Amoxicillin 500mg"),
("f1e9d8a1-b5c7-4370-9c34-bc0b4a3c5de2", "Ibuprofen 200mg"),
("ce4b73c9-ef8b-4a1e-9375-abbfa56d029d", "Lisinopril 10mg"),
("c01b65f3-7b0e-4f3d-833a-bf19f9a4b0b7","Metformin 500mg"),
("de8a0dcd-2b79-4c8f-a5f5-c0f9068e13f5", "Atorvastatin 20mg"),
("fa6b3489-1ef4-4b2f-8fa4-73bfedf3b315", "Albuterol Inhaler");





-- *******************************************************************************



CREATE TABLE patients_prescriptions(
    patient_fk              TEXT,
    prescription_fk         TEXT,
    PRIMARY KEY(patient_fk, prescription_fk),
    FOREIGN KEY(patient_fk) REFERENCES patients(patient_pk) ON DELETE CASCADE,
    FOREIGN KEY(prescription_fk) REFERENCES prescriptions(prescription_pk) ON DELETE CASCADE
) WITHOUT ROWID;

INSERT INTO patients_prescriptions (patient_fk, prescription_fk) VALUES
("36d9a28a-1686-49ee-89a2-53d244e6e0dd", "d35f47bb-499e-4e91-93b6-b1c55af848a5"),
("819b7391-80cd-4f6e-8d7a-e42b88e66edd", "f1e9d8a1-b5c7-4370-9c34-bc0b4a3c5de2"),
("c4e9f5d2-3f9a-4e6b-9e5d-8a7c6b5d4e3f", "ce4b73c9-ef8b-4a1e-9375-abbfa56d029d"),
("a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p", "c01b65f3-7b0e-4f3d-833a-bf19f9a4b0b7"),
("b5a4c3e2-d1f0-g9h8-i7j6-k5l4m3n2o1", "de8a0dcd-2b79-4c8f-a5f5-c0f9068e13f5"),
("p9o8i7u6y5t4r3e2w1q0", "fa6b3489-1ef4-4b2f-8fa4-73bfedf3b315");





-- *******************************************************************************



CREATE TABLE specializations(
    specialization_pk           TEXT,
    specialization_name         TEXT,
    specialization_description  TEXT,
    PRIMARY KEY(specialization_pk)
) WITHOUT ROWID;

INSERT INTO specializations (specialization_pk, specialization_name, specialization_description) VALUES
("1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p", "Cardiology", "Specializes in heart and cardiovascular system"),
("7p6o5n4m-3l2k1j0i-9h8g7f6e-5d4c3b2a1", "Neurology", "Deals with disorders of the nervous system"),
("2b3c4d5e-6f7g8h9i-0j1k2l3m-4n5o6p7q8", "Orthopedics", "Focuses on injuries and diseases of the musculoskeletal system"),
("4d5e6f7g-8h9i0j1k-2l3m4n5o-6p7q8r9s0", "Pediatrics", "Medical care of infants, children, and adolescents"),
("8h9i0j1k-2l3m4n5o-6p7q8r9s-0t1u2v3w4", "Dermatology", "Treats conditions related to the skin, hair, and nails");




-- *******************************************************************************



CREATE TABLE doctors_specializations(
    doctor_fk                   TEXT,
    specialization_fk           TEXT,
    PRIMARY KEY(doctor_fk, specialization_fk),
    FOREIGN KEY(doctor_fk) REFERENCES doctors(doctor_pk) ON DELETE CASCADE,
    FOREIGN KEY(specialization_fk) REFERENCES specializations(specialization_pk) ON DELETE CASCADE
) WITHOUT ROWID;


INSERT INTO doctors_specializations (doctor_fk, specialization_fk) VALUES
("4728925d-2e41-441f-9063-2bdd987152ce", "1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p"),  -- Hansi Schnitzel - Cardiology
("f8e7d6c5-b4a3-9z8y-7x6w5v4u3t2", "7p6o5n4m-3l2k1j0i-9h8g7f6e-5d4c3b2a1"),     -- Maria Gonzalez - Neurology
("l2k3j4h5-g6f7-e8d9-c0b1a2", "2b3c4d5e-6f7g8h9i-0j1k2l3m-4n5o6p7q8"),          -- David Lee - Orthopedics
("s9a8m7p6l5e4-d3o2c1t0o9r8", "4d5e6f7g-8h9i0j1k-2l3m4n5o-6p7q8r9s0"),          -- Jessica Wang - Pediatrics
("q1w2e3r4t5y6-u7i8o9p0a1s2d3", "8h9i0j1k-2l3m4n5o-6p7q8r9s-0t1u2v3w4");        -- Mohammed Ali - Dermatology

-- *******************************************************************************
CREATE TABLE audit_log (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    action      TEXT,
    patient_id  TEXT,
    action_time TEXT,
    old_first_name TEXT,
    new_first_name TEXT,
    old_last_name TEXT,
    new_last_name TEXT
);




-- *******************************************************************************

SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM departments;
SELECT * FROM appointments_departments;
SELECT * FROM prescriptions;
SELECT * FROM patients_prescriptions;
SELECT * FROM specializations;
SELECT * FROM doctors_specializations;
SELECT * FROM audit_log;








-- examples --------------









-- JOIN EXAMPLE 1
SELECT 
    a.appointment_pk,
    a.date_time,
    p.patient_first_name,
    p.patient_last_name,
    d.doctor_first_name,
    d.doctor_last_name
FROM 
    appointments a
JOIN 
    patients p ON a.patient_fk = p.patient_pk
JOIN 
    doctors d ON a.doctor_fk = d.doctor_pk;


-- JOIN EXAMPLE 2
SELECT 
    prescriptions.prescription_name,
    patients.patient_first_name,
    patients.patient_last_name
FROM
    patients_prescriptions
JOIN
    patients ON patients_prescriptions.patient_fk = patients.patient_pk 
JOIN
    prescriptions ON patients_prescriptions.prescription_fk = prescriptions.prescription_pk;


-- Drop the view if it exists
DROP VIEW IF EXISTS AppointmentsSummary;

-- Create the AppointmentsSummary view
CREATE VIEW AppointmentsSummary AS
SELECT 
    a.appointment_pk,
    a.date_time,
    p.patient_first_name,
    p.patient_last_name,
    d.doctor_first_name,
    d.doctor_last_name
FROM 
    appointments a
JOIN 
    patients p ON a.patient_fk = p.patient_pk
JOIN 
    doctors d ON a.doctor_fk = d.doctor_pk;

-- Query the view
SELECT * FROM AppointmentsSummary;




-- Drop the view if it exists
DROP VIEW IF EXISTS PatientsPrescriptions;

-- Create the PatientsPrescriptions view
CREATE VIEW PatientsPrescriptions AS
SELECT 
    p.patient_first_name,
    p.patient_last_name,
    pr.prescription_name
FROM 
    patients p
JOIN 
    patients_prescriptions pp ON p.patient_pk = pp.patient_fk
JOIN 
    prescriptions pr ON pp.prescription_fk = pr.prescription_pk;

-- Query the view
SELECT * FROM PatientsPrescriptions;




-- UNION ---------------------------
-- Doctors table
SELECT doctor_first_name AS first_name, doctor_last_name AS last_name FROM doctors

UNION

-- Patients table
SELECT patient_first_name AS first_name, patient_last_name AS last_name FROM patients;


-- GROUP BY

SELECT doctor_fk, COUNT(*) AS patient_count
FROM appointments
GROUP BY doctor_fk;




-- HAVING 
-- returns the doctors with a patient count over 1
SELECT doctor_fk, COUNT(*) AS patient_count
FROM appointments
GROUP BY doctor_fk
HAVING COUNT(*) > 1;






-- CASCADE ON DELETE EXAMPLE


-- start by inserting test date into tables
INSERT INTO patients (patient_pk, patient_first_name, patient_last_name, patient_date_of_birth) VALUES
('36d9a28a-1686-49ee-89a2-53d244e6e0dd', 'Torben', 'Larsen', '2002-05-21');

INSERT INTO doctors (doctor_pk, doctor_first_name, doctor_last_name) VALUES
('4728925d-2e41-441f-9063-2bdd987152ce', 'Hansi', 'Schnitzel');

INSERT INTO appointments (appointment_pk, doctor_fk, patient_fk, date_time) VALUES
('d9607a79-5212-4c42-851f-ecf49a73e204', '4728925d-2e41-441f-9063-2bdd987152ce', '36d9a28a-1686-49ee-89a2-53d244e6e0dd', '2022-10-18 10:00:00');

-- DELETE a patient
PRAGMA foreign_keys = ON;
DELETE FROM patients WHERE patient_pk = '36d9a28a-1686-49ee-89a2-53d244e6e0dd';


SELECT * FROM patients;

-- See all appointments
SELECT * FROM appointments;



--  TRIGGER 1

DROP TRIGGER IF EXISTS prevent_patient_deletion;
-- Create trigger to prevent deletion of patient if it exists in an appointment
CREATE TRIGGER prevent_patient_deletion
BEFORE DELETE ON patients
BEGIN
    SELECT RAISE(ABORT, 'Cannot delete patient. Patient exists in an appointment.')
    FROM appointments
    WHERE appointments.patient_fk = OLD.patient_pk;
END;


--  TRIGGER 2
DROP TRIGGER IF EXISTS after_patient_update;

CREATE TRIGGER after_patient_update
AFTER UPDATE ON patients
FOR EACH ROW
BEGIN
    INSERT INTO audit_log 
    (action, patient_id, action_time, old_first_name, new_first_name,old_last_name,new_last_name)
    VALUES('UPDATE', OLD.patient_pk, 1235, OLD.patient_first_name, NEW.patient_first_name, OLD.patient_last_name,NEW.patient_last_name);
END;

UPDATE patients
SET patient_first_name = 'NewFirstName'
WHERE patient_pk = '36d9a28a-1686-49ee-89a2-53d244e6e0dd';



-- STORED PROCEDURE 1

CREATE PROCEDURE edit_patient_first_name
(patient_id TEXT, new_first_name TEXT) 
AS 
BEGIN 
UPDATE patients SET patient_first_name = new_first_name 
WHERE patient_pk = patient_id; 
END;


CALL edit_patient_first_name(1, 'torben');


-- STORED PROCEDURE 2

CREATE PROCEDURE InsertAppointment(
    appointment_id      TEXT,
    doctor_id           TEXT,
    patient_id          TEXT,
    appointment_time    TEXT
)
BEGIN
    INSERT INTO appointments (appointment_pk, doctor_fk, patient_fk, date_time)
    VALUES (appointment_id, doctor_id, patient_id, appointment_time);
END;


CALL InsertAppointment(1, '1doctor', '1patient', '2024-13-10 14:00:00');