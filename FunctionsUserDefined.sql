use test;

show tables;

select least(6,2);
-- funtions have single return value. User defined functions are limited in mysql
-- we can't define aggregate functions currently in mysql
select * from sales;

set @tax = 19;
set @id = 2;
select sum(sold) * ((100-@tax)/100) from sales;

delimiter $$

create function sales_after_tax(tax float, idm int)
returns numeric(10,2) 
deterministic
begin
	declare result numeric(10,2);
	select sum(sold) * ((100-tax)/100) into result from sales where id = idm;
    return result;

end$$

delimiter ;
select sales_after_tax(20,1);