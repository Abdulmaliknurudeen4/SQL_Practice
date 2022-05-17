 -- get monthly Average for a city for a particular year
 -- get yearly Average for a particular city
 -- count of cities in a country
 -- get monthly Average for a Country in a year
 use dklaf;
 -- get the Average Monthly Temperature in 1997 of A City Called San Jose
 -- Done
 delimiter $$

create procedure getAvgMonth( in cityName varchar(120), in year_char year)

begin

    declare city_name varchar(120) default '';
    declare year_numb year default 1997;
    declare search_string varchar(15);

    set city_name := if(cityName=''OR cityName is null,'Algiers',cityName);
    set year_numb := if( (year_char < 1997) OR ( year_char > year(now())) OR year_char is null, 1997, year_char);
    -- Formulate Search String
    set search_string := concat(year_numb, '-%');
    -- Setting the Select Query;
     select Avg(AvgTemperature) as Temperature, MonthName(recorded_date) as Month from city_temperature
    join city_data ctd on city_id = ctd.id
    WHERE recorded_date LIKE search_string AND ctd.city_name = city_name group by Month;

end$$


 delimiter ;
 call getAvgMonth(null, 2030);
 drop procedure getAvgMonth;

  -- get the Day Temperature in 1997, Januray of A City Called San Jose
  delimiter $$

create procedure getDailyMonth( in cityName varchar(120), in year_char year, in monthName varchar(90) )

begin

    declare city_name varchar(120) default '';
    declare year_numb year default 1997;
    declare month_name varchar(90) default 'January';
    declare month_numb varchar(40) default '';
    declare search_string varchar(15);

    set city_name := if(cityName=''OR cityName is null,'Algiers',cityName);
    set year_numb := if( (year_char < 1997) OR ( year_char > year(now())) OR year_char is null, 1997, year_char);
    set month_name := if(monthName NOT IN( 
                    'January', 'February',
                    'March', 'April', 'May',
                    'June', 'July', 'August',
                    'September', 'October','November',
                    'December') OR monthName is null,

                     'January', monthName);

    set month_numb := if( length(month(str_to_date(month_name,'%M'))) = 1, 
            concat(0, month( str_to_date(month_name,'%M') ) ),
            month( str_to_date( month_name,'%M') ) );

    -- Formulate Search String
    set search_string := concat(year_numb, '-',month_numb, '-%');
    -- Setting the Select Query;
    select AvgTemperature as Temperature, Day(recorded_date) as Day from city_temperature
    join city_data ctd on city_id = ctd.id
    WHERE recorded_date LIKE search_string AND ctd.city_name = city_name group by Day;

end$$


 delimiter ;
 call getDailyMonth('Lagos', 2019, 'March');
 drop procedure getDailyMonth;

 -- getting Average Temperature for the Year of A City lets say San Jose

  delimiter $$

create procedure getYearlyAvg( in cityName varchar(120))

begin

    declare city_name varchar(120) default '';
    declare search_string varchar(15);

    set city_name := if(cityName=''OR cityName is null,'Algiers',cityName);
    -- Setting the Select Query;
    select Avg(AvgTemperature) as Temperature, Year(recorded_date) as Year from city_temperature
    join city_data ctd on city_id = ctd.id
    WHERE ctd.city_name = city_name group by Year Order by Year;

end$$


 delimiter ;
 call getYearlyAvg('Lagos');
 drop procedure getYearlyAvg;

 -- Getting the Number of Cities in a Region

 delimiter $$

create procedure getCities( in regionName varchar(120) )
begin

    if regionName = '' OR regionName is null then
        set regionName:= 'Africa';
    end if;

    select city_name from city_data ctd join country_data cnd on ctd.country_id = cnd.id
    join region_data rgd on cnd.region_id = rgd.id WHERE rgd.region_name = regionName;

end$$
 delimiter ;
 call getCities('North America');
 drop procedure getCities;