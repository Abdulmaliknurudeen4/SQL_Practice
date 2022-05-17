select s.id as survery_id, s.weight as weight_kg, s.sugar as sugar_intake_score, s.health as health_score from survey s;
desc survey;
select s.gender as sex, s.country as destination, s.age as experienceLife, s.fat as fat_intake from survey s where s.age>3;
select s.gender as sex, s.country as destination, s.age as experienceLife, s.fat as fat_intake from survey s where s.gender = 'male';


-- Foriegn Keys

create database people;
use people;
create table address(id int primary key auto_increment, street varchar(60));
insert into address(street) values('Eagle Drive Lane');
select * from address;

create table person(id int primary key auto_increment, name varchar(50), address_id int, foreign key (address_id) references address(id) );
desc person;
insert into person(name, address_id) values ('Arnold',1);
select * from person;
-- Cartesian Products
select * from person, address;
-- Maybe
select * from person, address where person.address_id = address.id;
-- Joins

select p.id as person_id, p.name, p.address_id as person_address_id, a.id as address_id, a.street from person p, address a where p.address_id = a.id;
-- Can't Use Aliases in where clauses . It Won't Work
select p.id as person_id, p.name, p.address_id as person_address_id, a.id as address_id, a.street from person p, address a where p.person_address_id = a.id;

-- Inner Joins Right Ways to do Joins

select p.id as person_id, p.name, p.address_id as person_address_id, a.id as address_id, a.street from person p
 join address a on a.id=p.address_id;
 -- shortened to include important data
select p.id as person_id, p.name, a.street from person p
 join address a on a.id=p.address_id;

-- Left and Right Outer Joins
desc person;
select name from person;
select street from address;
insert into address(street) value('Laptop Drive');
select * from address ;
-- Allowed to have null
insert into person(name, address_id) values ('No-one',null);
-- ON CONSIST OF ROWS HAVING MATCHING VALUE IN BOTH TABLES
select name, street from person p inner join address a on p.address_id=a.id;
-- outer joins
-- shows unmatched values from the left table
select name, street from person p left outer join address a on p.address_id=a.id;
-- shows unmatched values from the right table
select name, street from person p right outer join address a on p.address_id=a.id;

-- multiple table joins
use health;
select * from survey;
select * from drink;
select su.id, country, age, sm.question as smoke_habit, e.question as exercise_habit from survey su join smoke sm on su.smoke = sm.id join exercise e on e.id = su.exercise;

-- linking tables with multiple joins

use people;
show tables;
drop table person;
drop table address;
desc address;
desc person;
create table region(id int primary key auto_increment, name varchar(60));
create table address(id int primary key auto_increment, street varchar(60), region_id int, foreign key(region_id) references region(id));
create table person(id int primary key auto_increment, name varchar(60), address_id int, foreign key (address_id) references address(id));
insert into region(name) values ('Nigeria'),('Hampshire'),('New York'),('New Delhi'),('Aston Villa');
insert into address(street,region_id) values('Apple Lane',1),('Salami Street',2),('Idi Street',3),('Abayomi Street',4);
insert into person(name , address_id) values('Abdulmalik Nurudeen',1),('Usamal Nurudeen',2),('Nafisah Nurudeen',3),('NoOne',4);

select * from address;
select * from person;
select * from region;

select p.name as personName, a.street as streetName, r.name as regionName from person p join address a on p.address_id = a.id join region r on a.region_id = r.id;

-- Many to One and One to One Relationships
-- mother
-- child
-- many to many relationship
-- primary keys aren't needed in many to many mapping table

create table product(id int primary key auto_increment, name varchar(60));
insert into product(name) values('Electric Dog Grommer'), ('Fasha'), ('Love Potion'), ('Kite Love');
create table person_product(person_id int not null, product_id int not null, foreign key(person_id) references person(id), foreign key (product_id) references product(id));
desc person_product;
select * from person,product;
insert into person_product(person_id,product_id) values(1,2),(1,1),(4,1),(4,2),(3,1),(3,3);
select * from person_product;

select pe.name as customer_name, pr.name as bought_product
 from person pe join person_product pp on pe.id = pp.person_id join product pr on pr.id = pp.product_id; 

-- Joining Table to Themselves -- Self Join

create database cinema;
use cinema;
create table seats (id int primary key auto_increment, free bool);
insert into seats(free) values(true),(false),(true),(false),(true),(true),(true),(false),(true),(True),(false);

select * from seats sa,seats sp where sa.id+1=sp.id having sa.free=sp.free;
select * from seats;
select s1.id as 'Seat One', s2.id as 'Seat Two' from seats s1 join seats s2 on s1.id=s2.id+1 and s1.free=true and s2.free=true;
-- self join works

-- Foriegn Keys Behavior
create table kingdom(id int primary key auto_increment, name varchar(60));
create table organims(id int primary key auto_increment, name varchar(60), kingdom_id int, foreign key(kingdom_id) references kingdom(id) on delete cascade on update cascade );
create table individual(id int primary key auto_increment, name varchar(70), organims_id int, foreign key(organims_id) references organims(id) on delete cascade on update cascade );
desc kingdom;
desc organims;
insert into kingdom(name) values('Animal'),('Fungi'),('Bacteria'),('Protozoan');
insert into organims(name,kingdom_id) values('Dog',1),('Mushroom',2),('P.Falciparum',3),('P.vivax',3),('Misseotoe',4);
insert into individual(name, organims_id) values('ABC',1),('BCD',3),('FXY',2),('ZSY',4);
select * from organims;
select * from kingdom;

delete from kingdom where id = 1;
delete from organims where id = 5;
drop table kingdom;
drop table individual;
drop table organims;


-- cascasde options

select * from individual i join organims o on i.organims_id = o.id 
join kingdom k on o.kingdom_id = k.id;

select * from organims;
select * from kingdom;
select * from individual;

delete from kingdom where id = 1;
update kingdom set id = 5 where id = 4;

