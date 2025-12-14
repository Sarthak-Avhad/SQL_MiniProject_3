## CREATE DATABASE Company;

USE Company;


## Create Employee Table

Create table Employee(
empid int Not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime,
department_name varchar(25)
);

insert into Employee values
(0001,'Krish','Hero',50000,'14-12-11 09:00:00','Development'),
(0002,'Sudhanshu','Kumar',60000,'14-12-11 09:00:00','Development'),
(0003,'Sanket','Kumar',70000,'15-12-12 09:00:00','HR'),
(0004,'Darius','Bengali',70000,'15-12-13 09:00:00','HR'),
(0005,'Satish','Bhansal',30000,'17-10-21 09:00:00','Accountant'),
(0006,'Shaktiman','Hero',50000,'17-10-15 09:00:00','Accountant');

Select * From Employee;


##Check the Schema
DESC Employee;


 ##Create Bonus Table
 
 create table Bonus(
 emp_ref_id int,
 bonus_amt int,
 bonus_date datetime,
 foreign key(emp_ref_id) references Employee(empid)
 on Delete Cascade
 );
 
 insert into Bonus Values
 (0001,5000,'16-03-14'),
 (0002,5000,'16-03-13'),
 (0003,5000,'17-03-15'),
 (0001,5000,'18-03-17'),
 (0004,3500,'16-03-19'),
 (0005,7000,'16-03-20'),
 (0001,8000,'20-03-21'),
 (0002,8500,'20-03-21');
 
 Select * From Bonus;
 
 
## Create Employee Designation table

Create table designation(
emp_ref_id int,
designation varchar(25),
designation_date Datetime,
foreign key(emp_ref_id) references Employee(empid)
on Delete Cascade
);  
 
 INSERT INTO designation VALUES
 (0001,'Manager','2016-02-05 00:00:00'),
 (0002,'Executive','2016-06-11 00:00:00'),
 (0003,'Excutive','2016-06-11 00:00:00');
 
 SELECT * FROM designation;
 
 ## ------------------------------------------##---------------------------------------------------
 
USE Company;
 
 SELECT * FROM Employee;
 SELECT * FROM Bonus;
 SELECT * FROM designation;
 
 
 
 ## Easy Queries
 
-- 1. Write an sql queary to retrive all details where first name from employee table which starts with 'K'.
  
	SELECT * FROM Employee WHERE first_name Like 'K%';
  
  
-- 2. Write an sql queary to print all details of the employees whose salary between 10000 to 55000 fetch Employee name

      SELECT concat(first_name,' ',last_name) as Employee_name,salary
	  FROM Employee WHERE empid in 
	  (SELECT empid FROM Employee WHERE Salary BETWEEN 10000 AND 55000);
 
 
 -- 3. Write an SQL query to retrive details of the employees who have joined on a date dec 2014
   
      SELECT * FROM Employee WHERE YEAR (joining_date) = 2014 and MONTH (joining_date) = 12; 
 
 
 -- 4.  Write an SQL query to fetch number of employees in every deparrtment
 
       SELECT count(*) FROM Employee GROUP BY department_name; 
 
 ## Intermediate Queries
 
 -- 5.  Write an SQL query to print details of the employee who are also Executives
 
      SELECT Employee.first_name,designation.designation FROM 
      Employee
      INNER JOIN 
      designation
      ON employee.empid = designation.emp_ref_id
      And designation.designation in ('Executive');
 
 
 -- 6.  Write an SQL query to clone a new table from another table
 
      CREATE TABLE Clone_employee LIKE Employee;
      SELECT * FROM Clone_employee;
      DESC Clone_employee;
 
 
 -- 7.  Write an SQL query to Fetch all employees even if they did not receive any bonus
 
      SELECT e.first_name, e.last_name, b.bonus_amt
      FROM Employee e
      LEFT JOIN Bonus b
      ON e.empid = b.emp_ref_id;

 -- 8. Wite an SQL query to Find total bonus received by each employee
 
      SELECT e.first_name, SUM(b.bonus_amt) AS total_bonus
      FROM Employee e
	  JOIN Bonus b
	  ON e.empid = b.emp_ref_id
      GROUP BY e.first_name;
  
 ## Increasing Complexity 
 
 -- 9. Write an SQL query to Fetch employees whose salary is above department average
 
       SELECT e.first_name, e.department_name, e.salary
       FROM Employee e
	   WHERE e.salary > (
            SELECT AVG(e2.salary)
            FROM Employee e2
            WHERE e2.department_name = e.department_name
		);

 
 -- 10. Write an SQL Query to determine the 3th highest salary without using Limit
 
       SELECT DISTINCT salary
        FROM Employee e1
        WHERE 3 = (
                     SELECT COUNT(DISTINCT salary)
                      FROM Employee e2
                      WHERE e2.salary >= e1.salary
					);

  
 -- 11. Write an SQL query to Classify employees based on salary (CASE) 
 
        SELECT first_name, salary,
		CASE
              WHEN salary >= 70000 THEN 'High Salary'
              WHEN salary >= 50000 THEN 'Medium Salary'
              ELSE 'Low Salary'
         END AS salary_category
		FROM Employee;
    
 
 -- 12. Write an SQl Query to Rank employees by salary within each department
      
       SELECT first_name,department_name,salary,
        RANK() OVER (PARTITION BY department_name ORDER BY salary DESC) AS dept_salary_rank
	   FROM Employee;

 
 
 
 
 
 
 
 
 
 
 
 
 