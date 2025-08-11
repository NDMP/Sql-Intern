SELECT d.department_name, s.name AS student_name FROM Department d INNER JOIN Student s ON d.department_id = s.department_id;

SELECT d.department_name, s.name AS student_name FROM Department d LEFT JOIN Student s ON d.department_id = s.department_id;

SELECT d.department_name, s.name AS student_name FROM Department d RIGHT JOIN Student s ON d.department_id = s.department_id;

SELECT d.department_name, s.name AS student_name FROM Department d LEFT JOIN Student s ON d.department_id = s.department_id 
UNION SELECT d.department_name, s.name AS student_name FROM Department d RIGHT JOIN Student s ON d.department_id = s.department_id;