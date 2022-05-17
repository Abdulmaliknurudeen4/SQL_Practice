select * from books;
select * from books;

DELIMITER $$

select * from books$$
select * from books$$

DELIMITER ;

select * from books;

-- Creating Procedures
DELIMITER $$
create procedure HelloWorld()
begin
select 'Hellow World';
select 'Lovely Bubbly';
end$$

DELIMITER ;

drop procedure if exists HelloWorld;
call HelloWorld();
-- stored procedure are stored here
show databases;
select * from mysql.proc;
show procedure status where db = 'test';

-- Gui Tools
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `HelloWorld`()
begin
select 'Hellow World';
end$$
DELIMITER ;

call HelloWorld();
-- Setting the Definer
drop procedure displayInterest;
use springboottutorial;
show tables;
create user malik@localhost identified by 'Hello';
drop user malik@localhost;
DELIMITER $$
CREATE definer = malik@localhost PROCEDURE `displayInterest`()
sql security definer
-- runs with the permission of the user that calls the procedure
-- sql security invoker
begin
select * from interests;
end$$
DELIMITER ;
-- The definer doesn't have permission to run it.
call displayInterest();
-- Granting Permissions to Stored Procedures

create user springUser@localhost identified by 'Hello';
create user procUser@localhost identified by 'Hello';
grant execute on procedure springboottutorial.displayInterest to springUser@localhost;
grant select on springboottutorial.interests to springUser@localhost;
grant select on springboottutorial.messages to procUser@localhost;
grant execute on procedure springboottutorial.displayInterest to procUser@localhost;
drop user springUser@localhost;
drop user procUser@localhost;

DELIMITER $$
CREATE definer = springUser@localhost PROCEDURE `displayInterest`()
sql security definer
-- runs with the permission of the user that calls the procedure
-- sql security invoker
begin
select * from interests;
end$$
DELIMITER ;

call displayInterest();
drop procedure displayInterest;

-- Practice Giving Users permission on Procedures
-- Passing Parameters to your Procedures
show tables;
use test;
DELIMITER $$
CREATE PROCEDURE `showBooks`( in maxId int, in title varchar(90) )
sql security definer
-- runs with the permission of the user that calls the procedure
-- sql security invoker
begin
select * from books where id < maxId and name = title;
end$$
DELIMITER ;
call showBooks(12,'MIB 2');
drop  procedure if exists showBooks;
select * from books;

-- SELECTING INTO VARIABLES
select id,name, library_id into @theId, @thename, @libraryId from books where id = 1;
select @theId,@thename,@libraryId;
show tables;
-- OUT variables in Procedures
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `HelloWorld`()
begin
select 'Hellow World';
end$$
DELIMITER ;

use test;
DELIMITER $$
CREATE PROCEDURE `showBooks`( in theId int, out outId int, out outName varchar(50) )
sql security definer
-- runs with the permission of the user that calls the procedure
-- sql security invoker
begin
select id, name into outId, outName from books where id = theId;
end$$
DELIMITER ;
call showBooks(12, @theId, @theName);
select @theId, @theName;
drop  procedure if exists showBooks;
select * from books;

-- INOUT variables in Procedures
-- Combine What in and out do
set delimiter //
select count(*) from books;
create procedure test1(inout id int)
begin
select id;
select count(*) into id from books;
end//
set delimiter ;
drop procedure test1;
set @value = 123;
call test1(@value);
select @value;
-- dont use because of efficiency
-- less confusing so don't it. rarely use inout type


-- IF STATEMENT
drop procedure withdraw;
set delimiter //
create procedure withdraw(in flag bool)
begin
	if flag = true then
		select 'Hello';
	else
		select 'GoodBye';
	end if;
