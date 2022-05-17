select * from users;
select distinct name from users;
select * from users order by name;

select distinct name , age from names;
select * from names;
select count(*) from names;
select count(name) from names;
select count(distinct name) from names;
select count(distinct name, age) from names;

-- Aggregate Functions of MySql
 select count(*) from users;
 select count(distinct age) from users;
 select count(distinct name) from users;
 select count(name) from users;
 -- count doesn't count null values or other aggregate functions
select avg(distinct age) from users;
select avg(age) from users;
select min(age) from users;
select max(age) from users;
select sum(age) from users;

-- Arithmetic in MYSQL
select 8/8;
select 30 + 70;
select age/4.5 from users;
select avg(age) * count(*) from users;
select sum(age) from users;
select variance(age) from users;
select var_pop(age) from users;

-- calculating average without using the avg() function

select sum(age) / count(age) from users;
select avg(age) from users;