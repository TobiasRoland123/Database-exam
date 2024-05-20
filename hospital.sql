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
docter_fk               TEXT,
patient_fk              TEXT,
date_time               INTEGER,


)