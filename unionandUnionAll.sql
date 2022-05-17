select * from person where id < 2 union select * from person where id >=2;
select * from person where id <= 2 union all select * from person where id >=2;
select * from person where id <= 6 union select * from person where id >=6;

-- can be use in outer joins

select * from person p right join address a on a.id = p.address_id;
select * from person p left join address a on a.id = p.address_id;

-- full outer join containing null from both the two table 

select * from person p right join address a on a.id = p.address_id union 
select * from person p left join address a on a.id = p.address_id;

select * from person p right join address a on a.id = p.address_id union all
select * from person p left join address a on a.id = p.address_id;

select * from person p right join address a on a.id = p.address_id union 
select * from person p left join address a on a.id = p.address_id;

-- union for full outer joins

select * from person p right join address a on a.id = p.address_id where p.address_id is null
 union all
select * from person p left join address a on a.id = p.address_id;

select * from person p right join address a on a.id = p.address_id
 union
select * from person p left join address a on a.id = p.address_id;

-- Subqueries and Combining Queries

select * from person where id in (2,3,5);
select * from person where id in ( select id from person where id > 2 );
-- not ver efficient and occassionaly useful
-- Inline Views as Subqueries

use health;
show tables;
select * from survey;
select count(*) as respondent, country from survey group by country;
-- select and give the table a name. It is inefficient
select avg(respondent) from (select count(*) as respondent, country from survey group by country) as totals;
-- But practice

select * from (select count(*) as respondent, country from survey group by country) as a where country like 'A%';
