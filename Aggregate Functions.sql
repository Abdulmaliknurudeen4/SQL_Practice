select * from survey;
select count(*) from survey;
-- group by
select avg(weight) from survey;
select gender, avg(weight) from survey group by  gender;
select country, avg(smoke) from survey group by country order by smoke;
select country, avg(smoke) from survey group by country order by avg(smoke);

select country, count(*), avg(smoke) from survey group by country order by avg(smoke);
select country, count(*), avg(smoke) from survey where weight > 100 group by country order by avg(smoke);

-- NO Aggregate function in where clauses
select country, count(*), avg(smoke) from survey where avg(smaoke) > 1 group by country order by avg(smoke);
-- Doesn't Work

-- HAVING SQL CLAUSES
-- Order by are allowed to have aggregate functions
select count(*), country, max(weight) from survey group by country order by max(weight) desc;
select country, max(weight) from survey where country like '%u%' group by country order by max(weight) desc;
-- Having lets you do kinda of a where with an aggregate function and is used after the group by
select count(*), country, max(weight) from survey group by country having max(weight> 100) order by max(weight) desc;
select country, avg(age) from survey group by country having avg(age)>30 order by max(weight) desc;

-- SELECT [columns and functions] FROM GROUP BY HAVING ORDER BY