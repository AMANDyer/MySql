use employees;
select * from employees;
select first_name from employees 
where year(hire_date)=(select year(hire_date) from employees 
where emp_no=10002 );

select emp_no,birth_date,first_name,last_name from employees
where birth_date>all(select birth_date from employees 
where emp_no between 10003 and 1006); 