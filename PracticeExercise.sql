select distinct region, country from city_temperature where state !='';
select distinct region from city_temperature;
select distinct country from city_temperature;
select count(distinct region) from city_temperature;
select distinct region from city_temperature;
select count(distinct country) from city_temperature;
select * from city_test;
-- create test table with test data so as to test each statement
desc city_temperature;
create table city_test(Region varchar(120), Country varchar(120), city varchar(120),
		AvgTemperature double(8,2), record_date date);
alter table city_test add index temp_region(Region), 
add index temp_city(city),add index temp_country(country);
-- Adding Index To Make Search Faster
alter table city_temperature add index temp_date(recorded_date);

alter table city_test add index temp_city(city);
alter table city_test add index temp_country(country);
        
create table city_temperature(Region varchar(120), Country varchar(120), State varchar(120)
, City varchar(120), Month text, Day text, Year text, AvgTemperature double(8,2));
        
drop table city_test;
show tables;

 set session transaction isolation level read uncommitted;
delimiter $$

create procedure test_data()
begin

    declare m_Region text;
    declare m_Country text;
    declare m_City text;
    declare m_AvgTemp double(9,2);
    declare m_record_date date;

    declare finished boolean default false;

    declare curl cursor for select Region, Country,
    City, AvgTemperature, record_date from
          city_temperature where Region = 'Asia' limit 0, 50;

    declare continue handler for not found set finished:= true;


    open curl;

        the_loop: loop
            fetch curl into m_Region, m_Country, m_City, m_AvgTemp, m_record_date;

            if finished then
                leave the_loop;
            end if;

            insert into city_test(Region, Country, city, AvgTemperature, record_date)
                values(m_Region, m_Country, m_City, m_AvgTemp, m_record_date);

        end loop;

    close curl;


end$$

delimiter ;
drop procedure test_data;
call test_data();
select * from city_test;
select distinct Country from city_temperature;
select City, Region from city_temperature where State = '';
select distinct Country from city_temperature where Region = 'Africa' limit 0,50;
select Region, Country, State,
			City, AvgTemperature, record_date from city_temperature where Region = 'Asia' limit 0, 50;
		select * from city_temperature where State != '' limit 0,2;

delimiter $$

create procedure testme()
begin

    begin
        select 'Hello';
    end;

    begin
        select 'World';
    end;

end$$

delimiter ;
call testme();
drop procedure testme;

set sql_safe_updates = 0;
SELECT * FROM dataset_city_temperature.city_temperature;
alter table city_temperature add column Region text;
update city_temperature set Region = 'Africa' where Region = 'Unknown';
update city_temperature set Region = 'Asia' where Country = 'China' OR 'Hong Kong' OR 'India'
			OR 'Indonesia' OR 'Japan';
alter table city_temperature drop foreign key fk_region_data;
update city_temperature set Region = 'Asia' where Country = 'Japan';
desc city_temperature;
-- Documenting how to connect to import large dataset
-- I have saved it in the mysql document folder
set GLOBAL Local_infile = 1;
LOAD DATA LOCAL INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\putyoufileinthisdir' 
INTO TABLE table_name
fields terminated by','
lines terminated by'\n';
select * from city_temperature limit 0,3;
delete from city_temperature where Region = 'Region';
alter table city_temperature drop column State;
alter table city_temperature add index temp_region(Region);
alter table city_temperature add index temp_city(city);
alter table city_temperature add index temp_country(country);
select * from city_temperature where city = 'Lagos' limit 0,10;
alter table city_temperature add recorded_date date;
update city_temperature set recorded_date = str_to_date(concat(Year,'-',Month,'-',Day),'%Y-%m-%d');
alter table city_temperature drop column Year, drop column Month, drop column Day;
desc city_test;
desc city_temperature;
insert into city_test(Region, Country, city, AvgTemperature, record_date) 
	SELECT Region, Country, city as hj, AvgTemperature as h, recorded_date as ss
		from city_temperature limit 1000000,1000000;

truncate city_test;
drop table city_test;
select * from city_test;
select * from city_data where city_name LIKE 'San %';
alter table city_test CHANGE COLUMN record_date recorded_date date;
select * from city_temperature where recorded_date LIKE '2001-06-%' AND city_id = 303;

alter table city_test add index temp_country(country);
alter table city_test add index temp_date(recorded_date);
use dataset;