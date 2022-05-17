-- Design a Database for an online shop
-- Foreign keys
-- Fairly Simple 
-- List of product organized into categories
-- List of customers
-- record sales including time of sales
-- dont use enum in any major way in the database



-- Join query that list all the sales, and list all associated information - who made the sale
-- and the category the product belongs to

-- Join query for other purposes

-- Begin

create table users(id int primary key auto_increment, name varchar(60) not null);
create table category(id int primary key auto_increment, category_name enum('Mobile Phones','Clothes','Gadgets','Cars','Gizmos','Unlisted Product') default 'Unlisted Product');
create table products(id int primary key auto_increment, product_name varchar(60) not null, price decimal(11,2) not null, description text, category_id int not null, foreign key(category_id) references category(id) on delete cascade on update cascade );
create table sales(id int primary key auto_increment, date_sales date, time_sales time, product_id int not null, user_id int not null, foreign key(product_id) references products(id) on delete cascade on update cascade, foreign key(user_id) references users(id) on delete cascade on update cascade );

show tables;
drop table sales;
drop table products;
drop table category;
drop table users;


insert into users(name) values('user1'),('user2'),('user3'),('user4'),('user5'),('user6'),('user7'),('user8'),('user9'),('user10');
insert into category(category_name) values('Mobile Phones'),('Clothes'),('Gadgets'),('Cars'),('Gizmos'),('Unlisted Product');
insert into products(product_name, price, description, category_id) values('Infinix Hot 5', 47500.00, 'Hot with Pro Features',1);
insert into products(product_name, price, description, category_id) values('Louis Vuitton Guci', 245600.00, 'Lastest Design From France',2);
insert into products(product_name, price, description, category_id) values('Hacker Pro 1', 1200000.00, 'Lastest Benz',3);
insert into products(product_name, price, description, category_id) values('Toyota Camry', 1200000.00, 'Lastest Benz',4);
insert into products(product_name, price, description, category_id) values('Beard Machine', 99000000.00, 'The Gods of Time',5);

insert into sales(date_sales,time_sales, product_id, user_id) values('2015-11-30','21:12:30', 5, 1);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-02-12','09:35:50', 5, 2);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-01-30','20:30:50', 2, 3);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-08-15','10:00:50', 1, 4);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-01-30','08:35:50', 2, 5);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-01-30','07:30:50', 5, 6);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-01-30','13:30:50', 3, 7);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-01-30','15:30:50', 4, 8);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-01-30','24:30:50', 2, 9);
insert into sales(date_sales,time_sales, product_id, user_id) values('2015-01-30','24:30:50', 2, 10);

-- Query
select * from users;
select * from products;
select * from category;
select * from sales;

-- Important Queries
-- who made sales and time and info
select us.name, pr.product_name, pr.price, sa.date_sales, sa.time_sales from users us join sales sa on us.id = sa.user_id join products pr on sa.product_id = pr.id order by us.name;
-- includes category
select us.name as 'Customer', pr.product_name as 'Product', ca.category_name as 'Category', pr.price as 'Product Price', sa.date_sales as 'Date Sold', sa.time_sales as 'Time Sold' from users us join sales sa on us.id = sa.user_id join products pr on sa.product_id = pr.id join category ca on pr.category_id = ca.id;
-- getting Number of The Product Needed for shipping
select pr.product_name as 'Product Name',count(pr.product_name) as 'Number Needed' from products pr join sales sa on pr.id = sa.product_id group by pr.product_name;
-- include category
select pr.product_name as 'Product Name', ca.category_name as 'Category Name', count(pr.product_name) as 'Number Needed' from products pr join sales sa on pr.id = sa.product_id join category ca on ca.id = pr.category_id group by pr.product_name;

-- Calculate the number of goods each user bought and thier total price
select us.name as 'Name', count(pr.product_name) as 'Product Count', sum(pr.price) as 'Total Price' from users us join sales sa on sa.user_id = us.id join products pr on sa.product_id = pr.id group by us.name;

-- Count of Product belonging to each Category

select count(pr.product_name) as 'Number of Products', ca.category_name as 'Category Name' from products pr join category ca on pr.category_id = ca.id group by ca.category_name;

-- Number of Sales Performed on a Particular day and The Total Sum of Sales on That Day

select sa.date_sales as 'Day', count(*) as 'No of Sales', sum(pr.price) as 'Total Sales' from products pr join sales sa on sa.product_id = pr.id group by sa.date_sales order by count(*) desc;
select count(*) from sales where sales.date_sales  = '2015-02-12';

-- Number of Sales Performed in each Category on a particular day
select sa.date_sales as 'Day', count(*) as 'No of Sales', ca.category_name as 'Category Name', sum(pr.price) as 'Total Sales' from products pr join sales sa on sa.product_id = pr.id join category ca on pr.category_id = ca.id group by ca.category_name order by count(*) desc;

-- End
-- End