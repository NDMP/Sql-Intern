USE college_portal;

SELECT * FROM Student WHERE department_id = 2 and  name = 'nagendran' ;

SELECT * FROM Student WHERE email = 'nagendran@gmail.com' OR  name = 'nagenndran' ;

SELECT * FROM Student WHERE  name LIKE '%a';

SELECT * FROM Student WHERE  name LIKE 'a%';

SELECT * FROM Student WHERE student_id BETWEEN 101 and 102;

SELECT * FROM Faculty ORDER BY name ASC;

SELECT * FROM Faculty ORDER BY name DESC;

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
