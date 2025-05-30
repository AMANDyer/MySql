use sakila;
select payment_id,customer_id,amount,(select avg(amount) from payment) from payment;

-- window functions
select payment_id,customer_id,amount,avg(amount) over(),
									sum(amount) over(),
                                    max(amount) over() from payment;

select payment_id,customer_id,amount,avg(amount) over(partition by customer_id),
									avg(amount) over() from payment;
                                    
select payment_id,customer_id,amount,
                                    sum(amount) over(order by payment_id) from payment;
                                    
select payment_id,customer_id,amount,
                                    sum(amount) over(partition by customer_id)from payment;
                                    
use employees;
show tables;
select * from salaries;

select emp_no,salary,sum(salary) over(),
                    avg(salary) over() from salaries;
                    
select emp_no,salary,year(from_date),
                     avg(salary) over(partition by emp_no) from salaries;
                     
select emp_no,salary,sum(salary) over(order by salary) from salaries; 
                     