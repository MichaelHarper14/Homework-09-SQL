---#Generate Deparments 
Create table Departments (
Department_Code varchar,
Department_Name varchar
);

select * from Departments;

---#Generate Employees

Create table Employees  (
Employee_Number bigint Primary Key,
Birth_Date date,
First_Name name,
Last_Name name,
Gender varchar,
Hire_Date date
);


select * from employees;



---#Generate Salaries
create table Salaries  (
Employee_Number bigint,
Salary bigint,
From_Date date,
To_Date date
	);
select * from Salaries;


---#Generate Dept_EMP
create table Dept_EMP  (
Employee_Number bigint,
Department_Code varchar,
From_Date date,
To_Date date

);


select * from Dept_EMP;



---#Generate Dept_Managers
Create Table Dept_Managers (
 Department_Code varchar,
Employee_Number int,
From_Date date,
To_Date date
	);
	
select * from Dept_Managers;


---#Generate Titles
Create Table Titles (
Employee_Number bigint,
Title Varchar,
From_Date date,
To_Date date
);

Select * From Titles;



---#Salary of each employee
Select employees.employee_number, employees.Last_Name, employees.First_Name, employees.Gender, Salaries.Salary
from employees join Salaries
on employees.employee_number = Salaries.employee_number;




---#List Employees Hired in 1986
select * 
  from employees 
 where Hire_Date >= '1986-01-01 00:00:00' 
       and Hire_Date < '1987-01-01 00:00:00'
	   order by Hire_Date;


---#Department Managers
Select employees.employee_number, employees.Last_Name, employees.First_Name, employees.Gender, Departments.Department_Code, Departments.Department_Name ,
Dept_managers.From_Date, Dept_managers.To_Date
from Dept_managers join employees
on Dept_managers.employee_number = employees.employee_number
join Departments on Dept_Managers.Department_Code = Departments.Department_Code;



---#Department of each Employee
Select  employees.employee_number,   Departments.Department_Code, Departments.Department_Name, employees.First_Name, employees.Last_Name,   employees.Gender
from employees join Dept_EMP
on employees.employee_number = Dept_EMP.employee_number
join Departments 
on Dept_EMP.Department_Code = Departments.Department_Code
order by employees.employee_number;



---# Employees with First name Hercules and Last Name begins with a "B"
Select employees.first_name, employees.last_name
from employees
where first_name = 'Hercules' and last_name LIKE 'B%';





---#Employees in Sales
Select Departments.Department_Name, employees.employee_number,   Departments.Department_Code, employees.First_Name,employees.Last_Name,   employees.Gender
from employees join Dept_EMP
on employees.employee_number = Dept_EMP.employee_number
join Departments 
on Dept_EMP.Department_Code = Departments.Department_Code
where Departments.Department_Name = 'Sales'
order by Department_Name;



---#Employees in Sales or Development
Select Departments.Department_Name, employees.employee_number,   Departments.Department_Code, employees.First_Name,employees.Last_Name,   employees.Gender
from employees join Dept_EMP
on employees.employee_number = Dept_EMP.employee_number
join Departments 
on Dept_EMP.Department_Code = Departments.Department_Code
where Departments.Department_Name = 'Sales' or Departments.Department_Name = 'Development'
order by Department_Name; 





---#Counts of Employee Last Names
SELECT last_name, COUNT(last_name) AS "Last_Names"
FROM employees
GROUP BY last_name;