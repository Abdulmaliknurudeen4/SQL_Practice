SELECT * FROM dataset_corona.usa_county_wise;
SELECT DISTINCT Province_State from dataset_corona.usa_county_wise;
SELECT DISTINCT count(Combined_Key) from dataset_corona.usa_county_wise;
SELECT DISTINCT code3 from dataset_corona.usa_county_wise;
SELECT DISTINCT iso2 from dataset_corona.usa_county_wise;
SELECT DISTINCT iso3 from dataset_corona.usa_county_wise;
SELECT DISTINCT count(Admin2) from dataset_corona.usa_county_wise;
SELECT DISTINCT count(UID) from dataset_corona.usa_county_wise;
SELECT count(*) from dataset_corona.usa_county_wise;
SELECT DISTINCT Province_State, code3 from dataset_corona.usa_county_wise;
SELECT DISTINCT iso2, iso3, code3 FROM usa_county_wise;
SELECT DISTINCT Province_State, code3 from dataset_corona.usa_county_wise;


--
SELECT DISTINCT iso2, iso3, code3 from usa_county_wise;
SELECT DISTINCT Province_State, iso2, iso3, code3 from usa_county_wise;

use dataset_corona;