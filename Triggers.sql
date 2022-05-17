use test;
create table sales(id int primary key auto_increment, product varchar(30) not null, value numeric(10,2));
create table sales_update(id int primary key auto_increment,
		product_id int not null,
        changed_at timestamp,
        before_value numeric(10,2) not null,
        after_value numeric(10,2) not null);
insert into sales(product, value) values("Cake ", 0.50);
select * from sales;
select * from sales_update;
update sales set value = 5.90 where id = 3;

delimiter $$

create trigger before_sales_update before update on sales for each row
begin

	insert into sales_update(product_id, changed_at, before_value, after_value)
		values(OLD.id, now(), OLD.value, NEW.value);

end$$

delimiter ;

/**
delimiter $$

create trigger before_sales_update before update on sales for each row
begin

	insert into sales_update(product_id, changed_at, before_value, after_value)
		values(OLD.id, now(), OLD.value, NEW.value);

end$$

delimiter ;
**/
-- using triggers to do some certain amount of validation;
-- when you drop a table all it's associated triggers are dropped;
-- you can only have one after or before trigger on a table;

create table products(id int primary key auto_increment, value numeric(10,2) not null);

set delimiter $$

create trigger before_products_insert before insert on products for each row
begin

	if new.value > 100.0 then
		set new.value = 100.0;
	elseif new.value<20 then
		set new.value = 20;
    end if;

end$$


create trigger before_products_update before update on products for each row
begin

	if new.value > 100.0 then
		set new.value = 100.0;
	elseif new.value<20 then
		set new.value = 20;
    end if;

end$$


set delimiter ;
insert into products(value) values(2.9);
select * from products;
update products set value = 120.0 where id = 1;
drop trigger before_products_insert;
use test;
-- Using Triggers and Transactions

create table sales(id int primary key auto_increment, product varchar(45) not null, sold numeric(8,2) not null);
create table sales_totals(id int primary  key auto_increment, total numeric(11,2) not null, day date);
alter table sales_totals add unique(day);
show index from sales_totals;
delimiter $$
-- can't use transactions in triggers because the trigger runs in the statement that initiating it
-- trnasaction. but you can use transactional syntax in there
create trigger before_sales_insert before insert on sales for each row
begin
	declare count int default 0;
    declare today date default date(now());
	-- locks the entire table  if there is not index in the where column match
    select count(*) into count from sales_totals where day = today for update;

    if count = 0 then
		insert into sales_totals(total, day) values(new.sold, today);
	else
		update sales_totals set total = total + new.sold where day = today;
    end if;

end$$

delimiter ; 
drop trigger before_sales_insert;

insert into sales(product,sold) values('Cat Deluxe',10.00);
select * from sales;
select * from sales_totals;

set sql_safe_updates = 0;
delete from sales;
delete from sales_totals;
select count(*) from sales_totals where day = date(now());