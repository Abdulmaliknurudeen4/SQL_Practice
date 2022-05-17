drop database springboottutorial;
create database springboottutorial;
use springboottutorial;
show tables;

select * from profile;
select * from status_update;
select * from users;
select * from verification;

desc users;
update users SET enabled = true WHERE id = 7;
select * from users WHERE enabled = 0;
desc interests;
desc profile_interest;

set sql_safe_updates = 0;
select * from profile_interest;
select * from profile;
select * from interests;

select * from users;
select count(email) from users;
select count(interest_name) from interests;

delete from profile_interest;
delete from interests;
delete from profile where id > 7;
delete from users where id > 2;

select * from users where firstname LIKE 'Alfonso';


create database springboottutorialtest;
use springboottutorialtest;
show tables;
select * from interests WHERE interest_name='some interest_name';
delete from interests WHERE interest_name ='some interest_name';
select * from users;
select count(email) from users;
drop database springboottutorialtest;