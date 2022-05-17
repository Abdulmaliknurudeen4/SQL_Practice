set sql_safe_updates = 0;
-- Data Transformation
-- Use less Cursors as Possible and Using concise Insert Using Select Statements
-- Test Each Inch of the new Procedure

delimiter $$

create procedure transform_data()
begin

    /**
    00. Transform and modify the date column and then the date data
    01. Create Table province_codes
    02. Records the distinct iso2, iso3, code3 in a new table of province codes
    03. drop the iso2, iso3 column only
    04. add index code3_index to the code3 column to make the search faster
    05. create Table province_name that references the province_code
    06. insert into province_name distinct Province_State and the code_id ( that is the id from the province_code table that has the Province_state code 3 value)
    07. remove the index on the code3 column and drop code3 column
    08. add an index to the Province_State column pro_index
    09. add a column to the base table province_id references the province_name table id
    10. now insert appropriate province ids for all provinces.
    11. remove index on Province_State( pro_index ) and drop the column
    12. End procedure, test using the test table
    **/

    -- 00 Transform Date column
    begin
        update usa_county_wise set Date = concat(Date, '20');
        update usa_county_wise set Date = str_to_date(Date, '%m/%d/%Y');
        alter table usa_county_wise modify Date date not null;
    end;

    -- 01 Province codes
    begin

        -- Create province_codes Table and Insert data
        create table province_codes(id int primary key auto_increment, iso2 varchar(10) not null, iso3 varchar(10) not null, code3 INT NOT NULL);
        insert into province_codes(iso2, iso3, code3) select distinct iso2, iso3, code3 from usa_county_wise;

        -- Drop the columns iso2, iso3 only, and index to code 3 to make search faster
        alter table usa_county_wise drop column iso2;
        alter table usa_county_wise drop column iso3;
        create index code3_index on usa_county_wise(code3);


    end;

    -- 02 Province Name, Works
    begin

        -- Create Table
        create table province_name(id int primary key auto_increment, province_state varchar(90) not null, code_id int not null, 
                foreign key (code_id) references province_codes(id) );
        
        -- insert data, Province and Corresponding code id;
        insert into province_name(province_state, code_id) 
            select distinct USACOPY.Province_State, CODES.id from dataset_corona.usa_county_wise USACOPY join province_codes CODES ON 
                USACOPY.code3 = CODES.code3;
        -- drop index and column
        alter table usa_county_wise drop index code3_index;
        alter table usa_county_wise drop column code3;


    end;

    -- 03 Base Table Altering
    begin

        -- Variables
        declare provinceName varchar(90) default '';
        declare provinceId int default 0;
        declare finished boolean default false;

        -- Cursors
        declare curl cursor for select id, province_state from province_name;

        -- Handlers
        declare continue handler for not found set finished:= true;

        -- add a column to the base table province_id references the province_name table id AND INSERT ALL APPROPRIATE PROVINCEID
        -- ADD INDEX ON PROVINCE STATE
        create index province_index on usa_county_wise(Province_State);
        alter table usa_county_wise add column province_id int;
        alter table usa_county_wise add constraint province_fk_id foreign key (province_id) references province_name(id);

        -- insert appropriate data and set the province_id to not null

        open curl;

            the_loop: loop
                fetch curl into provinceId, provinceName;

                if finished then
                    leave the_loop;
                end if;

                update usa_county_wise set province_id = provinceId 
                    where Province_State = provinceName;

            end loop;
        
        close curl;

        -- Drop indices and columns that are useless
        alter table usa_county_wise drop index province_index;
        alter table usa_county_wise drop column Province_State;

        alter table usa_county_wise add column id int primary key auto_increment;
        alter table usa_county_wise drop column Country_Region;
        alter table usa_county_wise drop column UID;
        
        -- Add index Useful for Search 
        create index province_index on province_name(province_state);
        create index case_date on usa_county_wise(Date);

    end;

end$$

delimiter ;
call transform_data();
drop procedure transform_data;