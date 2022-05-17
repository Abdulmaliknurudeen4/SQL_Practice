select * from olist_products_dataset limit 105,2;
set sql_safe_updates = 0;
update olist_products_dataset set product_name_lenght = 0 where product_name_lenght = '';
update olist_products_dataset set product_description_lenght = 0 where product_description_lenght = '';
update olist_products_dataset set product_photos_qty = 0 where product_photos_qty = '';
update olist_products_dataset set product_weight_g = 0 where product_weight_g = '';
update olist_products_dataset set product_length_cm = 0 where product_length_cm = '';
update olist_products_dataset set product_height_cm = 0 where product_height_cm = '';
update olist_products_dataset set product_width_cm = 0 where product_width_cm = '';

select * from olist_orders_dataset limit 1,8;
select * from olist_orders_dataset limit 1130,1;
update olist_orders_dataset set order_status = 'delivered' where order_status = '';
update olist_orders_dataset set order_purchase_timestamp = now() where order_purchase_timestamp = '';
update olist_orders_dataset set order_approved_at = now() where order_approved_at = '';
update olist_orders_dataset set order_delivered_carrier_date = now() where order_delivered_carrier_date = '';
update olist_orders_dataset set order_delivered_customer_date = now() where order_delivered_customer_date = '';
update olist_orders_dataset set order_estimated_delivery_date = now() where order_estimated_delivery_date = '';

select now();


select * from olist_order_items_dataset;
select distinct order_item_id from olist_order_items_dataset;
select * from olist_order_items_dataset WHERE shipping_limit_date = '';

select * from olist_order_reviews_dataset where review_id = '3242cc306a9218d0377831e175d62fbf';
update olist_order_reviews_dataset set review_creation_date = now() where review_creation_date = '';
update olist_order_reviews_dataset set review_answer_timestamp = now() where review_answer_timestamp = '';
select * from olist_order_reviews_dataset limit 78544, 2;
update olist_order_reviews_dataset set review_creation_date = now() where review_id = '636b237e87574ba29654deaba9eb9797';
update olist_order_reviews_dataset set review_answer_timestamp = now() where review_id = '636b237e87574ba29654deaba9eb9797';
