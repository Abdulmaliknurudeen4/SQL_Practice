CREATE TABLE `olist_customers_dataset` (
  `customer_id` varchar(90) DEFAULT NULL,
  `customer_unique_id` varchar(90) DEFAULT NULL,
  `customer_zip_code_prefix` varchar(90) DEFAULT NULL,
  `customer_city` varchar(90) DEFAULT NULL,
  `customer_state` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `olist_geolocation_dataset` (
  `geolocation_zip_code_prefix` varchar(90) DEFAULT NULL,
  `geolocation_lat` varchar(90) DEFAULT NULL,
  `geolocation_lng` varchar(90) DEFAULT NULL,
  `geolocation_city` varchar(90) DEFAULT NULL,
  `geolocation_state` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `olist_order_items_dataset` (
  `order_id` varchar(90) DEFAULT NULL,
  `order_item_id` varchar(90) DEFAULT NULL,
  `product_id` varchar(90) DEFAULT NULL,
  `seller_id` varchar(90) DEFAULT NULL,
  `shipping_limit_date` varchar(90) DEFAULT NULL,
  `price` varchar(90) DEFAULT NULL,
  `freight_value` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `olist_order_payments_dataset` (
  `order_id` varchar(90) DEFAULT NULL,
  `payment_sequential` varchar(90) DEFAULT NULL,
  `payment_type` varchar(90) DEFAULT NULL,
  `payment_installments` varchar(90) DEFAULT NULL,
  `payment_value` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `olist_order_reviews_dataset` (
  `review_id` varchar(90) DEFAULT NULL,
  `order_id` varchar(90) DEFAULT NULL,
  `review_score` varchar(90) DEFAULT NULL,
  `review_comment_title` varchar(90) DEFAULT NULL,
  `review_comment_message` varchar(90) DEFAULT NULL,
  `review_creation_date` varchar(90) DEFAULT NULL,
  `review_answer_timestamp` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `olist_orders_dataset` (
  `order_id` varchar(90) DEFAULT NULL,
  `customer_id` varchar(90) DEFAULT NULL,
  `order_status` varchar(90) DEFAULT NULL,
  `order_purchase_timestamp` varchar(90) DEFAULT NULL,
  `order_approved_at` varchar(90) DEFAULT NULL,
  `order_delivered_carrier_date` varchar(90) DEFAULT NULL,
  `order_delivered_customer_date` varchar(90) DEFAULT NULL,
  `order_estimated_delivery_date` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `olist_products_dataset` (
  `product_id` varchar(90) DEFAULT NULL,
  `product_category_name` varchar(90) DEFAULT NULL,
  `product_name_lenght` varchar(90) DEFAULT NULL,
  `product_description_lenght` varchar(90) DEFAULT NULL,
  `product_photos_qty` varchar(90) DEFAULT NULL,
  `product_weight_g` varchar(90) DEFAULT NULL,
  `product_length_colist_sellers_datasetm` varchar(90) DEFAULT NULL,
  `product_height_cm` varchar(90) DEFAULT NULL,
  `product_width_cm` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `olist_sellers_dataset` (
  `seller_id` varchar(90) DEFAULT NULL,
  `seller_zip_code_prefix` varchar(90) DEFAULT NULL,
  `seller_city` varchar(90) DEFAULT NULL,
  `seller_state` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `product_category_name_translation` (
  `product_category_name` varchar(90) DEFAULT NULL,
  `product_category_name_english` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- This is Commnet
-- These are statements for importing respective datasets
-- olist_customers_dataset
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_customers_dataset.csv'
INTO TABLE dataset_olist.olist_customers_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- olist_geolocation_dataset
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_geolocation_dataset.csv'
INTO TABLE dataset_olist.olist_geolocation_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- olist_order_items_dataset.
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_items_dataset.csv'
INTO TABLE dataset_olist.olist_order_items_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- olist_order_payments_dataset
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_payments_dataset.csv'
INTO TABLE dataset_olist.olist_order_payments_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- olist_order_reviews_dataset
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_reviews_dataset.csv'
INTO TABLE dataset_olist.olist_order_reviews_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- olist_orders_dataset
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_orders_dataset.csv'
INTO TABLE dataset_olist.olist_orders_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- olist_products_dataset
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
INTO TABLE dataset_olist.olist_products_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- olist_sellers_dataset
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_sellers_dataset.csv'
INTO TABLE dataset_olist.olist_sellers_dataset
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- product_category_name_translation
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/product_category_name_translation.csv'
INTO TABLE dataset_olist.product_category_name_translation
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- create statements
-- transforms stay here after analysis
-- table recreation after analysis

-- 01. olist_customer
CREATE TABLE olist_customers(customer_id VARCHAR(40) primary key, customer_unique_id VARCHAR(50),
customer_zip_code_prefix VARCHAR(10), customer_city VARCHAR(40), customer_state CHAR(10));

-- 02. olist_geolocation
CREATE TABLE olist_geolocation(geolocation_zip_code_prefix CHAR(10), geolocation_lat VARCHAR(90),
geolocation_lng VARCHAR(90), geolocation_city VARCHAR(40), geolocation_state CHAR(10));

-- 03. olist_sellers
CREATE TABLE olist_sellers(seller_id VARCHAR(40) primary key, seller_zip_code_prefix VARCHAR(10),
seller_city VARCHAR(40), seller_state CHAR(10));

-- 04. olist_products
CREATE TABLE olist_products(product_id VARCHAR(40) primary key, product_category_name VARCHAR(90),
product_name_length INT, product_description_length INT, product_photos_qty INT,
product_weight_g INT, product_length_cm INT DEFAULT 0, product_height_cm INT DEFAULT 0, product_width_cm INT 
DEFAULT 0);
drop table olist_products;

-- 05. olist_orders. Foreign Keys Left: customer_id
CREATE TABLE olist_orders(order_id VARCHAR(40) primary key, customer_id VARCHAR(40),
 order_status VARCHAR(20),
 order_purchase_timestamp TIMESTAMP, order_approved_at TIMESTAMP, order_delivered_carrier_date TIMESTAMP,
 order_delivered_customer_date TIMESTAMP, order_estimated_delivery_date TIMESTAMP,
 foreign key(customer_id) references olist_customers(customer_id));
drop table olist_orders;

-- 06. olist_order_items FOreign Keys left: order_id, product_id, seller_id
CREATE TABLE olist_order_items(order_id VARCHAR(40), order_item_id VARCHAR(40), product_id 
VARCHAR(40), seller_id VARCHAR(40), shipping_limit_date TIMESTAMP, price DOUBLE(9,4), freight_value DOUBLE(9,4),
foreign key(order_id) references olist_orders(order_id),
foreign key(product_id) references olist_products(product_id),
foreign key(seller_id) references olist_sellers(seller_id));
drop table olist_order_items;

-- 07. olist_order_reviews. Foreign Keys Left: order_id
CREATE TABLE olist_order_reviews(review_id VARCHAR(40), order_id VARCHAR(40), review_score INT(5),
review_comment_title LONGTEXT, review_comment_message LONGTEXT, review_creation_date TIMESTAMP, 
review_answer_timestamp TIMESTAMP,
foreign key(order_id) references olist_orders(order_id));
drop table olist_order_reviews;

-- 08. olist_order_payments: Foreign Key Left: order_id
CREATE TABLE olist_order_payments(order_id VARCHAR(40), payment_sequential INT(5), payment_type 
ENUM('credit_card', 'boleto', 'voucher', 'debit_card', 'not_defined'), payment_installments INT(5),
payment_value DOUBLE(9,4), foreign key(order_id) references olist_orders(order_id));
drop table olist_order_payments;

-- Reloading All Data Directly into the tables. No need for reformating since
-- the tables are already split

-- 01. First Insertion is for olist_customers
insert into olist_customers(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state) 
select customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state from olist_customers_dataset;
truncate olist_customers;


-- 02. Second is for olist_geolocation
insert into olist_geolocation(geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state) 
select geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state from olist_geolocation_dataset;
truncate olist_geolocation;

-- 03. Third is for olist_sellers
insert into olist_sellers(seller_id, seller_zip_code_prefix, seller_city, seller_state) 
select seller_id, seller_zip_code_prefix, seller_city, seller_state from olist_sellers_dataset;
truncate olist_sellers;

-- 04. Fourth is for olist_products
insert into olist_products(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty,
product_weight_g, product_length_cm, product_height_cm, product_width_cm) 
select product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g,
product_length_cm, product_height_cm, product_width_cm from olist_products_dataset;

truncate olist_products;

-- 05. Fifth is for olist_orders
insert into olist_orders(order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date,
 order_delivered_customer_date, order_estimated_delivery_date) 
 select order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date,
 order_estimated_delivery_date from olist_orders_dataset;

 truncate olist_orders;

-- 06. Sixth is for olist order items
insert into olist_order_items(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value) 
select order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value 
from olist_order_items_dataset;

truncate olist_order_items;

-- 07. Seventh for olist order review
insert into olist_order_reviews(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp) 
select review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp 
from olist_order_reviews_dataset;

truncate olist_order_reviews;

-- 08. Eighth for olist_order_payment
insert into olist_order_payments(order_id, payment_sequential, payment_type, payment_installments, payment_value)
select order_id, payment_sequential, payment_type, payment_installments, payment_value
 from olist_order_payments_dataset;

truncate olist_order_payment;

-- drop all sample tables
drop table olist_customers_dataset;
drop table olist_geolocation_dataset;
drop table olist_order_items_dataset;
drop table olist_order_payments_dataset;
drop table olist_order_reviews_dataset;
drop table olist_orders_dataset;
drop table olist_products_dataset;
drop table olist_sellers_dataset;