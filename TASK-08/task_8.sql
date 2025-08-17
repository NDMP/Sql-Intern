USE college_portal;


-- FUNCTIONS

DELIMITER $$

-- Function: Convert marks to grade
DROP FUNCTION IF EXISTS fn_calculate_grade $$
CREATE FUNCTION fn_calculate_grade(p_marks INT)
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_marks >= 90 THEN 'A+'
        WHEN p_marks >= 80 THEN 'A'
        WHEN p_marks >= 70 THEN 'B'
        WHEN p_marks >= 60 THEN 'C'
        WHEN p_marks >= 50 THEN 'D'
        ELSE 'F'
    END;
END $$

-- Function: Calculate GPA for a student
DROP FUNCTION IF EXISTS fn_student_gpa $$
CREATE FUNCTION fn_student_gpa(p_student_id INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
    DECLARE gpa DECIMAL(4,2);

    SELECT AVG(CASE grade
                 WHEN 'A+' THEN 10
                 WHEN 'A'  THEN 9
                 WHEN 'B'  THEN 8
                 WHEN 'C'  THEN 7
                 WHEN 'D'  THEN 6
                 ELSE 0 END)
    INTO gpa
    FROM Marks
    WHERE student_id = p_student_id;

    RETURN IFNULL(gpa,0);
END $$

DELIMITER ;
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_students_by_department $$
CREATE PROCEDURE sp_students_by_department(IN p_dept_name VARCHAR(100))
BEGIN
    SELECT s.student_id, s.name AS student_name, s.email, d.department_name
    FROM Student s
    JOIN Department d ON s.department_id = d.department_id
    WHERE d.department_name = p_dept_name;
END $$

-- Procedure: Add or update marks for a student
DROP PROCEDURE IF EXISTS sp_add_or_update_marks $$
CREATE PROCEDURE sp_add_or_update_marks(
    IN p_mark_id INT,
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_marks INT
)
BEGIN
    INSERT INTO Marks (mark_id, student_id, course_id, marks, grade)
    VALUES (p_mark_id, p_student_id, p_course_id, p_marks, fn_calculate_grade(p_marks))
    ON DUPLICATE KEY UPDATE
        marks = p_marks,
        grade = fn_calculate_grade(p_marks);
END $$

DELIMITER ;
CALL sp_students_by_department('Computer Science');

CALL sp_add_or_update_marks(8, 104, 303, 91);

SELECT s.name, fn_student_gpa(s.student_id) AS GPA
FROM Student s;
