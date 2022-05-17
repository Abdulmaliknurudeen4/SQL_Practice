-- 02. exercise solutions
create table stars(id int primary key auto_increment, name varchar(90) not null);
delimiter $$

create procedure create_stars()
begin

	declare the_noun varchar(20);
    declare the_adjective varchar(20);
    
    declare finished boolean default false;
    
    declare nouns_cursor cursor for select noun from sentence order by rand();
    declare adjectives_cursor cursor for select adjective from sentence order by rand();
    
    declare continue handler for not found set finished:= true;
    
    open nouns_cursor;
    open adjectives_cursor;
    
    the_loop: loop
		
        fetch nouns_cursor into the_noun;
        fetch adjectives_cursor into the_adjective;
        
        if finished then
			leave the_loop;
		end if;
        
        -- Upperccase the first letters
        set the_adjective = concat( ucase( left(the_adjective,1) ), substr( the_adjective, 2 ) );
        set the_noun = concat( ucase( left(the_noun,1) ), substr( the_noun, 2 ) );
        
        insert into stars(name) values(concat(the_adjective, ', ', thenoun));
        
	end loop;
    
    close nouns_cursor;
    close adjectives_cursor;
    
end$$

delimiter ;
drop procedure create_stars;
call create_stars();
select * from stars;
drop table stars;

-- 3 and 4 answer
alter table stars add column born date;
alter table stars add column died date;

delimiter $$

create procedure create_stars_with_date()
not deterministic
begin

	declare the_noun varchar(20);
    declare the_adjective varchar(20);
    declare born_date date;
    declare died_date date;
    declare min_died date;
    declare max_died date;
    declare days_lifespan int;
    
    declare finished boolean default false;
    
    declare nouns_cursor cursor for select noun from sentence order by rand();
    declare adjectives_cursor cursor for select adjective from sentence order by rand();
    
    declare continue handler for not found set finished := true;
    
    open nouns_cursor;
    open adjectives_cursor;
    
    the_loop: loop
		
        fetch nouns_cursor into the_noun;
        fetch adjectives_cursor into the_adjective;
        
        if finished then
			leave the_loop;
		end if;
        
		set the_adjective = concat( ucase( left(the_adjective,1) ), substr( the_adjective, 2 ) );
        set the_noun = concat( ucase( left(the_noun,1) ), substr( the_noun, 2 ) );
        
        -- Figure out birthdate at least 20 years ago . and not more than 60 years before;
        select date(now()) - interval 20 year - interval 365*60*rand() day into born_date;
        
        -- When was the earliest they could have died ? At least 19 years afther being born
        select born_date + interval 19 year into min_died;
        set died_date:=null;
        
        if rand() <=0.4 then
			-- when was the latest they could have died ? (today)
            select date(now()) into max_died;
            -- calculate  a random fraction of the interval beteeen the birthdate
            -- and maximum death_date
            select datediff(max_died, min_died) * rand() into days_lifespan;
            
            -- Add this number of days to when tey were born to get the deat date.
            select born_date + interval 19 year + interval days_lifespan day into died_date;
		end if;
        
        insert into stars(name, born, died) values(concat(the_adjective, ', ', the_noun), born_date,died_date);
        
	end loop;
    
    close nouns_cursor;
    close adjectives_cursor;
end$$

delimiter ;
delete from stars;
call create_stars_with_date();
drop procedure create_stars_with_dates;
        
        

end$$