show databases;
-- Creating Users with priviledges 
-- Creating the same user with root permission
create user 'abdulmalik'@'localhost' identified by 'letmein';
-- for granting permission
grant all privileges on *.* to 'abdulmalik'@'localhost';
-- refresh priviledges
flush privileges;
-- deleting
drop user 'abdulmalik'@'localhost';

create user 'abdulmalik'@'localhost' identified by 'letmein';

-- restricted set of priviledges
select * from mysql.user;
create user 'abdulmalik'@'localhost' identified by 'letmein';
grant select,update, insert, delete on people.* to 'abdulmalik'@'localhost';
-- List all priviledges