# 🏢 Company Database – SQL Project

This repository contains a **Company Database SQL project** designed to demonstrate **core to advanced SQL concepts** using a realistic relational database.

The project is ideal for:

* 📘 SQL learning & practice
* 🎯 Interview preparation
* 🧠 Understanding real-world database design
* 📊 Academic mini-projects

---

## 📂 Database Overview

**Database Name:** `Company`

The database consists of **three relational tables**:

1. **Employee** – Stores employee details
2. **Bonus** – Stores employee bonus records
3. **Designation** – Stores employee designation history

These tables are connected using **foreign key relationships with cascading deletes**.

---

## 🗂️ Tables Structure

### 1️⃣ Employee Table

Stores core employee information.

| Column Name     | Data Type   | Description                  |
| --------------- | ----------- | ---------------------------- |
| empid           | INT (PK)    | Employee ID (Auto Increment) |
| first_name      | VARCHAR(25) | Employee first name          |
| last_name       | VARCHAR(25) | Employee last name           |
| salary          | INT         | Employee salary              |
| joining_date    | DATETIME    | Joining date                 |
| department_name | VARCHAR(25) | Department name              |

---

### 2️⃣ Bonus Table

Stores bonus details for employees.

| Column Name | Data Type | Description                |
| ----------- | --------- | -------------------------- |
| emp_ref_id  | INT (FK)  | References Employee(empid) |
| bonus_amt   | INT       | Bonus amount               |
| bonus_date  | DATETIME  | Bonus given date           |

🔗 **Foreign Key Constraint:**

* `emp_ref_id` → `Employee(empid)`
* `ON DELETE CASCADE`

---

### 3️⃣ Designation Table

Stores employee designation history.

| Column Name      | Data Type   | Description                |
| ---------------- | ----------- | -------------------------- |
| emp_ref_id       | INT (FK)    | References Employee(empid) |
| designation      | VARCHAR(25) | Job title                  |
| designation_date | DATETIME    | Designation assigned date  |

🔗 **Foreign Key Constraint:**

* `emp_ref_id` → `Employee(empid)`
* `ON DELETE CASCADE`

---

## 🛠️ SQL Concepts Covered

This project covers **beginner to advanced SQL topics**, including:

* ✅ Database creation
* ✅ Table creation & constraints
* ✅ Primary & Foreign Keys
* ✅ INSERT, UPDATE, DELETE
* ✅ SELECT queries
* ✅ WHERE filtering
* ✅ ORDER BY
* ✅ Aggregate functions (COUNT, SUM, AVG, MAX)
* ✅ GROUP BY & HAVING
* ✅ JOINS (INNER, LEFT)
* ✅ Subqueries
* ✅ Correlated subqueries
* ✅ CASE expressions
* ✅ Window functions (RANK)
* ✅ Date functions
* ✅ Cascade delete behavior

---

## 🔥 Advanced SQL Queries Included

Some advanced queries implemented using this database:

* Rank employees by salary within each department
* Find employees earning more than department average
* Identify employees with bonuses across multiple years
* Calculate total earnings (salary + bonus)
* Fetch employees without designations
* Find highest-paid employee per department
* Determine Nth highest salary without LIMIT

These queries reflect **real-world HR and payroll scenarios**.

---

## ▶️ How to Run the Project

1. Open **MySQL / SQL Server / PostgreSQL**
2. Run the database creation script
3. Create tables (`Employee`, `Bonus`, `Designation`)
4. Insert sample data
5. Execute the provided SQL queries

---

## 📌 Use Cases

* 📘 Academic SQL assignments
* 🎯 Interview preparation
* 🧠 SQL concept revision
* 📊 Practice relational database queries

---

## 🚀 Future Enhancements

* Add indexes for performance optimization
* Add stored procedures
* Add triggers for audit logs
* Convert queries into views
* Add ER diagram

---

## 🤝 Contributing

Contributions are welcome!
Feel free to fork this repository and improve the project.

---

## 📧 Contact

If you have any questions or suggestions, feel free to connect.

⭐ **If you find this project helpful, don’t forget to star the repository!**

