insert into users(id) values (6);
select * from users;
drop table users;
show tables;
create table users(id int not null, username text not null);
desc users;
insert into users(username) values ("warning Icon");

create table login(id long not null, firstname text not null, surname text, ILO boolean not null);
desc login;
insert into login(id,firstname,surname,ILO) values(2,"Usamah","Nurudeen",true);
select * from login;
drop table login;