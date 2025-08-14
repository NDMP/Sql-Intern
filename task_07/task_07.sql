CREATE DATABASE college_portal;
USE college_portal;

--  Views for Abstraction & Security

CREATE VIEW IF NOT EXISTS vw_student_department AS
SELECT s.student_id, s.name AS student_name, s.email, d.department_name
FROM Student s
JOIN Department d ON s.department_id = d.department_id;

CREATE VIEW IF NOT EXISTS vw_student_marks AS
SELECT m.mark_id, s.name AS student_name, c.course_name, m.marks, m.grade
FROM Marks m
JOIN Student s ON m.student_id = s.student_id
JOIN Course c ON m.course_id = c.course_id;

CREATE VIEW IF NOT EXISTS vw_faculty_courses AS
SELECT f.faculty_id, f.faculty_name, c.course_name, d.department_name
FROM Faculty f
JOIN Course c ON f.course_id = c.course_id
JOIN Department d ON c.department_id = d.department_id;

CREATE VIEW IF NOT EXISTS vw_p
ublic_students AS
SELECT student_id, name
FROM Student;

SELECT * FROM vw_student_department;
SELECT * FROM vw_student_marks;
SELECT * FROM vw_public_students;
