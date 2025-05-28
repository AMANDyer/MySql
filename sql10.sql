-- corelated subquery
use employees;
select * from employees;
select * from departments;
select * from dept_emp;
select e.emp_no,e.first_name,d.dept_no from employees as e inner join dept_emp as d where e.emp_no=d.emp_no; 
select emp_no from salaries where salary >all(select salary from salaries where emp_no=10001);
select * from salaries as sal 
where salary>( select avg(salary) from salaries as s
where sal.emp_no=s.emp_no);

create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;
select DeptID,avg(salary) from employees group by DeptID;
select * from employees as emp
where salary >(select avg(salary) from employees as emp1
where emp.DeptID=emp1.DeptID);

-- list department where atleast one emp.earns more than 60k
select deptid,DeptName from departments as d where exists(select deptid from  employees as e where e.DeptID=d.DeptID and e.salary>60000);

-- find employee who have the highest salary in their department
select * from employees as outt
where salary>=(select max(salary) from employees as inn 
   where outt.deptid=inn.deptid);


use regex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

select s.StudentID,s.StudentName,c.coursename from students as s 
inner join courses as c  where s.Department=c.Department;

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Enrollments;
select * from enrollments as e  where grade>(select avg(grade) from enrollments as e1  where e.studentid=e1.studentid);

select * from enrollments as e  where grade=(select max(grade) from enrollments as e1  where e.studentid=e1.studentid);
