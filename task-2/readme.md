# COLLEGE STUDENT PORTAL DATABASE SYSTEM

---

## Overview
This project is a simple and well-structured MySQL database system designed to manage common college operations, such as:

- Student records
- Department and course management
- Faculty assignments
- Student marks and performance tracking

It demonstrates core database design concepts and can be run using MySQL Workbench, phpMyAdmin, or any SQL-compatible platform.

---

## Tables Included

| Table      | Description                                       |
|------------|---------------------------------------------------|
| Department | Stores department details like CSE, MECH          |
| Student    | Contains student information with department link |
| Course     | Lists courses offered under each department       |
| Faculty    | Records faculty members and the courses they handle |
| Marks      | Holds student marks, grades, and course linkage   |

---

## Key Concepts Used

- PRIMARY KEY and FOREIGN KEY constraints  
- Table relationships and data integrity  
- Default values and ALTER TABLE for schema updates  
- Complex JOIN queries across multiple tables  
- Use of DELETE, UPDATE, and NULL handling  
- Table cloning and backup using RENAME and SELECT INTO

---

## Tools Used

- MySQL Workbench (recommended)
- phpMyAdmin (browser-based)
- VS Code with SQL extensions
- ER Diagram Tool (for schema visualization)

---

## Files Provided

| File Name                    | Description                                      |
|-----------------------------|--------------------------------------------------|
| college_portal.sql          | Contains all SQL statements: CREATE, INSERT, UPDATE, DELETE, SELECT, ALTER |
| college_portal_schema_diagram.png | Entity-Relationship diagram showing how tables are connected |

---

## ER Diagram

This diagram visually represents the relationships between the database entities:
- One department has many students and courses.
- One course is taught by one faculty member.
- Each student can enroll in multiple courses and receive marks.
- Foreign key lines indicate how the tables are connected.

(Insert image here: `college_portal_schema_diagram.png`)

---

## How to Run

1. Open MySQL Workbench or your preferred SQL editor.
2. Create the database:
   ```sql
   CREATE DATABASE college_portal;
   USE college_portal;
