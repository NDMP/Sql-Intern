

# 🎓 College Portal Database (Task 8)

This project is a **MySQL-based College Portal System** that manages **students, departments, courses, faculty, and marks**.
It demonstrates the use of **functions** and **stored procedures** to automate tasks like grade calculation, GPA computation, and managing student marks.

---

## 📌 Database Structure

### Entities (Tables)

1. **Department**

   * `department_id` (PK)
   * `department_name`

2. **Student**

   * `student_id` (PK)
   * `name`
   * `email`
   * `department_id` (FK → Department)

3. **Course**

   * `course_id` (PK)
   * `course_name`
   * `department_id` (FK → Department)

4. **Faculty**

   * `faculty_id` (PK)
   * `faculty_name`
   * `course_id` (FK → Course)

5. **Marks**

   * `mark_id` (PK)
   * `student_id` (FK → Student)
   * `course_id` (FK → Course)
   * `marks`
   * `grade`

---

## ⚙️ Functions

### 1. `fn_calculate_grade(p_marks INT)`

Converts **marks into a grade**.

| Marks Range | Grade |
| ----------- | ----- |
| ≥ 90        | A+    |
| ≥ 80        | A     |
| ≥ 70        | B     |
| ≥ 60        | C     |
| ≥ 50        | D     |
| < 50        | F     |

---

### 2. `fn_student_gpa(p_student_id INT)`

Calculates the **GPA of a student**.

| Grade | Grade Point |
| ----- | ----------- |
| A+    | 10          |
| A     | 9           |
| B     | 8           |
| C     | 7           |
| D     | 6           |
| F     | 0           |

---

