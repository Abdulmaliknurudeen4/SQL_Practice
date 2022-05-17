-- transfrom data
-- get structure
-- create sample test table for data integrity verification
CREATE TABLE `usa_county_wise` (
  `UID` varchar(90) DEFAULT NULL,
  `iso2` varchar(90) DEFAULT NULL,
  `iso3` varchar(90) DEFAULT NULL,
  `code3` varchar(90) DEFAULT NULL,
  `FIPS` varchar(20) DEFAULT NULL,
  `Admin2` varchar(90) DEFAULT NULL,
  `Province_State` varchar(90) DEFAULT NULL,
  `Country_Region` varchar(90) DEFAULT NULL,
  `Lat` varchar(90) DEFAULT NULL,
  `Long_` varchar(90) DEFAULT NULL,
  `Combined_Key` varchar(90) DEFAULT NULL,
  `Date` varchar(90) DEFAULT NULL,
  `Confirmed` int(11) DEFAULT NULL,
  `Deaths` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- load with 1000 sample data
set sql_safe_updates = 0;
delimiter $$

create procedure load_test()
begin

-- Load a thousand test data into test table
-- Variables
  declare uid varchar(90) DEFAULT '';
  declare iso_2 varchar(90) DEFAULT '';
  declare iso_3 varchar(90) DEFAULT '';
  declare code_3 varchar(90) DEFAULT '';
  declare fips varchar(20) DEFAULT '';
  declare admin2 varchar(90) DEFAULT '';
  declare province_state varchar(90) DEFAULT '';
  declare country_region varchar(90) DEFAULT '';
  declare lat varchar(90) DEFAULT '';
  declare long_ varchar(90) DEFAULT '';
  declare combined_key varchar(90) DEFAULT '';
  declare date_ varchar(90) DEFAULT NULL;
  declare confirmed int(11) DEFAULT 0;
  declare deaths int(11) DEFAULT 0;
  declare finished boolean default false;
  
  -- Cursors for table
  declare curl cursor for select UID, iso2, iso3, code3, FIPS, Admin2, Province_State,
  Country_Region, Lat, Long_, Combined_Key, Date, Confirmed, Deaths 
  from usa_county_wise limit 1000;
  
  -- Handler for Cursors
  declare continue handler for not found set finished:= true;
  
  -- Loop and insert
  open curl;
		
        the_loop:loop
			fetch curl into uid, iso_2, iso_3, code_3, fips, admin2, province_state,
            country_region, lat, long_, combined_key, date_, confirmed, deaths;
            
            if finished then
				leave the_loop;
			end if;
            
            insert into usa_county_wise_copy 
            values(uid, iso_2, iso_3, code_3, fips, admin2, province_state, country_region,
            lat, long_, combined_key, date_, confirmed, deaths);
            
		end loop;
        
  close curl;



end$$

delimiter ;
call load_test();
Select * from usa_county_wise_copy;
truncate usa_county_wise_copy;
-- Batch Insert
insert into usa_county_wise_copy select * from usa_county_wise limit 1000;