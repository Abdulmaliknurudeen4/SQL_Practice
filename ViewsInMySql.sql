-- Views
show tables;
desc person;
select * from person;
-- Views are like a temp tables
create view bookview  as select name, email from person;
show tables;
show full tables;
select * from bookview;
insert into bookview(name , email) values('Nafi','Sat');
desc person;
select * from address;
drop view bookview;
create view address_view as select address from address;
select * from address_view;
select * from address;
insert into address_view(address) values('MEME NODDLES');
-- Views are not always updatable
drop view address_view;
show tables;
-- No indices in a view
-- Two basic view algorithm
use health;
show tables;
select * from survey;
desc survey;
desc fat;
select * from survey sr join fat ft on sr.fat=ft.id;
create view survery_fat1 as select sr.id as Customer_id, ft.question as Data from survey sr join fat ft on sr.fat=ft.id;
select * from survery_fat1;
-- First Way. Most Efficient Way of Creating Views and it's non-updatable
create algorithm=merge view survery_fat2 as select sr.id as Customer_id, ft.question as Data from survey sr join fat ft on sr.fat=ft.id;

-- Second Way
create algorithm=temptable view survery_fat3 as select sr.id as Customer_id, ft.question as Data from survey sr join fat ft on sr.fat=ft.id;
-- Less efficient because it creates a temporary table so you're not able to update it naturally
-- The merge algorith can't handle aggregate functions that are temporary or even group by clauses
create algorithm=merge view survery_fat4 as select count(*),sr.id as Customer_id, ft.question as Data from survey sr join fat ft on sr.fat=ft.id;

-- create using default, mysql checks the most compatable options to use
create algorithm=undefined view survery_fat5 as select count(*),sr.id as Customer_id, ft.question as Data from survey sr join fat ft on sr.fat=ft.id;

-- temptable, merge and undefined

-- WITH CHECK OPTIONS of VIEWS
show tables;
select * from survey where id < 20;
create view survey_view77 as select * from survey where id < 20;
select * from survey_view77;
drop view survey_view77;
show tables;
create view survey_view77 as select * from fat where id < 20;
select * from survey_view77;
insert into survey_view78(question) values('meme');
select * from fat;
-- Check makes sure that updatable views aren't inconsistent or that wouldn't show up in the view
create view survey_view78 as select * from fat where id < 20 with check option;
insert into survey_view78(id,question) values(21,'meme');
show tables;

-- drops
drop view survery_fat1, survery_fat2, survery_fat3, survery_fat4, survery_fat5, survey_view77, survey_view78;
show tables;




