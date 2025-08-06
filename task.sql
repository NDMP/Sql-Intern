CREATE DATABASE college_portal;
USE college_portal;

CREATE TABLE Department (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Student (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Course (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Faculty (
  faculty_id INT PRIMARY KEY,
  name VARCHAR(100),
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  marks INT,
  grade VARCHAR(2),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Department VALUES 
(1, 'CSE'), 
(2, 'MECH');

INSERT INTO Student VALUES
(101, 'Aarav', 'aarav@mail.com', 1),
(102, 'Meena', 'meena@mail.com', 2);

INSERT INTO Course VALUES
(301, 'DBMS', 1),
(302, 'Thermo', 2);

INSERT INTO Faculty VALUES
(201, 'Dr. Leela', 301),
(202, 'Mr. Arvind', 302);

INSERT INTO Marks VALUES
(1, 101, 301, 90, 'A'),
(2, 102, 302, 84, 'B');

INSERT INTO Student (student_id, name, email, department_id)
VALUES (103, 'Ravi', NULL, 1);

ALTER TABLE Marks RENAME TO Marks_old;

CREATE TABLE Marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  marks INT,
  grade VARCHAR(2) DEFAULT 'NA',
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Marks (mark_id, student_id, course_id, marks, grade)
SELECT mark_id, student_id, course_id, marks, grade FROM Marks_old;

DROP TABLE Marks_old;

INSERT INTO Marks (mark_id, student_id, course_id, marks)
VALUES (3, 103, 301, 76);

UPDATE Student
SET email = 'ravi123@mail.com'
WHERE student_id = 103;

UPDATE Student
SET department_id = 2
WHERE student_id IN (101, 103);

DELETE FROM Student
WHERE student_id = 103;

DELETE FROM Student
WHERE student_id = 103;

SELECT 
  s.name AS student,
  d.department_name,
  c.course_name,
  m.marks,
  m.grade,
  f.name AS faculty
FROM Marks m
JOIN Student s ON s.student_id = m.student_id
JOIN Course c ON c.course_id = m.course_id
JOIN Faculty f ON f.course_id = c.course_id
JOIN Department d ON d.department_id = s.department_id;
