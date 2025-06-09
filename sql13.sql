-- CTE	
use sakila;
select * from (select * from actor where actor_id between 2 and 5
order by actor_id desc)as x;
select * from x;

with data as 
(select * from actor where actor_id between 2 and 5
order by actor_id desc)
-- select * from data;
select * from actor
inner join data where actor.actor_id=data.actor_id; 

with dev as
(select customer_id,avg(amount) from payment
group by customer_id)
select * from payment
inner join dev where payment.customer_id=dev.customer_id;

select * from film_actor;
show tables;

with cte as 
(select a.actor_id,a.first_name,
f.film_id from actor as a join film_actor as f
where a.actor_id=f.actor_id)
-- select * from cte; 
select d.actor_id,d.first_name,d.film_id,f.title  from cte as d
join film as f where d.film_id=f.film_id;

-- recursive cte
with recursive cte as 
(select 1 as id
union
select id+1 from cte where id<5)
select * from cte; 

