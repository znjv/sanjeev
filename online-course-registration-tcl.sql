CREATE DATABASE online_course_registration;
USE online_course_registration;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(20)
);

CREATE TABLE registrations (
    reg_id INT PRIMARY KEY,
    student_id INT,
    course VARCHAR(50)
);

INSERT INTO students VALUES
(201, 'Ravi', 'CS'),
(202, 'Anita', 'IT');

INSERT INTO registrations VALUES
(1, 201, 'Python'),
(2, 202, 'Java');

START TRANSACTION;

INSERT INTO students VALUES
(203, 'Raj', 'CS'),
(204, 'Anirudh', 'IT');

INSERT INTO registrations VALUES
(3, 203, 'Java'),
(4, 204, 'Python');

SAVEPOINT before_delete;

DELETE FROM registrations WHERE student_id = 3;

SAVEPOINT before_update;

UPDATE students SET name = 'Raj' WHERE student_id = 201;

ROLLBACK TO before_delete;

SELECT * FROM students;

COMMIT;