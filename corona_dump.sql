desc usa_county_wise;
desc province_name;
desc province_codes;
select DISTINCT MONTH(DATE) from usa_county_wise;
SELECT SUM(Deaths), SUM(Confirmed) FROM usa_county_wise group by province_id, MONTH(DATE);
SELECT SUM(Deaths), SUM(Confirmed) FROM usa_county_wise group by province_id, MONTH(DATE)
HAVING SUM(Deaths) > SUM(Confirmed);
-- 58 provinces  X the number of months of record (7) = 406 correct
SELECT SUM(USA.Deaths), SUM(USA.Confirmed), PN.province_state, MONTH(USA.DATE)
FROM usa_county_wise USA JOIN province_name PN ON PN.code_id = USA.province_id
group by PN.province_state, MONTH(USA.DATE);
-- Use for Print When Expression
SELECT SUM(USA.Deaths), SUM(USA.Confirmed), PN.province_state
FROM usa_county_wise USA JOIN province_name PN ON PN.code_id = USA.province_id
group by PN.province_state;
-- Using a case to display Month Name
SELECT SUM(Deaths), SUM(Confirmed), province_state 
FROM usa_county_wise JOIN province_name ON code_id = province_id
group by province_state, MONTH(DATE);