use test;
show tables;

-- Functions
select * from books;
select concat('Title: ',name) as Movie_title from books;

select concat('My',' ','name is',' ','Abdulmalik');
select ucase(name) from books;
select lcase(name) from books;

-- They take arguments and return values
select LEFT('England', 2);
select ucase(left('England',2));
select trim('  fox  ');
select ltrim('  Love');
select rtrim('Love   ');

select substr('Quadractically',5);
-- select substr('foobarbar', FROM 4);
select substr('Quadractically',5,6);
select substr('Sakila',-3);
select substr('Sakila',-5,3);
-- select substr('Sakila', (FROM -4 FOR 2));
set @greeting = 'Hello Bob, How are you ?';
select substr(@greeting,7);
select substr(@greeting, 7, 3);
select substr('Hello Bob, How are you ?', 7, 3);
select substr('Hello Bob, How are you ?', 7,3);

-- LeftMost Characters
-- Date
show tables;
create table del_dates(id int primary key auto_increment, applied date);
insert into del_dates(applied) values(curdate() - interval 26 year);
select * from del_dates;
select * from del_dates where applied < curdate();
select * from del_dates where applied < (curdate() - interval 10 year);
select curtime() as time;
-- can be used for timestamps
-- date_diff
select id, year(applied), month(applied) from del_dates;
set @born = '2001-06-07';
select year(@born);
select dayname(@born);
select monthname(@born);
select datediff(curdate(),@born);
select datediff(curdate(),@born)/365;
select from_days(datediff(curdate(),@born));
-- strtodate
select str_to_date('07/06/2001','%d/%m/%Y');
select str_to_date('07/06/2001','%d/%m/%Y') + interval 19 year;
select date_format('2010-02-27','%a %y');
select date_format('2010-02-27','%a %d %M %Y');
select date_format('2010-02-27','%W %d %M %Y');
select date_format('2010-02-27'+ interval 19 day + interval 19 year,'%W %d %M %Y');

-- Control Flow Functions
select if(6>9, "Hello", "Goodbye");
create table parts(id int primary key auto_increment,
 part_id varchar(20) default null, catalog_id varchar(20) not null);
 
 insert into parts(part_id, catalog_id) values(null,'AB1246');
 select * from parts;
 select if(part_id is not null, part_id, catalog_id) as identifier from parts;
 
 select if(part_id is not null, part_id, catalog_id) as identifier from parts
 where if(part_id is not null, part_id, catalog_id) = 'AB1246';
 
 select ifnull(part_id,catalog_id) as identifier from parts;
 
 -- Casting better for software development variable passing
 select cast('1999-06-07' as char);
 select cast('1999-06-07' as date);
 show tables;
 -- Casting examples
 select concat('Number of Books: ',cast(count(*) as char)) from books;
 
 select str_to_date('1991-12-1','%Y-%m-%d');
 
 
 
 