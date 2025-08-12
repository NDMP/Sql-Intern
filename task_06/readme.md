# **College Student Portal – SQL Subqueries & Data Analysis**

This project demonstrates how to use **scalar subqueries**, **correlated subqueries**, **subqueries with IN**, **subqueries with EXISTS**, and **derived tables** in SQL.
The dataset models a college’s academic environment, including departments, students, courses, faculty, and marks records.

---

## **Objectives**

* Apply **subqueries** to extract filtered and aggregated data.
* Use **correlated subqueries** for context-based filtering.
* Implement **IN** and **EXISTS** subqueries to check related data presence.
* Utilize **derived tables** for intermediate aggregations.
* Analyze real-world educational datasets for decision-making.

---

## **Sample Data**

**Tables involved:**

1. **Department**
   (`department_id`, `department_name`)

2. **Student**
   (`student_id`, `name`, `email`, `department_id`)

3. **Course**
   (`course_id`, `course_name`, `department_id`)

4. **Faculty**
   (`faculty_id`, `name`, `course_id`)

5. **Marks**
   (`mark_id`, `student_id`, `course_id`, `marks`, `grade`)

---

## **Subquery Types Used**

1. **Scalar Subquery** – Find student(s) with top marks.
2. **Correlated Subquery** – Get each student with their department name.
3. **Subquery with IN** – Students enrolled in CSE department courses.
4. **Subquery with EXISTS** – Departments having at least one student.
5. **Derived Table** – Average marks per department.

---
