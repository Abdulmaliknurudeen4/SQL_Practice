create database dataset_city_temperature;
use dataset_city_temperature;
create table city_data(id int primary key auto_increment, Region varchar(60), 
Country varchar(60), state varchar(60), month_m varchar(3), day_m varchar(3), year_m year
, AvgTemp decimal(6,2));
desc city_data;
select * from city_temperature;
show tables;
desc city_data;
drop table city_data;

use test;
show tables;
select * from del_dates;
select id, applied, birthdate_calc(applied) from del_dates;