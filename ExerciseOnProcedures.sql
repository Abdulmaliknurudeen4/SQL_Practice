/**
Tips:

Order by rand()
.
Will need to use two cursors at one point in these exercise!
Build up step by step.

Test sql outside of procedure (don't forget to remove @ from variable names)


1. Manually create a table containing two columns and a primary key, one column
a list of nouns and one column a list of adjectives

e.g.

1 hot dog
2 fast banana
3 orange cloud
4 charming curtain
.....



Write a procedure that returns data in two "out" variables. One will contain

all the nouns joined with commas, the other will contain all the adjectives

joined by commas.



Optional: modify the procedure so that there is no stray extra comma before or after
the start of the lists.
**/
-- 01.
create table sentence(id int primary key auto_increment, adjective varchar(60) not null,
	noun varchar(60) not null);
insert into sentence(adjective,noun) values('beautiful','recitation');
delimiter $$

create procedure extract_sentence(out adjectives varchar(60), out nouns varchar(60))
begin
	declare collected_adj varchar(90);
    declare collected_noun varchar(90);
    declare finished bool default false;
    
    declare curl cursor for select adjective, noun from sentence;
    
    declare continue handler for not found set finished:=true;
    
    set adjectives:= "";
    set nouns:= "";
    
    open curl;
		sentence_loop: loop
            -- fetch first
            fetch curl into collected_adj, collected_noun;
            -- check if able to do fetch
            if finished then
				leave sentence_loop;
			end if;
            -- true: set variables
            set adjectives := concat(adjectives, ', ', collected_adj);
            set nouns := concat(nouns, ', ', collected_noun);
            
        end loop;
        
        set adjectives:= substr(adjectives FROM 2);
        set nouns:= substr(nouns FROM 2);
        
    close curl;

end$$

delimiter ;
call extract_sentence(@adj, @noun);
select @adj, @noun;
drop procedure extract_sentence;
select * from sentence;

/**

2. Write a stored procedure that creates a table called "stars" containing a column of type text.

Make the procedure populate the table by selecting an adjective at random and

a noun at random and joining them together with a space between them.


Hot Cloud
Charming Dog
etc.
Optional: upper case the first letters of the two words.



**/
delimiter $$

create procedure starpop()
begin
	-- variables
	declare count_of_rows int default 0;
    declare rand_noun varchar(60) default "";
    declare rand_adj varchar(60) default "";
    declare finished bool default false;
    declare randomNoun int default 0;
    declare randomAdj int default 0;
    
    declare temp_adj varchar(60) default "";
    declare temp_noun varchar(60) default "";
    
    -- cursors
    declare curl cursor for select adjective, noun from sentence;
    
    -- handlers
    declare continue handler for not found set finished:= true;
    
    -- create star table if exists
	drop table if exists star;
    create table star(id int primary key auto_increment, name text not null);
    
    -- select into the count variables the number of rows in the sentence table
    select count(*) into count_of_rows from sentence;
    
    open curl;
    
		rand_loop : loop
        
			fetch curl into temp_adj, temp_noun;
            
			if finished then
				leave rand_loop;
            end if;
            set randomNoun:= round(rand() * count_of_rows);
            set randomAdj:= round(rand() * count_of_rows);
            
            select adjective into rand_adj from sentence where id  = randomNoun;
            select noun into rand_noun from sentence where id  = randomAdj;
            
            insert into star(name) values( concat(rand_adj,', ',rand_noun) );
            
            -- set rand_adj := "";
            -- set rand_noun := '';
            
            
		end loop;
        
        
    close curl;
    
    

end$$

delimiter ;
call starpop();
drop procedure starpop;
select * from star;
drop table star;

select round(rand()*8);
select * from sentence;
select count(*) into @count_of_rows from sentence;
select @count_of_rows;
/**
3. Modify this procedure so that it create the table with a birth date and death date
column.
 Make the procedure fill in the birth and death dates in the following way.


The birth date should be random between 20 and 80 years ago.

The death date should be random between 19 years after the birth date and today.
**/
delimiter $$

