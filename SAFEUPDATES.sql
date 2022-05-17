use tutorial1;
show tables;
drop table test1;
insert into users(id,username) values(3,'Sad');
select * from users;
delete from users;

select @@SESSION.SQL_SAFE_UPDATES;
set sql_safe_updates = 0;
