set sql_safe_updates = 0;
-- Declaring Change Data Pattern Procedure
-- Use less Cursors as Possible and Using the 'insert using select' Statement. And Using Least Possible Functions Replacing with indexes
-- Test Each Inch of the new Procedure
delimiter $$

create procedure change_pattern()
begin

    /**
    01. Creates Table region_data;
    02. Records the distinct region in a new table of region_data;
    04. alters the table city_temperature and adds column region_id which is foreign key that references the id of the region_data(id)
    05. Create a function that gets the id of a region by it's name
    06. Scans through the whole city_temperature and insert the region_id using the region name (Use the custom function get_region_id(name)) or updates(batch)
    07. Drops the Region Column
    08. Modifies the region id so that it's not null
    09. This Step of the Data Transformation Works
    10. First Step Works
    11. Don't Forget To Drop the indexs of the region_name
    **/

    begin

        -- Variables
        declare RegionName varchar(120) default '';
        declare RegionId int default 0;
        declare finished boolean default false;

        -- Cursors
        declare curl cursor for select id, region_name from region_data;

        -- Handlers
        declare continue handler for not found set finished:= true;

        -- Create Table Region Data and put index on the region to make query faster and then drop later at the end of all the steps begin and end
        -- index Available : idx_region_name;
        create table region_data(id int primary key auto_increment, region_name varchar(90) not null);

        -- Insert Distinct Region into region Data
        insert into region_data(region_name) select distinct Region from city_temperature;

        create index idx_region_name on region_data(region_name);

        -- Altering Table city_temperature and add a column foreign key
        alter table city_temperature add column region_id int;
        alter table city_temperature add constraint fk_region_data foreign key (region_id) references region_data(id);

        -- Open the Cursor and for Each Loop. Update the city_temperature where Region = Region selected from cursor set the 
        -- id equals the id selected from the cursor

        open curl;

            the_loop: loop
                fetch curl into RegionId, RegionName;

                if finished then
                    leave the_loop;
                end if;

                update city_temperature set region_id = RegionId where Region = RegionName;

            end loop;

        close curl;

        -- delete the index on the Region Column and then it self
        alter table city_temperature drop index temp_region;
        alter table city_temperature drop column Region;
        alter table city_temperature modify column region_id int not null;

    end;

     /**
    01.Creates table country_data which has a foreign key on the region
    02.Create a function that can get the region(region_id) a country belong to.
    02a.alters the table city_temperature and adds column country_id which is foreign key that references the id of the country_id(id)
    03.Select all distinct country from the city_temperature
    04. Insert into the country_data the country name and the region_id
    05. Drop the Country Column(before that drop the temp_country index)
    06. Scans through the whole city_temperature and insert the country_id using the Country name (Use the custom function get_countryFor_id(name)) or updates(batch)
    07. It's Working
    **/
    begin

        -- Variables
        declare CountryName varchar(120) default '';
        declare CountryId int default 0;
        declare finished boolean default false;

        -- Cursors
        declare curl cursor for select id, country_name from country_data;

        -- Handlers
        declare continue handler for not found set finished:= true;

        -- Create the tables
        -- Index Availabe: idx_country_name
        create table country_data(id int primary key auto_increment, country_name varchar(120) not null, 
                    region_id int not null, foreign key (region_id) references region_data(id) );


        -- insert into  country and their region id
        insert into country_data(country_name, region_id) select distinct Country, region_id from city_temperature;

        create index idx_country_name on country_data(country_name);

        -- Altering Table city_temperature and add a column foreign key to country data
        alter table city_temperature add column country_id int;
        alter table city_temperature add constraint fk_country_data foreign key (country_id) references country_data(id);

        -- Update the city_temperature and add country_id for each Country the Drop the Country Column and it's index. Batch Updates
        -- Open the Cursor and for Each Loop. Update the city_temperature where Country = Country selected from cursor set the 
        -- id equals the id selected from the cursor

        open curl;

            the_loop: loop
                fetch curl into CountryId, CountryName;

                if finished then
                    leave the_loop;
                end if;

                update city_temperature set country_id = CountryId where Country = CountryName;

            end loop;

        close curl;

        -- Drop the index on the country Column
        alter table city_temperature drop index temp_country;
        alter table city_temperature drop column Country;
        alter table city_temperature modify column country_id int not null;

    end;


    /**
    01. Create table city_data which has a foreign key on the country_id
    02. Create a function that gets the country a city belongs to and return it's id
    03. Select all Distinct City from the city_temperature table
    04. insert into city_data the city values and the corresponding country_id(Foreign Key);
    05. alters the table city_temperature and adds column city_id which is foreign key that references the id of the city_id(id)
    06. Scans through the whole city_temperature and insert the city_id using the city name (Use the custom function get_city_id(name)) or updates(batch)
    07. Drop Region(before dropping the column, temp_city index) and Country Foreign keys and Drop also the Columns leaving the City_id only
    **/

    begin

        -- Variables
        declare cityName varchar(120) default '';
        declare cityId int default 0;
        declare finished boolean default false;

        -- Cursors
        declare curl cursor for select distinct city_name, id from city_data;

        -- Handler for Cursor
        declare continue handler for not found set finished:= true; 

        create table city_data(id int primary key auto_increment, city_name varchar(120), country_id int not null, 
                    foreign key (country_id) references country_data(id));

        insert into city_data(city_name, country_id) select distinct City, country_id from city_temperature;

        -- Index Availabe: idx_city_name
        create index idx_city_name on city_data(city_name);

        -- Altering Table city_temperature and add a column foreign key to city_data
        alter table city_temperature add column city_id int;
        -- Do not Drop the city_id in the city_temperature cause it's the basis of all tying in the database
        alter table city_temperature add constraint fk_city_data foreign key (city_id) references city_data(id);

        open curl;

            the_loop: loop
                fetch curl into cityName, cityId;

                if finished then
                    leave the_loop;
                end if;

                update city_temperature set city_id = cityId where City = cityName;

            end loop;

        close curl;

        -- Drop the index on the city
        alter table city_temperature drop index temp_city;
        alter table city_temperature drop column City;
        alter table city_temperature modify column city_id int not null;

        -- Drop Useless Foreign keys and Columns
        alter table city_temperature drop foreign key fk_region_data;
        alter table city_temperature drop foreign key fk_country_data;

        alter table city_temperature drop column region_id;
        alter table city_temperature drop column country_id;

        -- Personally Think indexes on the region name city name and country name will speed up search when using joins

    end;

end$$


delimiter ;
call change_pattern();
drop procedure change_pattern;