create procedure starpop()
begin
	-- variables
	declare count_of_rows int default 0;
    declare rand_noun varchar(60) default "";
    declare rand_adj varchar(60) default "";
    declare finished bool default false;
    declare randomNoun int default 0;
    declare randomAdj int default 0;
    declare randBirth_date date default null;
    declare randDeath_date date default null;
    
    declare temp_adj varchar(60) default "";
    declare temp_noun varchar(60) default "";
    declare temp_dategen int default 0;
    
    -- cursors
    declare curl cursor for select adjective, noun from sentence;
    
    -- handlers
    declare continue handler for not found set finished:= true;
    
    -- create star table if exists
	drop table if exists star;
    create table star(id int primary key auto_increment, name text not null, birth_date date not null, death_date date not null);
    
    -- select into the count variables the number of rows in the sentence table
    select count(*) into count_of_rows from sentence;
    
    open curl;
    
		rand_loop : loop
        
			fetch curl into temp_adj, temp_noun;
            
			if finished then
				leave rand_loop;
            end if;
            set randomNoun:= round(rand() * count_of_rows);
            set randomAdj:= round(rand() * count_of_rows);
            
            -- testing between 20 and 80 years
            set temp_dategen := floor( rand() * 80);
            
            while temp_dategen < 20 do
				set temp_dategen := floor(rand() * 80);
            end while;
            
            -- The birth date should be random between 20 and 80 years ago.
            set randBirth_date:= date(now()) - interval temp_dategen year;
            
            -- generating The death date should be random between 19 years after the birth date and today.;
            -- The death date should be random between 19 years after the birth date and today
            set randDeath_date:= randBirth_date + interval 19 year;
            set randDeath_date:= randDeath_date + interval ( floor( rand() * (year(now()) -  year(randDeath_date)) ) ) year;
            
            select adjective into rand_adj from sentence where id  = randomNoun;
            select noun into rand_noun from sentence where id  = randomAdj;
            
            insert into star(name, birth_date, death_date) 
				values( concat(rand_adj,', ',rand_noun), randBirth_date, randDeath_date );
            
            -- set rand_adj := "";
            -- set rand_noun := '';
            
            
		end loop;
        
        
    close curl;
    
    

end$$

delimiter ;
call starpop();
drop procedure starpop;
select * from star;
drop table star;

select round(rand()*8);
select * from sentence;
select count(*) into @count_of_rows from sentence;
select @count_of_rows;
select year('1991-09-09') > (date('1991-09-09') + interval (rand() * 19) year) < year(now());
select year('1991-09-09') < year(now());
select year(now()) - year('1991-09-09');
/**
4. Modify this procedure so that the death date is only filled in 40% of the time, at random.

**/
delimiter $$

create procedure starpop()
begin
	-- variables
	declare count_of_rows int default 0;
    declare rand_noun varchar(60) default "";
    declare rand_adj varchar(60) default "";
    declare finished bool default false;
    declare randomNoun int default 0;
    declare randomAdj int default 0;
    declare randBirth_date date default null;
    declare randDeath_date date default null;
    
    declare temp_adj varchar(60) default "";
    declare temp_noun varchar(60) default "";
    declare temp_dategen int default 0;
    
    -- cursors
    declare curl cursor for select adjective, noun from sentence;
    
    -- handlers
    declare continue handler for not found set finished:= true;
    
    -- create star table if exists
	drop table if exists star;
    create table star(id int primary key auto_increment, name text not null, birth_date date not null, death_date date);
    
    -- select into the count variables the number of rows in the sentence table
    select count(*) into count_of_rows from sentence;
    
    open curl;
    
		rand_loop : loop
        
			fetch curl into temp_adj, temp_noun;
            
			if finished then
				leave rand_loop;
            end if;
            set randomNoun:= round(rand() * count_of_rows);
            set randomAdj:= round(rand() * count_of_rows);
            
            -- testing between 20 and 80 years
            set temp_dategen := floor( rand() * 80);
            
            while temp_dategen < 20 do
				set temp_dategen := floor(rand() * 80);
            end while;
            
            -- The birth date should be random between 20 and 80 years ago.
            set randBirth_date:= date(now()) - interval temp_dategen year;
            
            -- generating The death date should be random between 19 years after the birth date and today.;
            -- The death date should be random between 19 years after the birth date and today
            set randDeath_date:= randBirth_date + interval 19 year;
            set randDeath_date:= randDeath_date + interval ( floor( rand() * (year(now()) -  year(randDeath_date)) ) ) year;
            
            select adjective into rand_adj from sentence where id  = randomNoun;
            select noun into rand_noun from sentence where id  = randomAdj;
            
            insert into star(name, birth_date, death_date) 
				values( concat(rand_adj,', ',rand_noun), randBirth_date, if(round(rand()*100)<40, randDeath_date, null) );
            
            -- set rand_adj := "";
            -- set rand_noun := '';
            
            
		end loop;
        
        
    close curl;
    
    

end$$

delimiter ;
call starpop();
drop procedure starpop;
select * from star;
drop table star;

select round(rand()*8);
select * from sentence;
select count(*) into @count_of_rows from sentence;
select @count_of_rows;
select year('1991-09-09') > (date('1991-09-09') + interval (rand() * 19) year) < year(now());
select year('1991-09-09') < year(now());
select year(now()) - year('1991-09-09');
-- Did it without the tips. IT Works but more efficient with the tips