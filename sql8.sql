use sakila;
select * from payment
    where amount=(select amount from payment where payment_id=6);
    
select * from actor
     where actor_id>(select actor_id from actor where first_name='ED' and last_name='CHASE'); -- subquery column name must be similar to conditional column
	
select * from payment
    where month(payment_date)=(select month(payment_date) from payment where payment_id=5);
    
select customer_id,payment_id,amount from payment
     where rental_id<(select rental_id from payment where payment_id=7 and amount<5);
     
select payment_id,amount from payment where payment_id in(3,1);
select * from payment
where amount in (select amount from payment where payment_id in(3,1)); -- multi raw subquery we cannot apply any operators on them
 
 select * from payment
where amount =any (select amount from payment where payment_id in(3,1));

select * from payment
where amount >any (select amount from payment where payment_id in(3,1));

select * from payment
where amount <any (select amount from payment where payment_id in(3,1));

select * from payment
where amount <all (select amount from payment where payment_id in(3,1));

select * from payment
where amount >=all(select amount from payment where payment_id in(3,1));



