drop table users;
create table users (id int primary key auto_increment, name text, age int);
insert into users (name,age) values("b0b", 45);
INSERT INTO `users` VALUES (2,'Bob',47),(3,'Vicky',25),(4,'Raj',21),(5,'Pete',60),(6,'John',41),(7,'Mark',30),(8,'Sue',53),(9,'Don',25),(10,'John',20),(11,'Syed',33),(12,'Christina',28),(13,'Mario',19),(14,'Justin',23),(15,'Clare',49),(16,'Sarah',73),(17,'Pete',28),(18,'Steve',32),(19,'Zoe',36),(20,'Cori',17),(21,NULL,99),(22,NULL,20);
select * from users;

select count(*) from users;
select * from users where age < 30;
select * from users where age <= 30;
select * from users where age >= 30;

select * from users where name != 'Bob';
select * from users where name is null;
select * from users where name is not null;
select * from users where name like '%o%';
select * from users where name not like '%o%';

select * from users where age between 15 and 30;
select * from users where name <=> '';
select * from users where age = greatest(15,20,1,19,2,3,30,22);
select * from users where age in(15,20,1,19,2,3,30,22);
select * from users where age is null;
select * from users where id  = least(15,20,1,19,2,3,30,22);
select * from users where name like '%a%';
select * from users where name in ('Christina','Mario','Clare','Sarah');
select * from users where age not between 12 and 30;
select * from users where age not in(15,20,1,19,2,3,30,22);