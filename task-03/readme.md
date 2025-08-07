# College Student Portal 
This project demonstrates the use of basic SQL operations such as INSERT, SELECT, WHERE, ORDER BY, LIKE, BETWEEN, AND, and OR in the context of a college student portal

## 🗃️ Table Structure

The system includes the following tables:

### 1. `Department`
- `department_id` INT PRIMARY KEY
- `department_name` VARCHAR

### 2. `Student`
- `student_id` INT PRIMARY KEY
- `name` VARCHAR
- `email` VARCHAR
- `department_id` INT (Foreign Key)

### 3. `Course`
- `course_id` INT PRIMARY KEY
- `course_name` VARCHAR
- `department_id` INT (Foreign Key)

### 4. `Faculty`
- `faculty_id` INT PRIMARY KEY
- `name` VARCHAR
- `course_id` INT (Foreign Key)

### 5. `Marks`
- `mark_id` INT PRIMARY KEY
- `student_id` INT (Foreign Key)
- `course_id` INT (Foreign Key)
- `marks` INT
- `grade` VARCHAR

## 💾 Sample Queries Used

```sql
-- Find student in department 2 named 'nagendran'
SELECT * FROM Student WHERE department_id = 2 AND name = 'nagendran';

-- Search by email or similar name
SELECT * FROM Student WHERE email = 'nagendran@gmail.com' OR name = 'nagenndran';

-- Pattern matching: names ending with 'a'
SELECT * FROM Student WHERE name LIKE '%a';

-- Pattern matching: names starting with 'a'
SELECT * FROM Student WHERE name LIKE 'a%';

-- Range filtering between student IDs
SELECT * FROM Student WHERE student_id BETWEEN 101 AND 102;

-- Order faculty by name (ascending)
SELECT * FROM Faculty ORDER BY name ASC;

-- Order faculty by name (descending)
SELECT * FROM Faculty ORDER BY name DESC;



## 📁 Files Provided

- `task_03.sql` – SQL file to create and populate the database
- `Er_diagram.png` – ER Diagram showing table relationships


