DROP TABLE IF EXISTS patients;

CREATE TABLE patients(

    patient_pk              TEXT,
    patient_first_name      TEXT,
    patient_last_name       TEXT,
    patient_date_of_birth   INTEGER,
    PRIMARY KEY(patient_pk)

) WITHOUT ROWID;


INSERT INTO patients VALUES(
"36d9a28a-1686-49ee-89a2-53d244e6e0dd", "Torben", "Larsen", 1021874780),
("819b7391-80cd-4f6e-8d7a-e42b88e66edd", "Sara", "Hansen", 510991580),
("c4e9f5d2-3f9a-4e6b-9e5d-8a7c6b5d4e3f", "John", "Doe", 930201200),
("a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p", "Jane", "Smith", 880512300),
("b5a4c3e2-d1f0-g9h8-i7j6-k5l4m3n2o1", "Michael", "Johnson", 760320400),
("p9o8i7u6y5t4r3e2w1q0", "Emily", "Brown", 950715100);


SELECT * FROM patients

############################################################################
DROP TABLE IF EXISTS doctors;

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


SELECT * FROM doctors;




############################################################################

DROP TABLE IF EXISTS appointments;

CREATE TABLE appointments(
appointment_pk          TEXT,
doctor_fk               TEXT,
patient_fk              TEXT,
date_time               INTEGER,
PRIMARY KEY(appointment_pk)
FOREIGN KEY(doctor_fk) REFERENCES doctors(doctor_pk),
FOREIGN KEY(patient_fk) REFERENCES patients(patient_pk)
)WITHOUT ROWID;

INSERT INTO appointments VALUES
("d9607a79-5212-4c42-851f-ecf49a73e204", "4728925d-2e41-441f-9063-2bdd987152ce", "36d9a28a-1686-49ee-89a2-53d244e6e0dd", 1634563200),
("8ba2f768-b0e1-4e21-b1a2-ec2f981874a8", "f8e7d6c5-b4a3-9z8y-7x6w5v4u3t2", "819b7391-80cd-4f6e-8d7a-e42b88e66edd", 1634566800),
("65bfa0f1-2bb1-4c8c-94d1-b68c29cb8c8d", "l2k3j4h5-g6f7-e8d9-c0b1a2", "c4e9f5d2-3f9a-4e6b-9e5d-8a7c6b5d4e3f", 1634570400),
("93d7e7c2-62c4-4625-9954-68e1b6e2d876", "s9a8m7p6l5e4-d3o2c1t0o9r8", "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p", 1634574000),
("3f212f6b-e23d-4a7b-a2a1-c30adff29c84", "q1w2e3r4t5y6-u7i8o9p0a1s2d3", "b5a4c3e2-d1f0-g9h8-i7j6-k5l4m3n2o1", 1634577600),
("de0a13bc-291a-4b9b-946e-92ae3c742ba6", "4728925d-2e41-441f-9063-2bdd987152ce", "p9o8i7u6y5t4r3e2w1q0", 1634581200);

SELECT * FROM appointments;



############################################################################

DROP TABLE IF EXISTS departments;

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


SELECT * FROM departments;


############################################################################
DROP TABLE IF EXISTS appointments_departments;

CREATE TABLE appointments_departments(
  appointment_fk          TEXT,
  department_fk           TEXT,
  PRIMARY KEY(appointment_fk, department_fk)
  FOREIGN KEY(appointment_fk) REFERENCES appointments(appointment_pk),
  FOREIGN KEY(department_fk) REFERENCES departments(department_fk)
  )WITHOUT ROWID;

INSERT INTO appointments_departments VALUES
("d9607a79-5212-4c42-851f-ecf49a73e204", "ab774aad-d0b7-4886-9238-46ca9c3d70a6"),
("8ba2f768-b0e1-4e21-b1a2-ec2f981874a8", "e1f2g3h4-i5j6-k7l8m9n0o1p"),
("65bfa0f1-2bb1-4c8c-94d1-b68c29cb8c8d", "e1f2g3h4-i5j6-k7l8m9n0o1p"),
("93d7e7c2-62c4-4625-9954-68e1b6e2d876", "f5g6h7i8-j9k0-l1m2n3o4p5");


SELECT * FROM appointments_departments;



############################################################################
DROP TABLE IF EXISTS prescriptions;

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

SELECT * FROM prescriptions;



############################################################################

DROP TABLE IF EXISTS patients_prescriptions;

CREATE TABLE patients_prescriptions(
    patient_fk              TEXT,
    prescription_fk         TEXT,
    PRIMARY KEY(patient_fk, prescription_fk),
    FOREIGN KEY(patient_fk) REFERENCES patients(patient_pk),
    FOREIGN KEY(prescription_fk) REFERENCES prescriptions(prescription_pk)
) WITHOUT ROWID;

INSERT INTO patients_prescriptions (patient_fk, prescription_fk) VALUES
("36d9a28a-1686-49ee-89a2-53d244e6e0dd", "d35f47bb-499e-4e91-93b6-b1c55af848a5"),
("819b7391-80cd-4f6e-8d7a-e42b88e66edd", "f1e9d8a1-b5c7-4370-9c34-bc0b4a3c5de2"),
("c4e9f5d2-3f9a-4e6b-9e5d-8a7c6b5d4e3f", "ce4b73c9-ef8b-4a1e-9375-abbfa56d029d"),
("a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p", "c01b65f3-7b0e-4f3d-833a-bf19f9a4b0b7"),
("b5a4c3e2-d1f0-g9h8-i7j6-k5l4m3n2o1", "de8a0dcd-2b79-4c8f-a5f5-c0f9068e13f5"),
("p9o8i7u6y5t4r3e2w1q0", "fa6b3489-1ef4-4b2f-8fa4-73bfedf3b315");


SELECT * FROM patients_prescriptions;


############################################################################

DROP TABLE IF EXISTS specializations;

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

SELECT * FROM specializations;


############################################################################

DROP TABLE IF EXISTS doctors_specializations;

CREATE TABLE doctors_specializations(
    doctor_fk                   TEXT,
    specialization_fk           TEXT,
    PRIMARY KEY(doctor_fk, specialization_fk),
    FOREIGN KEY(doctor_fk) REFERENCES doctors(doctor_pk),
    FOREIGN KEY(specialization_fk) REFERENCES specializations(specialization_pk)
) WITHOUT ROWID;


INSERT INTO doctors_specializations (doctor_fk, specialization_fk) VALUES
("4728925d-2e41-441f-9063-2bdd987152ce", "1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p"),  -- Hansi Schnitzel - Cardiology
("f8e7d6c5-b4a3-9z8y-7x6w5v4u3t2", "7p6o5n4m-3l2k1j0i-9h8g7f6e-5d4c3b2a1"),     -- Maria Gonzalez - Neurology
("l2k3j4h5-g6f7-e8d9-c0b1a2", "2b3c4d5e-6f7g8h9i-0j1k2l3m-4n5o6p7q8"),          -- David Lee - Orthopedics
("s9a8m7p6l5e4-d3o2c1t0o9r8", "4d5e6f7g-8h9i0j1k-2l3m4n5o-6p7q8r9s0"),          -- Jessica Wang - Pediatrics
("q1w2e3r4t5y6-u7i8o9p0a1s2d3", "8h9i0j1k-2l3m4n5o-6p7q8r9s-0t1u2v3w4");        -- Mohammed Ali - Dermatology

SELECT * FROM doctors_specializations;
