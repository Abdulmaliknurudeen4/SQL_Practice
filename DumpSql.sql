select * from city_test limit 90,100;
desc city_test;
alter table city_test modify column region_id int not null;
select * from region_data;
alter table city_test drop column State;
update city_test set AvgTemperature = 64.80 where id = 1;
select * from city_temperature limit 0,1;
alter table city_test drop column region_id;
alter table city_test drop foreign key fk_region_data;
select region_id from city_test where Country = 'Bangladesh' limit 0,1;
select * from region_data;
select * from country_data;
select * from city_data;
desc country_data;
desc region_data;
desc city_test;
select * from city_test;
select distinct Country from city_test;

create table country_data(id int primary key auto_increment, country_name varchar(90) not null, 
                    region_id int not null, foreign key (region_id) references city_temperature(id) );
drop table country_data;

-- Test Sql Queries for The City Temperature Database;

select if(
     length(month(str_to_date('December','%M')) = 1,
      concat(0,month(str_to_date('December','%M'))),
       month(str_to_date('December','%M')) ) );

select if(
    length(month(str_to_date('December','%M'))) = 1,
    'Power',
    'Love'
);

select if(
    length(month(str_to_date('December','%M'))) = 1,
    'Power',
    'Love'
);

select if(
    length(month(str_to_date('January','%M'))) = 1,
    concat(0,month(str_to_date('January','%M'))),
    month(str_to_date('January','%M'))
);
-- Squ
select kelvin(AvgTemperature) as '*K(Temperature)', recorded_date, city_name, country_name, region_name
from city_temperature join city_data ctd on city_id = ctd.id
 join country_data cnd on cnd.id=ctd.country_id
 join region_data rgd on cnd.region_id = rgd.id;

 select kelvin(AvgTemperature) as '*K(Temperature)', recorded_date, city_name, country_name, region_name
from city_temperature join city_data ctd on city_id = ctd.id
 join country_data cnd on cnd.id=ctd.country_id
 join region_data rgd on cnd.region_id = rgd.id WHERE recorded_date LIKE '2001-%' AND ctd.city_name = 'San Jose';

  select AvgTemperature, recorded_date, city_name, country_name, region_name, MonthName(recorded_date) as Month
from city_temperature join city_data ctd on city_id = ctd.id
 join country_data cnd on cnd.id=ctd.country_id
 join region_data rgd on cnd.region_id = rgd.id WHERE recorded_date LIKE '2001-%' AND ctd.city_name = 'San Jose';
-- query Match Expectations: Year and City
  select Avg(AvgTemperature) as Temperature, city_name, country_name,
   region_name, MonthName(recorded_date) as Month from city_temperature
    join city_data ctd on city_id = ctd.id
    join country_data cnd on cnd.id=ctd.country_id
    join region_data rgd on cnd.region_id = rgd.id 
    WHERE recorded_date LIKE '2019-%' AND ctd.city_name = 'San Jose' group by Month;
-- Other Queries: City Result Grouped by Year
select Avg(AvgTemperature) as Temperature, city_name, country_name,
   region_name, Year(recorded_date) as Year from city_temperature
    join city_data ctd on city_id = ctd.id
    join country_data cnd on cnd.id=ctd.country_id
    join region_data rgd on cnd.region_id = rgd.id 
    WHERE ctd.city_name = 'Lagos' group by Year;

-- other queries: Year, Month And City grouped by Day
select AvgTemperature as Temperature, city_name, country_name,
   region_name, Day(recorded_date) as Day from city_temperature
    join city_data ctd on city_id = ctd.id
    join country_data cnd on cnd.id=ctd.country_id
    join region_data rgd on cnd.region_id = rgd.id 
    WHERE recorded_date LIKE '2019-03-%' AND ctd.city_name = 'Lagos' group by Day;
    use ddk;