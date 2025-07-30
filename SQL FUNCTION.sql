---1. Aggregate Functions 
-- Total salary of all employees: 
select sum(salary) as Total_salary from master.employees

-- Average salary in each department: 
select department,avg(salary) from master.employees group by department

-- Number of employees in each department: 
select department,count(*)name  from master.employees group by department

 
-- Maximum and minimum salaries: 
select min(salary),max(salary) from master.employees

--Calculate the total and average budget of all departments
select departmentname,sum(budget) as Total_budget,avg(budget) from master.departments
group by departmentname
--Find the highest and lowest salary in the company. 
select department,max(salary),min(salary) from master.employees
group by department

--2.	String Functions 
-- Convert employee names to uppercase: 
select upper(name) from master.employees

---- Extract first 3 characters of the department name: 
select departmentname,substring(departmentname,1,3) from master.departments group by departmentname

-- Combine first name and last name into a full name: 
select CONCAT(firstname,' ',lastname) as full_name from master.job

-- Trim unnecessary spaces in department names: 
select departmentname,trim(departmentname) from master.departments group by departmentname

--○	Display a list of employees with their names in lowercase. 
select name as originalname ,lower(name) as updatedname from master.employees group by name
--○ Create a custom employee code by combining the first 3 letters of the name and employee ID. 
select substring(name,1,3) as emp_name ,CONCAT( substring(name,1,3),' ',employeeid) from master.employees 

--3.	Date Functions 
-- Get the current date: 
select current_date from master.employees


-- Calculate the age of employees based on their joining date: 
select name,age(current_date,joiningdate) from master.employees group by name,current_date,joiningdate

---- Extract year of joining for all employees: 
select name,Extract(year from joiningdate) as joining_year from master.employees group by name ,joiningdate

-- List employees who joined in the last year: 
select name,joiningdate from master.employees where joiningdate between   DATE '2024-01-01' and '2024-12-01'
select name,joiningdate from master.employees where joiningdate >=(current_date -interval'1 year')
--Find all employees who joined before 2015. 
select name,joiningdate from master.employees where joiningdate <(current_date - interval'10 year') order by joiningdate desc
select name,joiningdate from master.employees where joiningdate < DATE '2015-01-01'
--○ Calculate the total tenure of all employees. 

--4.	Numeric Functions 
-- Round salaries to the nearest integer: 
select name as emp_name,Round(salary) as roundedsalary from master.employees group by name,salary

-- Ceiling of the salary: 
select 	name,ceil(salary) from master.employees group by name,salary

-- Floor of the salary: 
select name,floor(salary) from master.employees group by name, salary

-- Absolute difference in salaries: 
select abs(newsalary-oldsalary) from master.salarieshistory

--○	Determine the rounded salary for all employees. 
select name,round(salary) from master.employees group by name,salary

--○ Calculate the absolute difference between oldsalary and newsalary for employees. 
select  abs(newsalary-oldsalary) from master.salarieshistory

