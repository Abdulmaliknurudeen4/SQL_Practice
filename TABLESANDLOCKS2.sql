use cinema;
show tables;
select * from category;
LOCK table category read;
select * from category;
insert into category(category_name) values('Gizmos');
UNLOCK TABLES;
-- Lock and Transaction and others
-- Table locks and others

/** 
Lock the sales table and prevent everyone from updating it including us and get a write lock on
the product_sum_history and prevent everyone from writing in it except us.
the unlock it

Useful for the case of MYISAM Storage Engine
**/
lock tables sales read, product_sum_history write;
select @sum_prod:=sum(price) from products;
insert into product_sum_history values(now(),@sum_prod);
unlock tables;
-- inserting into the products table at this time will not work
desc products;
insert into products values(0,'Infinix Hot 6',12.22,'Lovely PHone',1);

-- Row Locking within the context of transactions
-- ACID
-- Atomicity
-- Consistency
-- Isolation
-- Durability

-- InnoDB(ACID complaint)
-- MYISAM(not ACID complaint)

-- Simple Transaction

use test;
show tables;
create table books(id int primary key auto_increment, name varchar(60));
insert into books(name) values('The Thirty-Nine Steps');
select * from books;
set sql_safe_updates = 0;
set autocommit = 0;
insert into books (name) values ('The Journey');
insert into books (name) values ('The Mountain');

insert into books (name) values ('The Universe');
insert into books (name) values ('The MIB');
delete from books where id = 3;
update books set name = 'The Men in Black' where id = 5;
rollback;
commit;
-- commit or rollbacks ends or completes a transaction
-- transactions

use test;
select * from books;

start transaction;
update books set name = 'The Men In Black' where id = 3;
commit;
-- ACID
-- Table locking Row-level locking
-- Read(shared), write (exclusive)
-- 01.Row level locking
select @@transaction_isolation;
-- Table locking in both engines
-- Row level locking  only applies to indexes, that means if a table doesn't have an index
-- it defaults to locking the whole table
-- Row level: indexes
-- Row Locks: read(shared), write(exclusive) locks
-- 01. Isolation level Serializable
-- Locks on every thing you do even select sef. it locks all things
-- Nobody can update what you've selected until you finish viewing what you wanna view
set session transaction isolation level serializable;
use test;
show index in books;
set sql_safe_updates =0;
start transaction;
select * from books where id = 1;
-- without index
select * from books;
select * from books where name = 'The Men In Black';
update books set name = 'The Valley' where id = 1;
alter table books add index idx_name(name);
show index in books;

commit;

-- 02. Repeatable Reads
-- A select within this kinda of transaction will never change no matter what other
-- connection do. Same results everytime. 
-- Problems: Phantom Reads
set session transaction isolation level repeatable read;
start transaction;
select * from books;
update books set name = 'MIB' where id = 3;
insert into books(name) values('Aladdin'),('Lov'),('O2');
commit;


-- 03. Read Commited
-- A select won't see same results everytime if someone commits a change in another transactionj
-- 

set session transaction isolation level read committed;
start transaction;
select * from books;
update books set name = 'MIB 2' where id = 3;
insert into books(name) values('Love My Life'),('Indianian Dance'),('First Kiss');
commit;


-- 04. Read uncommited
-- You can select data that haven't been commited at all in a transaction
set session transaction isolation level read uncommitted;
start transaction;
insert into books(name) values('Love me like myself');
rollback;
commit;

-- Rolling Back to SavePoints in a transactions;

select @@transaction_isolation;
start transaction;
use test;
show tables;
select * from books;
delete from books where id = 16;
insert into books(name) values('The Horror 2');
savepoint test1;
update books set name = 'The Forest' where id = 14;
insert into books(name) values('The Love at First Sight');
select * from books;
/** Rolling back to any savepoint doesn't release any locks you've got on 
a table and  **/
rollback to test1;
update books set name = 'The Amazing Universe' where id = 14;
select * from books;
rollback;

-- Account Transfer Problem
use test;
create table accounts(id int primary key auto_increment, balance numeric(10,2) default 0);
desc accounts;
insert into accounts(balance) values(800),(800);
select * from accounts;
start transaction;
set @transfer = 200;
update accounts set balance = balance - @transfer where id = 1;
update accounts set balance = balance + @transfer where id = 2;
commit;
rollback;

-- selecting for updates
update accounts set balance = 800.00;
set sql_safe_updates = 0;
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
-- You don't want people to delete a library and you adding a book where the library is already
-- down. Very Useful for the MYISAM storage engine and less useful for the InnoDB Engine

start transaction;
create table libararies(id int primary key auto_increment, name varchar(70));
insert into libararies(name) values('NottingHam'),('Hamshpire'),('Holdings'),('FolkShire');
desc books;
alter table books add column library_id int, add foreign key(library_id) references libararies(id);
select * from books;
select id from libararies where name = 'NottingHam' lock in share mode;
insert into books(name, library_id) values('Painting for Begineers',1);
commit;




