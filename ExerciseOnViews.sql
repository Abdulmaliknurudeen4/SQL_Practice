use cinema;
-- creating temporary views needed for the sales and product table to make the approach more easier
-- and using merges or temptables;

-- 01.
-- who made sales and time and info and salesview_info
create algorithm=merge view salesview_info as
select us.name, pr.product_name, pr.price, sa.date_sales, sa.time_sales from users us 
join sales sa on
 us.id = sa.user_id join products pr on sa.product_id = pr.id order by us.name;
 
 select * from salesview_info;
 -- 02.
 -- getting Number of The Product Needed for shipping
 -- Using the TempTable Algorithm will be more pratical here as products_request_view;
 create algorithm = temptable view products_request_view as
select pr.product_name as 'Product Name',count(pr.product_name) as 'Number Needed'
 from products pr join sales sa on pr.id = sa.product_id group by pr.product_name;
 
 select * from products_request_view;
 
 -- 03.
 -- Same Applies HERE to customer_cart_view;
 -- Calculate the number of goods each user bought and thier total price
 create algorithm=temptable view customer_cart_view as
select us.name as 'Name', count(pr.product_name) as 'Product Count', sum(pr.price)
 as 'Total Price' from users us join sales sa on
 sa.user_id = us.id join products pr on sa.product_id = pr.id group by us.name;
 
 select * from customer_cart_view;
 
 -- 04.
 -- Count of Product belonging to each Category
-- Same temp table belongs here as category_count_view;
create algorithm=temptable view category_count_view as
select count(pr.product_name) as 'Number of Products',
 ca.category_name as 'Category Name' from products pr join
 category ca on pr.category_id = ca.id group by ca.category_name;
 
 select * from category_count_view;
 
-- 05.
-- Number of Sales Performed on particular date and the total of all the sales on that day
-- TempTable as circumstance predicts datesales_data_view;
create algorithm=temptable view datesales_data_view as
select sa.date_sales as 'Day', count(*) as 'No of Sales', 
sum(pr.price) as 'Total Sales' from products pr 
join sales sa on sa.product_id = pr.id group by sa.date_sales order by count(*) desc;

select * from datesales_data_view;

-- 06.
-- Number of Sales Performed in each Category on a particular day as categoryDate_sales_view;
create algorithm = temptable view categoryDate_sales_view as
select sa.date_sales as 'Day', count(*) as 'No of Sales', 
ca.category_name as 'Category Name', sum(pr.price) as 'Total Sales' from products pr
 join sales sa on sa.product_id = pr.id join category ca on pr.category_id = ca.id
 group by ca.category_name order by count(*) desc;
 
 select * from categoryDate_sales_view;
 -- Drops
 show tables;
 drop view salesview_info,products_request_view, customer_cart_view, category_count_view,
 datesales_data_view, categoryDate_sales_view;
 