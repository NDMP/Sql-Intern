CREATE DATABASE college_portal;
USE college_portal;

-- 1. Scalar subquery 
SELECT name, email FROM Student WHERE student_id = (SELECT student_id FROM Marks ORDER BY marks DESC LIMIT 2 );

-- 2. Correlated subquery 
SELECT s.name, s.email, (SELECT department_name FROM Department d WHERE d.department_id = s.department_id)
AS dept_name FROM Student s;

-- 3. Subquery with IN 
SELECT name FROM Student WHERE student_id IN ( SELECT m.student_id FROM Marks m JOIN Course c ON m.course_id = c.course_id
WHERE c.department_id = (SELECT department_id FROM Department WHERE department_name = 'CSE'));

-- 4. Subquery with EXISTS
SELECT department_name FROM Department d WHERE EXISTS ( SELECT 1 FROM Student s WHERE s.department_id = d.department_id);  

-- 5. Derived table 
SELECT dept_name, AVG(marks) AS avg_marks FROM (SELECT d.department_name AS dept_name, m.marks FROM Department d
JOIN Student s ON d.department_id = s.department_id JOIN Marks m ON s.student_id = m.student_id) AS dept_marks
GROUP BY dept_name;