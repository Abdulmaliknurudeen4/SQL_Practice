-- Update Statements
-- CRUD create read update delete
select * from users;
update users set name ='Jim' where name = 'b0b' and id = 1;
set sql_safe_updates = 0;
update users set name = 'Bob' where name = 'Jim';

update users set age = age - 5 where (age > 5 and age < 15);
update users set age = age + 10 where (age between 10 and 90);

-- Order By Statements
select * from users where id < 20 order by age asc;
-- Multiple order specifiers. primary and secondary order attribute
select * from users where id < 20 order by age asc, name asc, id desc;

-- Limiting Result LIMIT KEYWORD

select * from users order by id limit 10, 5;
select * from users where (age > 20 and age < 30) order by name, age asc;
select * from users where (age > 30 and age < 50 ) order by age, name;
select * from users where (age > 30 and age < 50 ) order by age, name LIMIT 5;


