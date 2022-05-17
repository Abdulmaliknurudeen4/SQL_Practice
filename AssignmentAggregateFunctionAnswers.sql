-- Answer using only one SQL query for each question.

--
-- 1. Find out the average weight for each country.
--
select avg(weight), country from survey group by country;
-- Correct
--
-- 2. Create a list of the number of respondents from each country. Order the list by the number of respondents. 
--     Show only those countries where the number of respondents was greater than 3.
--
select count(*) , country from survey group by country having (count(*)>3) order by count(*) asc;
-- Correct
--
-- 3. Display the average height for each country. Show also the number of respondents for each country and order the list by average height.
-- 
select count(*), avg(height), country from survey group by country order by avg(height);
-- Correct

--
-- 4. For each country, find the average weight of both men and women in that country, and the number of respondents in each gender-country category. 
-- Display only those categories containing more than two respondents. Order the results by country.
-- 
select avg(weight), country, count(*) from survey group by gender,country having count(*)>2 order by country;
-- Wrong
-- Correction
select avg(weight), country, count(*) , gender from survey group by gender, country having count(*) > 2 order by country;
-- 
-- 5. For each of the possible four answers to the exercise question, display the average health score for the respondents in that group. Order from poor health to good health.
-- Is there any relationship between reported amount of exercise and reported state of health? If so, why?
--
select avg(health),exercise,health from survey group by exercise order by health asc;
-- Correct but overzelous
