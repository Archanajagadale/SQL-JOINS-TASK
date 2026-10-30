create database joins;
use joins;
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);
CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);
CREATE TABLE managers (
    manager_id INT,
    manager_name VARCHAR(50)
);
CREATE TABLE projects (
    project_id INT,
    emp_id INT,
    project_name VARCHAR(50)
);
INSERT INTO projects (project_id, emp_id, project_name) VALUES
(1, 1, 'HR Automation'),
(2, 2, 'Data Migration'),
(3, 3, 'AI Model'),
(4, 7, 'Cloud Setup');
INSERT INTO managers (manager_id, manager_name) VALUES
(101, 'Suresh'),
(102, 'Mahesh'),
(103, 'Ramesh'),
(105, 'Anil');
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(50, 'Marketing');
INSERT INTO employees (emp_id, emp_name, dept_id, manager_id, salary) VALUES
(1, 'Asha', 10, 101, 30000),
(2, 'Ravi', 20, 102, 45000),
(3, 'Neha', 20, 102, 60000),
(4, 'Karan', 30, 103, 40000),
(5, 'Pooja', NULL, 104, 35000),
(6, 'Aman', 40, NULL, 50000);

Select * from projects;
Select * from employees;
select * from managers;
Select * from Departments;

--  Display employee name and department name.
Select emp_name, Dept_name  from employees e
left join departments d
on e.dept_id= d.dept_id;

--  Show employees who are assigned to a department.
Select emp_name, Dept_name  from employees e
Inner join departments d
on e.dept_id= d.dept_id;

-- List employee name with manager name.
Select emp_name, Manager_name  from employees e
left join managers m
on e.manager_id= m.manager_id;

-- Display employees working on projects.
Select * from employees e
Inner join projects p
on e.emp_id = P.emp_id;

-- Show project name with employee name.
Select p.project_name, e.emp_name from employees e
Right join projects p
on e.emp_id = P.emp_id;

-- List employees who have both manager and department.
Select Emp_name,Manager_name,Dept_name from employees e
Inner join managers m
On e.manager_id = m.manager_id
inner join departments d
on e.dept_id = d.dept_id;

-- Display department-wise employee names.
Select d.Dept_name, e.emp_name from employees e
right join departments d
on e.dept_id = d.dept_id;

-- Find employees working in the IT department.
Select d.Dept_name, e.emp_name from employees e
right join departments d
on e.dept_id = d.dept_id
where dept_name= "IT";

--  Show all employees and their department names (include employees without department).
Select d.Dept_name, e.emp_name from employees e
left join departments d
on e.dept_id = d.dept_id;

--  Display all employees and their manager names (include employees without manager).
Select Emp_name,Manager_name from employees e
left join managers m
On e.manager_id = m.manager_id;

-- Show all employees and projects (include employees without projects).
Select p.project_name, e.emp_name from employees e
left join projects p
on e.emp_id = P.emp_id;

-- `
Select * from employees e
left join departments d
on e.dept_id = d.dept_id
left join projects p
on e.emp_id =P.emp_id;

-- Display employees with department name;
Select e.emp_name,d.dept_name from employees e
inner join departments d
on e.dept_id = d.dept_id;

-- Find employees who are not assigned to any project.
Select e.emp_name, p.project_name from projects p
right join employees e
on e.emp_id = P.emp_id
where project_name is null;

Select e.emp_name, p.project_name from employees e
left join projects P
on e.emp_id = P.emp_id
where project_name is null;

-- Show all departments and their employees (include departments without employees).
Select d.dept_name, e.emp_name from departments d
left join employees e
on e.dept_id =d.dept_id;

-- Display all managers and employees reporting to them.
Select manager_name,emp_name from employees e
Right join managers m
On e.manager_id = m.manager_id;


--  Show all projects and assigned employees (include projects without employees).
Select e.emp_name, p.project_name from employees e
right join projects P
on e.emp_id = P.emp_id;

--  List departments even if no employee is assigned.
Select d.dept_name, e.emp_name from departments d
left join employees e
on e.dept_id =d.dept_id;


--  Display managers even if they have no employees.
Select manager_name,emp_name from employees e
Right join managers m
On e.manager_id = m.manager_id;

-- Find departments with no employees
Select d.dept_name, e.emp_name from departments d
left join employees e
on e.dept_id =d.dept_id
where emp_name is null;