end//
set delimiter ;
show tables;
select * from accounts;
call withdraw(true);
-- session variables
-- @Variable name
-- Local variable: always initialized to null
drop procedure withdraw;
set delimiter //
create procedure withdraw(in accountId int, in amount numeric(7,2), out success bool)
begin
	declare current_balance numeric(7,2) default 0.0;
    
    start transaction;
    -- You'll want to add an index into the balance column for the sake of efficientcy
		select balance into current_balance from accounts where id = accountId for update;
		if current_balance >= amount then
			update accounts set balance = balance - amount where id = accountId;
			set success = true;
		else 
			select 'Not Ok';
			set success = false;
		end if;
    
    commit;
    
	-- check the current balance in the account
    -- if balance big enough, do the withdraw
end//
set delimiter ;
show tables;
select * from accounts;
call withdraw(2,33.39, @success);
select @success;
select * from accounts;
use test;

-- Errors and Warnings

select * from plants;
select * from plants_db;
show errors;
show tables;
select * from books;
select name into @thenameses from books where id = 20;
update books set name = 'The Black Panta' where id  = 20;
select id into @myIds from books where id = 20;
show warnings;

-- Handling Errors
drop procedure withdraw;
set delimiter //
create procedure withdraw(in accountId int, in amount numeric(7,2), out success bool)
begin
	declare current_balance numeric(7,2) default 0.0;
    
    declare exit handler for sqlexception
    begin
		show errors;
    end;
    
    declare exit handler for sqlwarning
    begin
		show warnings;
    end;
    
    start transaction;
    -- You'll want to add an index into the balance column for the sake of efficientcy
		select balance into current_balance from accounts where id = accountId for update;
		if current_balance >= amount then
			update accounts set balance = balance - amount where id = accountId;
			set success = true;
		else 
			select 'Not Ok';
			set success = false;
		end if;
    
    commit;
    
	-- check the current balance in the account
    -- if balance big enough, do the withdraw
end//
set delimiter ;
show tables;
select * from accounts;
call withdraw(2,33.39, @success);
select @success;
select * from accounts;
use test;

-- While Loops 
use test;
delimiter $$
create procedure whiledemo()
begin

	declare count int default 0;
    declare numbers varchar(90) default "";
    
    while count <10 do
		set numbers := concat(numbers," + ",count);
        set count:= count + 1;
    end while;
    
    select numbers;

end$$

delimiter ;
drop procedure whiledemo;
call whiledemo();

-- Labelled Loops

use test;
delimiter $$
create procedure loopdemo()
begin

	-- Good for unknown amounts of loops that you don't know thier values
    declare count int default 0;
    declare numbers varchar(30) default "";
    
    the_lopp: loop
    
    if count = 10 then
		leave the_lopp;
	end if;
    
    set numbers:= concat(count,numbers);
    set count:= count+1;
    end loop;
    
    select numbers;

end$$

delimiter ;
drop procedure loopdemo;
call loopdemo();

-- Exercise: Produce Commas within Range of Numbers
delimiter //
create procedure rangingNumber()
begin
	declare count int default 0;
    declare numbers varchar(90) default "";
    
    the_loop: loop
    
		if count = 10 then
			leave the_loop;
		end if;
        
		set count:= count+1;
        set numbers:= concat(numbers, count, if(count<10,',','') );
        /**
        if count<10 then
			set numbers:= concat(numbers,count,',');
		else
			set numbers:= concat(numbers,count);
		end if;
        **/
        
        
    end loop;
    
    select numbers;
    
end//
delimiter ;
call rangingNumber();
drop procedure rangingNumber;

-- Generating Random Data
-- id
-- email user1@caveofprograming.com etc
-- random date
-- enabled (random boolean)
select round(rand());
select date(now()) - interval floor(1000*rand()) day;
drop table if exists users;

delimiter $$
create procedure generateData(in number_rand int)
	begin
		declare count int default 0;
        declare useremail varchar(90) default "";
        declare userdate date default now();
        declare userstate bool default false;
        
        declare exit handler for sqlwarning
			begin
				show warnings;
			end;
    
		drop table if exists users;
        create table users(id int primary key auto_increment, email varchar(40) not null,
			registered date not null, active_state boolean default false);
            
		while count < number_rand do
			set count := count + 1;
            set useremail:=concat('user',count,'@caveofprogramming.com');
            set userdate:= date(now()) - interval floor(1000*rand()) day;
            set userstate := round(rand());
            insert into users(email, registered, active_state)values(useremail, userdate, userstate);
		end while;
        
            
	end$$
