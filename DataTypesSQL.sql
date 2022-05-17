drop table test;
create table test(zip_code char(7), name varchar(60), essaytext text);
insert into test (zip_code, name, essaytext) values ('PAR1235','Percentile Ranking','This is an essay text That accepts long text');

select * from test;

create table test(width float(5,2), breadth float(5,2), result float(7,2) default 0.0);
insert into test(width, breadth) values( 30.4056, 24.34);
select * from test;
set sql_safe_updates = 0;
update test set result = breadth + width;

create table test(salary decimal(5,2));
insert into test(salary) values(219.99);
select * from test;


create table test( name varchar(60), surname varchar(60), salary decimal(9,2));
insert into test(name, surname, salary) values('rumayzah','nurudeen',50000.45);
select * from test;

create table test( bitfield bit(4) );
insert into test(bitfield) values (b'101');
select * from test;
select bin(bitfield) from test;

drop table products;
create table products(id int primary key auto_increment, name varchar(50), price decimal(15,2), is_aval bool);
desc products;
insert into products(name, price, is_aval) values('Barcelona Jersey', 12000.45, false);
select * from products;
select * from products where is_aval = true;

drop table images;
create table images(picture_name varchar(90), picture_content blob, extension char(6));
insert into images(picture_name, picture_content, extension) values('micheal_video','100exValuesOfImage', '.mp4');
select * from images;

select year(now()), date(now()), time(now()), month(now()), monthname(now()), dayname(now()), dayofweek(now());
drop table moments;
create table moments(id int primary key auto_increment, theYear year, theDate date, theTime time);
desc moments;
insert into moments(theYear, theDate, theTime) values('2018','2012-05-15','12:15:59');
select * from moments;
insert into moments(theYear, theDate, theTime) values(year(now()),date(now()), time(now()));

drop table products;
create table products (name varchar(60), sold_at timestamp default now(), received datetime);
insert into products (name, sold_at, received) values ('Baby Shows', '2019-05-15 12:00:30','2015-05-15 23:45:30');
insert into products (name, received) values ('Baby Shows','2014-05-15 12:00:30');
select year(sold_at), time(sold_at), monthname(sold_at) from products;
select * from products;


drop table foods;
create table foods(name varchar(60), temperature enum('cold','hot','warm') default 'cold', flavour enum('sweet','savoury','oniony') default 'sweet');
insert into foods(name, temperature, flavour) values('Amala and Gbegiri Soup','hot','savoury');
insert into foods(name, temperature, flavour) values('Chicken Sauce','ff','sadoury');
insert into foods(name) values('Banana Fruit Juice');
select * from foods;
select * from foods where temperature = 'cold';

select * from foods where temperature = 'hot' or temperature = 'cold' and flavour = 'sweet';
select * from foods where (temperature = 'hot' or temperature = 'cold') and flavour = 'sweet';
select * from foods where temperature = 'hot' or (temperature = 'cold' and flavour = 'sweet');

