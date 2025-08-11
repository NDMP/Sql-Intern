

# **College Student Portal – SQL Joins Example**

This project demonstrates how to use different types of **SQL JOINs** (`INNER`, `LEFT`, `RIGHT`, `FULL`) to combine and analyze data from related tables in a **college portal** database.
The example uses the **Department** and **Student** tables to illustrate the differences between join types.

---

## **Objectives**

* Understand the purpose of **INNER JOIN**, **LEFT JOIN**, **RIGHT JOIN**, and **FULL JOIN**.
* Learn how to link two related tables using a **foreign key**.
* Observe how different joins change the query results.
* Gain practical skills in retrieving and combining relational database data.

---

## **Sample Data**

**Tables involved:**

1. **Department** (`department_id`, `department_name`)
2. **Student** (`student_id`, `name`, `email`, `department_id`)

---

## **Sample Records**

**Department Table**

| department\_id | department\_name |
| -------------- | ---------------- |
| 1              | CSE              |
| 2              | MECH             |
| 3              | EEE              |

**Student Table**

| student\_id | name  | email                                   | department\_id |
| ----------- | ----- | --------------------------------------- | -------------- |
| 101         | Aarav | [aarav@mail.com](mailto:aarav@mail.com) | 1              |
| 102         | Meena | [meena@mail.com](mailto:meena@mail.com) | 2              |
| 103         | John  | [john@mail.com](mailto:john@mail.com)   | 1              |

---

## **Join Queries**

1. **INNER JOIN** – only matching department–student pairs

```sql
SELECT d.department_name, s.name AS student_name
FROM Department d
INNER JOIN Student s
ON d.department_id = s.department_id;
```

2. **LEFT JOIN** – all departments, students if available

```sql
SELECT d.department_name, s.name AS student_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id;
```

3. **RIGHT JOIN** – all students, their department if available

```sql
SELECT d.department_name, s.name AS student_name
FROM Department d
RIGHT JOIN Student s
ON d.department_id = s.department_id;
```

4. **FULL JOIN** – all departments and students (match if possible)

```sql
SELECT d.department_name, s.name AS student_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
UNION
SELECT d.department_name, s.name AS student_name
FROM Department d
RIGHT JOIN Student s
ON d.department_id = s.department_id;
```
