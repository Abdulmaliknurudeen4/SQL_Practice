/**1. Using any table, write a query that produces the following output, querying the number of rows in the table.

'Total: 5 records'

Modify the query so that it only adds the "s" to "records" if there is some number of records other than 
1. For example:

'Total: 0 records'
'Total: 5 records'
'Total: 1 record'
**/
-- 01. Counts Table
use test;
show tables;
select concat(cast(count(*) as char), ' Records') from books;
select concat(cast(count(*) as char),' ', if(count(*)=1,'Record','Records')) from books;
select concat(cast(count(*) as char),' ', if(count(*)=1,'Record','Records'));
select concat("Total: ", cast(count(*) as char), " record", if(count(*) != 1, "s", "")) from books;

/**2. Using a table with a date column, format the dates in this format:

'31st of January, 2015 (Saturday)'

Set a variable to the value of one of the dates retrieved from this table, in this format.

Now format the date contained in the variable back into a date object.**/
create table del_dates(id int primary key auto_increment, applied date);
insert into del_dates(applied) values(curdate()+ interval 3 month), (curdate() + interval 1 month);
select * from del_dates;
select id, str_to_date(applied, '%Y-%m-%d') from del_dates;
select id, date_format(applied, '%D of %M, %Y (%W)') from del_dates;
select @date_convert:= applied from del_dates where id = 2;
select @date_convert:=date_format(applied, '%D of %M, %Y (%W)') from del_dates where id = 2;
select @date_convert;
select str_to_date(@date_convert,'%D of %M, %Y (%W)');
select cast(str_to_date(@date_convert,'%D of %M, %Y (%W)') as date);
select cast(str_to_date(@date_convert,'%D of %M, %Y (%W)') as date) + interval 76 day;



/**3. The mathematician Kurt Gödel was born on April 28, 1906  and died on January 14, 1978.

Set text variables to these dates, in exactly this format.

Answer the following questions.

a) On what day of the week was Gödel born, and on what day did he die?
b) Exactly how old was Gödel when he died, in years, months and days?
c) If Gödel had lived to be 99 years, six months and three days old, what date would he have died on? What day of the week is this?

**/
set @date_born = 'April 23, 1906';
set @date_death='January 14, 1978';
select @date_born, @date_death;
select str_to_date(@date_born,'%M %e, %Y');
-- a) day of the week he was born and day of the week he died
select dayname(str_to_date(@date_born,'%M %e, %Y'));
select dayname(str_to_date(@date_death,'%M %e, %Y'));

-- b) Exactly how old was he in years months and days
-- in days
select datediff(str_to_date(@date_death,'%M %e, %Y'),str_to_date(@date_born,'%M %e, %Y')) as days_old;
-- in months
select datediff(str_to_date(@date_death,'%M %e, %Y'),str_to_date(@date_born,'%M %e, %Y'))/(365*12) as months_old;
-- in years
select datediff(str_to_date(@date_death,'%M %e, %Y'),str_to_date(@date_born,'%M %e, %Y'))/365 as years_old;

-- c) 99 years and six month and three days
select @calc_value:= str_to_date(@date_born,'%M %e, %Y')+
interval 99 year + interval 6 month + interval 3 day;

select date(@calc_value);
select date_format(@calc_value, '%W');

