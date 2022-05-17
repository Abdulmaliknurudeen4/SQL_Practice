show databases;
create database tutorial1;
use tutorial1;
create table users (username text);
show tables;
desc users;
insert into users(username) values ("Ogun State");
select * from users;

drop table users;

create table users (id int, username text);
use users;
insert into users(id,username) values (4,"Khaleel Bigman");
