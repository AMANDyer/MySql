use sakila;
select * from actor;
select * from film_actor;
-- joins
select f.film_id,f.actor_id from film_actor as f
join actor as a;

create database regex;
use regex;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);
select * from orders1;
-- common condition
select o.oid,o.city,o.pid,p.pname from orders1 as o
join product as p where o.pid=p.pid;


 -- if there is no condition given in join
 -- imp*****cartesion join or cross join = it is a type of join where first table's each row matched with each row of second table
 -- formula = M*N
 -- old syntex
select o.oid,o.city,o.pid,p.pname,p.pid from orders1 as o
join product as p ;

-- new syntex
-- inner = common column  and values present in both if not present in any of them doesnt show
select o.oid,o.city,o.pid,p.pname from orders1 as o
inner join product as p where o.pid=p.pid;

-- outer join if we want all data of a table left or right mainly or full but mySql doesnt support full join
select o.oid,o.city,o.pid,p.pname from orders1 as o
left join product as p ON o.pid=p.pid;

select o.oid,o.city,o.pid,p.pname from product  as p
left join orders1 as o ON o.pid=p.pid;

select o.oid,o.city,o.pid,p.pname from product  as p
right join orders1 as o ON o.pid=p.pid;

use sakila;
select * from actor;
select * from film_actor;
select * from film;

-- 1
select fa.actor_id,f.film_id,f.title from film_actor as fa
inner join film as f ON fa.film_id=f.film_id;

-- 2
select fa.actor_id,f.film_id,f.title,f.length from film_actor as fa
inner join film as f ON f.length>100;


-- 4
select film_id,title,rating from film where rating='NC-17' order by film_id desc;

-- 3
select 



