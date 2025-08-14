
**College Student Portal – SQL Views for Abstraction & Security**

This project demonstrates how to use **SQL Views** in a college portal database to simplify complex queries (abstraction) and protect sensitive information (security). The example uses the **Department**, **Student**, **Course**, **Faculty**, and **Marks** tables to create views that combine related data for easier access, while also limiting the visibility of private details.


## **Database Schema**

The database contains the following tables:

1. **Department** – Stores department details.
2. **Student** – Stores student details with department references.
3. **Course** – Stores course details linked to departments.
4. **Faculty** – Stores faculty details linked to courses.
5. **Marks** – Stores marks scored by students in courses.

---

## **Views Created**

### 1️⃣ `vw_student_department` (**Abstraction**)

Shows student details with their department names.

```sql
CREATE VIEW IF NOT EXISTS vw_student_department AS
SELECT s.student_id, s.name AS student_name, s.email, d.department_name
FROM Student s
JOIN Department d ON s.department_id = d.department_id;
```

**Purpose:** Hides the join between `Student` and `Department` tables.

---

### 2️⃣ `vw_student_marks` (**Abstraction**)

Displays student marks along with course names.

```sql
CREATE VIEW IF NOT EXISTS vw_student_marks AS
SELECT m.mark_id, s.name AS student_name, c.course_name, m.marks, m.grade
FROM Marks m
JOIN Student s ON m.student_id = s.student_id
JOIN Course c ON m.course_id = c.course_id;
```

**Purpose:** Simplifies queries that require marks and course names.

---

### 3️⃣ `vw_faculty_courses` (**Abstraction**)

Lists faculty members with the courses and departments they teach.

```sql
CREATE VIEW IF NOT EXISTS vw_faculty_courses AS
SELECT f.faculty_id, f.name AS faculty_name, c.course_name, d.department_name
FROM Faculty f
JOIN Course c ON f.course_id = c.course_id
JOIN Department d ON c.department_id = d.department_id;
```

**Purpose:** Abstracts the relationship between faculty, courses, and departments.

---

### 4️⃣ `vw_public_students` (**Security**)

Displays only non-sensitive student details.

```sql
CREATE VIEW IF NOT EXISTS vw_public_students AS
SELECT student_id, name
FROM Student;
```

**Purpose:** Restricts access to sensitive columns like `email`.

---

## **How to Use the Views**

Run the following queries to view data from each view:

```sql
SELECT * FROM vw_student_department;
SELECT * FROM vw_student_marks;
SELECT * FROM vw_faculty_courses;
SELECT * FROM vw_public_students;
```

---

## **ER Diagram**

The ER Diagram showing table relationships is included in this repository as `er_diagram.png`.

---

## **Output**

Sample outputs for each view are included as screenshots:

* `vw_student_department.png`
* `vw_student_marks.png`
* `vw_faculty_courses.png`
* `vw_public_students.png`

---
