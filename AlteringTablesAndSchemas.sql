create table person( id int primary key auto_increment );
show tables;
desc person;
alter table person add column name varchar(50) not null after id;
alter table person add column password varchar(60) not null;
alter table person add column address_id int not null;
alter table person drop column password;

-- Happy Coding Adding Foreign Keys

create table address(id int primary key auto_increment, address varchar(80));
drop table address;
show tables;
desc address;
select * from person;
alter table person add constraint fk_address foreign key (address_id) references address(id);
select * from address;
alter table person drop foreign key fk_address;

--  Getting the names of foreign keys from the information schemas
show databases;
select TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
from INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_NAME = 'address';

-- Adding indexes
show tables;
desc employee;
select * from employee where id =2;
select * from employee where first_name = 'nuru';
alter table employee add index idx_band(first_name);
alter table employee drop index idx_band;
select * from employee;

-- Adding indexes for multiple columns
show tables;
desc person;
-- Index work on million of row and efficiency
-- work on large dataset
alter table person add index idx_name(name);
alter table person drop index idx_name;
alter table person add index idx_name(name,email);
