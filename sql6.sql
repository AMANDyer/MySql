use sakila;
select * from payment;
select customer_id,count(payment_id ) from payment where customer_id>3 group by customer_id;
select customer_id,count(payment_id ) from payment  group by customer_id having count(payment_id)>30;

select customer_id,count(payment_id ) from payment where customer_id not in (2,3) group by customer_id having count(payment_id)>30;
select amount,count(payment_id ),count(customer_id) from payment where amount not in (2.99,0.99) group by amount;
select amount,sum(rental_id),sum(amount) from payment where amount in (2.99,0.99,5.99) group by amount having sum(rental_id)>1000;  
select * from actor;
select * from film_actor;
select a.actor_id,a.first_name,fa.film_id from actor as a
join film_actor as fa where a.actor_id=fa.actor_id ;

select a.actor_id,count(film_id)from actor as a
join film_actor as fa where a.actor_id=fa.actor_id group by a.actor_id having count(film_id)>25;
