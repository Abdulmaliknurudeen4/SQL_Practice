set sql_safe_updates = 0;
-- Declaring Change Data Pattern Procedure.
delimiter $$


create procedure change_pattern()

begin

    /**
    01. Creates Table region_data;
    02. Records the distinct region in a new table of region_data;
    04. alters the table city_test and adds column region_id which is foreign key that references the id of the region_data(id)
    05. Create a function that gets the id of a region by it's name
    06. Scans through the whole city_test and insert the region_id using the region name (Use the custom function get_region_id(name)) or updates(batch)
    07. Drops the Region Column
    08. Modifies the region id so that it's not null
    09. This Step of the Data Transformation Works
    **/
    begin

        -- declare variables for the Region Section
        declare RegionName varchar(90) default '';
        declare finished boolean default false;
        
        -- Cursors
        declare curl cursor for select distinct Region from city_test;

        -- Handlers
        declare continue handler for not found set finished:= true;

        -- Creates Table Region_data
        create table region_data(id int primary key auto_increment, region_name varchar(90) not null);

        -- Loop Through Cursor and insert Values
        open curl;

            the_loop: loop

            fetch curl into RegionName;

            if finished then
                leave the_loop;
            end if;

            -- Perform insert
            insert into region_data(region_name) values(RegionName);

            end loop;

        close curl;

        -- Altering Table city_test and add a column foreign key
        alter table city_test add column region_id int;
        alter table city_test add constraint fk_region_data foreign key (region_id) references region_data(id);

        -- Update the city_test and add region_id for each Region then Drop the Region Column. Batch Updates
        update city_test set region_id = get_region_id(Region);
        alter table city_test drop column Region;
        alter table city_test modify column region_id int not null;


    end;



    /**
    01.Creates table country_data which has a foreign key on the region
    02.Create a function that can get the region(region_id) a country belong to.
    02a.alters the table city_test and adds column country_id which is foreign key that references the id of the country_id(id)
    03.Select all distinct country from the city_test
    04. Insert into the country_data the country name and the region_id
    05. Drop the Country Column
    06. Scans through the whole city_test and insert the country_id using the Country name (Use the custom function get_countryFor_id(name)) or updates(batch)
    **/
    begin

        -- Variables
        declare CountryName varchar(90) default '';
        declare finished boolean default false;

        -- Cursor
        declare curl cursor for select distinct Country from city_test;

        -- Handlers
        declare continue handler for not found set finished:= true;

        create table country_data(id int primary key auto_increment, country_name varchar(120) not null, 
                    region_id int not null, foreign key (region_id) references region_data(id) );


        open curl;

            the_loop: loop

                fetch curl into CountryName;

                if finished then
                    leave the_loop;
                end if;

                -- Perform insert and use function
                insert into country_data(country_name, region_id) 
                    values( CountryName, get_region_idForCountry(CountryName) );

            end loop;

        close curl;

        -- Altering Table city_test and add a column foreign key to country data
        alter table city_test add column country_id int;
        alter table city_test add constraint fk_country_data foreign key (country_id) references country_data(id);

        -- Update the city_test and add country_id for each Country then Drop the Country Column. Batch Updates
        update city_test set country_id = get_country_id(Country);
        alter table city_test drop column Country;
        alter table city_test modify column country_id int not null;


    end;


    /**
    01. Create table city_data which has a foreign key on the country_id
    02. Create a function that gets the country a city belongs to and return it's id
    03. Select all Distinct City from the city_test table
    04. insert into city_data the city values and the corresponding country_id(Foreign Key);
    05. alters the table city_test and adds column city_id which is foreign key that references the id of the city_id(id)
    06. Scans through the whole city_test and insert the city_id using the city name (Use the custom function get_city_id(name)) or updates(batch)
    07. Drop Region and Country Foreign keys and Drop also the Columns leaving the City_id only
    **/
    begin

        -- Variables
        declare cityName varchar(120) default '';
        declare finished boolean default false;

        -- Cursors
        declare curl cursor for select distinct city from city_test;

        -- Handler for Cursor
        declare continue handler for not found set finished:= true; 

        -- Create the City_data Table
        create table city_data(id int primary key auto_increment, city_name varchar(120), country_id int not null, 
                    foreign key (country_id) references country_data(id));

        open curl;

            the_loop: loop

                fetch curl into cityName;
                
                if finished then
                    leave the_loop;
                end if;

                -- insert values
                insert into city_data(city_name, country_id) 
                        values( cityName, get_coutry_idForCity(cityName) );


            end loop;

        close curl;

        -- Altering Table city_test and add a column foreign key to city_data
        alter table city_test add column city_id int;
        alter table city_test add constraint fk_city_data foreign key (city_id) references city_data(id);

        -- Update the city_test and add city_id for each City then Drop the City Column. Batch Updates
        update city_test set city_id = get_city_id(City);
        alter table city_test drop column City;
        alter table city_test modify column city_id int not null;

        -- Drop Useless Foreign keys and Columns
        alter table city_test drop foreign key fk_region_data;
        alter table city_test drop foreign key fk_country_data;

        alter table city_test drop column region_id;
        alter table city_test drop column country_id;

        -- End of Transformation
        

    end;

end$$


delimiter ;
call change_pattern();
drop procedure change_pattern;

drop table region_data;
drop table country_data;
drop table city_data;

-- Custom Functiosn
-- 01. get_region_id(regionName)
-- Serves
delimiter $$

create function get_region_id( regionName varchar(90) )
RETURNS INT
DETERMINISTIC
begin

    declare region_id int default 0;
    select id into region_id from region_data where region_name = regionName;

    return (region_id);


end$$

delimiter ;
drop function get_region_id;
show function status where db = 'dataset_city_temperature';
-- 02. get_region_idForCountry(countryName)
-- Serves
delimiter $$

create function get_region_idForCountry( countryName varchar(90) )
RETURNS INT
DETERMINISTIC

begin

    declare regionID int default 0;
    select region_id into regionID from city_test where Country = countryName limit 0,1;

    return (regionID);

end$$

delimiter ;
drop function get_region_idForCountry;
show function status where db = 'dataset_city_temperature';
-- 03. get_country_id(CountryName)
-- Serves
delimiter $$

create function get_country_id( countryName varchar(90) )
RETURNS INT
DETERMINISTIC
begin

    declare country_id int default 0;
    select id into country_id from country_data where country_name = countryName;

    return (country_id);


end$$

delimiter ;
drop function get_country_id;
show function status where db = 'dataset_city_temperature';

-- 04. get_coutry_idForCity(CityName)
-- Not Tested
delimiter $$

create function get_coutry_idForCity( cityName varchar(90) )
RETURNS INT
DETERMINISTIC
begin

    declare countryID int default 0;
    select country_id into countryID from city_test where city = cityName limit 0,1;

    return (countryID);


end$$

delimiter ;
drop function get_coutry_idForCity;
show function status where db = 'dataset_city_temperature';

-- 05. get_city_id(CityName)
-- Not Tested
delimiter $$

create function get_city_id( cityName varchar(90) )
RETURNS INT
DETERMINISTIC
begin

    declare cityID int default 0;
    select id into cityID from city_data where city_name = cityName;

    return (cityID);


end$$

delimiter ;
drop function get_city_id;
show function status where db = 'dataset_city_temperature';



-- List of foreign Keys on city_test: fk_region_data, fk_country_data
-- Lis of column to be drop at the end : region_id, country_id