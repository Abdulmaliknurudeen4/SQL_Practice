select @@GLOBAL.SQL_MODE, @@SESSION.SQL_MODE;
create table test1(id int) engine=InnoDB;

create table users(id int);
desc users;
drop table users;
create table users(id int not null, username text not null);
insert into users(id) values(8);

set @@SESSION.SQL_MODE = 'STRICT_ALL_TABLES';