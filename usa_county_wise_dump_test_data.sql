alter table usa_county_wise_copy add constraint pri_ke primary key(UID);
desc usa_county_wise_copy;
select * from usa_county_wise_copy;
select * from usa_county_wise where UID = 16;
select * from province_codes;
select * from province_name;
set sql_safe_updates = 0;
update usa_county_wise_copy set Date = concat(Date, '20');
update usa_county_wise_copy set Date = str_to_date(Date, '%m/%d/%Y');
alter table usa_county_wise_copy modify Date date not null;
desc usa_county_wise_copy;
drop table usa_county_wise_copy;
drop table province_codes;
drop table province_name;



-- Tests
select * from province_codes;
desc province_codes;
desc usa_county_wise_copy;
desc province_name;