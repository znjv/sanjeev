CREATE DATABASE student_course_management_system;
USE student_course_management_system;

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender CHAR(1),
    city VARCHAR(50)
);

CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor_id INT,
    credits INT,

    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);


CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,

    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- students values
INSERT INTO students (name, age, gender, city) VALUES
('Arun', 20, 'M', 'Chennai'),
('Divya', 21, 'F', 'Mumbai'),
('Karthik', 22, 'M', 'Bangalore'),
('Sneha', 19, 'F', 'Hyderabad');

-- Instructors values
INSERT INTO instructors (name, department) VALUES
('Dr. Mehta', 'Computer Science'),
('Dr. Priya', 'Mathematics'),
('Dr. Shah', 'Physics');

-- Courses values
INSERT INTO courses (course_name, instructor_id, credits) VALUES
('Database Systems', 1, 4),
('Calculus II', 2, 3),
('Quantum Physics', 3, 4),
('Algorithms', 1, 3);

-- Enrollments values
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES
(1, 1, '2025-01-05'),
(2, 1, '2025-01-07'),
(3, 2, '2025-01-08'),
(1, 4, '2025-01-10'),
(4, 3, '2025-01-12');

SELECT * FROM students;

SELECT course_name  AS course_name,
name  AS mentor_name 
FROM courses c
JOIN instructors i ON c.instructor_id = i.instructor_id;

SELECT enrollment_id  AS enroll_id, 
enroll_date AS enroll_date,
name  AS student_name,
course_name
FROM students s
JOIN enrollments e ON  s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

SELECT name, city FROM students WHERE city = 'Chennai';

SELECT c.course_name,
count(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id,c.course_name;

SELECT avg(age) AS average_ages FROM students;

SELECT s.name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';

SELECT c.course_name
FROM courses c
JOIN instructors i ON i.instructor_id = c.instructor_id
WHERE i.name = 'Dr. Mehta';

SELECT * 
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
WHERE e.enroll_date > 2025-01-07; 

SELECT c.course_name, i.name,i.instructor_id 
FROM courses c
JOIN instructors i ON c.instructor_id = i.instructor_id;

UPDATE students SET city = 'Delhi' WHERE name = 'Divya';

INSERT INTO courses (course_name, instructor_id, credits) VALUES ('Computer Science',1,3);

UPDATE courses SET credits = credits + 1 WHERE instructor_id = 1;

SELECT * FROM enrollments;
DELETE  FROM courses WHERE course_name = 'Computer Science'; 

DELETE FROM enrollments WHERE course_id = 3;

SELECT s.student_id,
	   s.name,
       count(e.course_id) AS total_course
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
GROUP BY s.student_id,s.name
HAVING count(course_id) > 1;

SELECT i.instructor_id,
	   i.name,
       c.course_id,
       c.course_name,
       count(e.student_id) AS total_students
FROM instructors i
JOIN courses c ON i.instructor_id = c.instructor_id
JOIN enrollments e ON e.course_id = c.course_id
GROUP BY i.instructor_id,i.name,c.course_id,c.course_name
HAVING count(e.student_id) > 1;

SELECT s.name, s.student_id,
	   c.course_id,c.course_name,
       e.enrollment_id,e.enroll_date
       FROM students s
       LEFT JOIN enrollments e ON e.student_id = s.student_id
       LEFT JOIN courses c ON e.course_id = c.course_id;
       
SELECT i.instructor_id,
	   i.name,
       c.course_id,
       c.course_name
FROM instructors i
LEFT JOIN courses c ON i.instructor_id = c.instructor_id;

SELECT name,age FROM students
ORDER BY age LIMIT 1;

SELECT name,age FROM students
ORDER BY age DESC LIMIT 1;

SELECT * FROM courses WHERE credits > 3;

SELECT count(student_id) AS total_students,
	  city
FROM students
GROUP BY city;

INSERT INTO students (name,age,gender,city)VALUES ('Dan',21,'M','Chennai');
	
SELECT instructor_id,name 
FROM instructors 
WHERE name LIKE 'D%';
