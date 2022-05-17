desc category;
show tables;
desc kingdom;
LOCK TABLES category WRITE;
-- Doing Whateven needs
desc category;
select * from category;
select * from sales;
insert into category(category_name) values('Mobile Phones');
delete from category where id = 7;
UNLOCK TABLES;
-- Various
LOCK TABLES category write, kingdom write;
select * from category;
select * from kingdom;
UNLOCK TABLES;
-- To prevent Shitty Duplication of other mistake
-- Shared Table LOCKS --read LOCKS can be given by multiple users
LOCK TABLES category read;
insert into category(category_name) values('Gizmos');
select * from category;
UNLOCK TABLES;
-- multiple users can give read locks, all can read, but all can't write or update
-- using variables in sql

select now();
select 3;
-- creating variables
set @user = "AbdulMalik";
select @user;

set @value = 99;
select @value;

set @min_value = 20500;

show tables in cinema;
select * from products;
select * from products where price <> @min_value;

set @firstSum = 90;
set @secondSum = 90;

select * from products where price > (@firstSum);
-- Set Variables in select Statements
select sum(price) from products;
select @total:=sum(price), @min_val:=min(price), @max_val:=max(price), @avg_val:=avg(price) from products;
select @total, @min_val, @max_val, @avg_val;

-- Example of Usage
show tables;
select * from products;
create table product_sum_history(recorded timestamp, total decimal(29,2));

select @sum_prod:=sum(price) from products;
insert into product_sum_history values(now(),@sum_prod);

select * from product_sum_history;

insert into product_sum_history values (now(), (select sum(price) from products));
explain insert into product_sum_history values (now(), (select sum(price) from products));
-- Using table Locks
show tables;
select * from products;
/** 
Lock the sales table and prevent everyone from updating it including us and get a write lock on
the product_sum_history and prevent everyone from writing in it except us.
the unlock it
**/
lock tables products read, product_sum_history write;
select @sum_product:=sum(price) from products;
insert into product_sum_history values(now(),@sum_product);
unlock tables;

-- Simple Transaction
use test;
show tables;
select * from books;
set autocommit = 0;

commit;
rollback;
set sql_safe_updates =0;
-- transaction;
use test;
select * from books;
update books set name = 'The Valley' where id = 3;

start transaction;
update books set name ='The Amazing Universe2' where id = 14;
select * from books;

commit;
--
show index in books;
set session transaction isolation level repeatable read;
start transaction;
update books set name = 'The Valeey' where id = 3;
select * from books;
-- when rows without indexes are selected
update books set name = 'The Valley' where name ='The Valley is Released';
-- index
select * from books where name = 'MIB';
commit;

-- 
start transaction;
select * from books;
commit;
-- Account Transfer Problem
use test;
desc accounts;
select * from accounts;

set @transfer = 200;
update accounts set balance = balance - transfer where id = 1;
update accounts set balance = balance + transfer where id = 2;


-- selecting for updates using write lock for row(exclusive)
-- they can't be read if the other haven't finished
-- always remember that for update has to work with index otherwise it locks the whole 
-- table .
start transaction;
select * from accounts;
set @withdraw = 500;
set @account = 2;
select balance from accounts where id = @account for update;
-- checks that the balance is bigger than the withdrawal amount
update accounts set balance = balance - @withdraw where id = @account;
update accounts set balance = balance + @withdraw where id = 1;
commit;
rollback;
-- LOCK IN SHARE MODE SYNTAX
-- stops people from updating table until you've finish you're selecting
start transaction;
select * from books;
select id from libararies where name = 'NottingHam' lock in share mode;
delete from libararies where name = 'NottingHam';
insert into books(title, library_id) values('Painting for Begineers');
commit;
