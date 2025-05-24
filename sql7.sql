-- data types
use sakila;
create table test(id int );
insert into test values(10);
select * from test;

create table test2(id tinyint );
insert into test2 values(10);
select * from test2;

-- unsigned all no will be positive only
create table test3(id tinyint unsigned );
insert into test3 values(True);
select * from test3;

-- float and decimal
create table test5(id decimal(5,2) );
insert into test5  values(854);
insert into test5  values(854.75684);
insert into test5  values(8546.7);  -- will give error
select * from test5;

-- string 
create table test4(fname char(5)); -- fixed length character
insert into test4 values('hi');
insert into test4 values('hhello'); -- only take limited
select * from test4;

create table test7(fname varchar(5)); -- it saves extra memory but only takes limited character
insert into test7 values('hi      ');-- only takes the remaining limit whitespaces 3
insert into test7 values('hhell'); -- only take limited
select fname,char_length(fname) from test7;
 
-- date and timestamp
create table test8(dob date ); -- fixed formate year-month-day
insert into test8 values('2023-12-01'); 
insert into test8 values('hhello'); 
select * from test8;

create table test9(dob timestamp ); -- fixed formate year-month-day
insert into test9 values('2023-12-01 10:15:59'); 
insert into test9 values(now()); 
select * from test9;


-- subquery
-- query within a query
select * from payment
where amount=(select amount from payment where payment_id=15);

select payment_id,customer_id,rental_id,amount from payment
where staff_id=(select staff_id from payment where rental_id=1422);
