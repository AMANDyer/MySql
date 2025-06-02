use sakila;
select * from payment;
select payment_id,customer_id,amount,sum(amount) over(partition by customer_id) as sumofamount,
rank() 
      over(partition by customer_id order by amount desc) as rank1,
dense_rank() 
      over (partition by customer_id order by amount desc) as drank1 
      from sakila.payment;
      

-- drank rank()
select * from
(select payment_id,customer_id,amount,
dense_rank()
over (order by amount desc)as drank1
from sakila.payment)as tab where drank1=3;

-- data query
-- how to insert and update
-- DML when data changes
-- DDL when changes in table
-- insert command
use sakila;
create table xyz(id int,fname varchar(20));
insert into xyz values(10,"aman");
-- insert into xyz values(11) gives error
insert into xyz(id) values(11); -- faname>=null
insert into xyz(fname) values("Afzal");
select * from xyz;

-- update command
update xyz set fname="regex";
update xyz set faname="tushar" where id=10;
select * from xyz;

-- delete 
delete from xyz where id=11;
select * from xyz; 

-- DML insert update delete

-- drop DDL
drop table xyz;

-- drop delete truncate differnces 


