show databases;
use sakila;
show tables;
select * from actor;
select actor_id,first_name from actor;
select actor_id,actor_id*10,first_name from actor;
SELect actor_id,actor_ID*10,first_name 
FROM 
actor;

select * from actor where actor_id=2;

select * from actor where actor_id=5;

select * from actor where first_name='ed';

select * from actor where first_name='ed' and actor_id>100;
select * from actor where first_name='ed' or actor_id>100;

select * from actor where actor_id>10 and actor_id<25;

-- between operator between lower and higher
select * from actor where actor_id between 11 and 24;
select actor_id,first_name from actor where actor_id>100;

select first_name from actor where actor_id>100;

select * from actor where actor_id between 2 and 5;
select * from actor where actor_id in (2,5,78958449);

select * from actor where first_name='NICK';
select * from actor where first_name like 'NICK';
select * from actor where first_name like 'S%T';
select * from actor where first_name like 'E_';
select * from actor where first_name like '__';
select * from actor where first_name like '_A%';
