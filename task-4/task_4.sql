USE college_portal;

-- 1. Count of students in each department
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM Department d
LEFT JOIN Student s ON d.department_id = s.department_id
GROUP BY d.department_name;

-- 2. Average marks per course
SELECT c.course_name, ROUND(AVG(m.marks), 2) AS avg_marks
FROM Course c
JOIN Marks m ON c.course_id = m.course_id
GROUP BY c.course_name;

-- 3. Highest marks per course
SELECT c.course_name, MAX(m.marks) AS highest_marks
FROM Course c
JOIN Marks m ON c.course_id = m.course_id
GROUP BY c.course_name;

-- 4. Number of courses offered by each department
SELECT d.department_name, COUNT(c.course_id) AS total_courses
FROM Department d
LEFT JOIN Course c ON d.department_id = c.department_id
GROUP BY d.department_name;

-- 5. Total marks scored by each student
SELECT s.name, SUM(m.marks) AS total_marks
FROM Student s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name;

-- 6. Departments having more than 1 student
SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM Department d
JOIN Student s ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING COUNT(s.student_id) >= 1;

-- 7. Average marks per department
SELECT d.department_name, ROUND(AVG(m.marks), 2) AS avg_marks
FROM Department d
JOIN Student s ON d.department_id = s.department_id
JOIN Marks m ON s.student_id = m.student_id
GROUP BY d.department_name;