delimiter ;
call generateData(1000);
select * from users limit 0,1000;
drop procedure generateData;
drop table users;
-- Cursors
-- A cursor is a way to fetch result from a table

delimiter $$

create procedure cursortest()
begin
	declare the_email varchar(99) default "";
    declare finished boolean default false;
    -- mysql cursors are very case sensitive
    -- you can't rewind the cursors 
	-- they are unidirectional
    declare curl cursor for select email from users 
    where active_state = true and registered > date(now()) - interval 1 year order by id;
    -- Handlers to stop the execution of the loop
    -- When the handler reaches the last
    declare continue handler for not found set finished:=true;
    truncate leads;
    
    open curl;
		the_loop: loop
			fetch curl into the_email;
            
            if finished then
				leave the_loop;
            end if;
            
            insert into leads(email) values(the_email);
            
        end loop the_loop;
    close curl;
    

-- 01.Variables, Cursors, then Handlers
end$$

delimiter ;
drop procedure cursortest;
call cursortest();
create table leads(id int primary key auto_increment, email varchar(90) not null);
truncate leads;
drop table leads;

select * from leads;

-- Case Syntax
create table products(id int primary key auto_increment, product varchar(40) not null, category enum('bakery','fruit','vegetable'));
insert into products(product, category) values('cow food',null);

create table fruits(id int primary key, product varchar(40) not null);
create table vegetable(id int primary key, product varchar(40) not null);
create table bakery(id int primary key, product varchar(40) not null);

select id, product, category from products order by id;
show tables;

delimiter $$
create procedure filltables(out unassigned longtext)
begin

	declare the_id int;
    declare the_product varchar(40);
    declare the_category enum('bakery','fruit','vegetable');
    declare finished bool default false;
    
	declare curl cursor for select id, product, category from products order by id;
    
    declare continue handler for not found set finished = true;
    
    open curl;
		set unassigned:= '';
		the_loop: loop
			 fetch curl into the_id, the_product, the_category;
			 if finished then
				leave the_loop;
			 end if;
             
             case the_category
				when 'fruit' then
					insert into fruits(id,product) values(the_id, the_product);
				when 'vegetable' then
					insert into vegetable(id,product) values(the_id, the_product);
				when 'bakery' then
					insert into bakery(id,product) values(the_id, the_product);
				else
					set unassigned:= concat(unassigned, the_product,', ');
             end case;
             
		end loop;
    close curl;

end$$
delimiter ;
drop procedure filltables;
call filltables(@unassigned);
select * from fruits;
select * from bakery;
select * from vegetable;
select @unassigned;

select * from products;
show tables;
drop table products;
drop table vegetable;
drop table fruits;
drop table bakery;
use test;

-- Multiple Cursors for procedure
delimiter $$

create procedure test(out titles text, out fruits text)
begin
	begin
		declare the_title varchar(90);
		declare finished bool default false;
		
		declare books_cursor cursor for select name from books;
		
		declare continue handler for not found set finished:=true;
		
		set titles:="";
		
		open books_cursor;
			books_loop: loop
				fetch books_cursor into the_title;
				
				if finished then
					leave books_loop;
				end if;
				
				set titles:= concat(titles, ', ',the_title);
				
			end loop;
		close books_cursor;
    end;
    begin
		declare finished bool default false;
        declare product varchar(40);
        
		declare fruit_cursor cursor for select name from libararies;
        
        declare continue handler for not found set finished:=true;
        
        set fruits:="";
		
		open fruit_cursor;
			fruit_loop: loop
				fetch fruit_cursor into product;
				
				if finished then
					leave fruit_loop;
				end if;
				
				set fruits:= concat(fruits, ', ',product);
				
			end loop;
		close fruit_cursor;
        
    end;
end$$
delimiter ;
call test(@titles, @names);
select @titles, @names;
drop procedure test;
select * from libararies;