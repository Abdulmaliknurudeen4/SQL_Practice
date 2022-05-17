show tables;
create table user_token(id int primary key auto_increment, person varchar(120)
, token varchar(120), issued_date date);
insert into user_token(person, token, issued_date) 
	values('AbdulMalik','XYZ!@##KKLJIKLKJ:L','2020-06-19');
-- Events that delete all the token that do not belong to today
SET GLOBAL event_scheduler = ON;
DELIMITER $$
CREATE EVENT plough_token_table ON SCHEDULE AT NOW() + interval 1 minute DO
BEGIN
	DELETE FROM user_token WHERE issued_date != date(now());
END$$
delimiter ;

DELIMITER $$
CREATE EVENT plough_token_table ON SCHEDULE EVERY 1 SECOND
STARTS NOW() + interval 1 minute
ENDS NOW() + interval 2 minute
 DO
BEGIN
	insert into user_token(person, token, issued_date) 
	values('AbdulMalik','XYZ!@##KKLJIKLKJ:L','2020-06-19'); 
END$$
delimiter ;

DELIMITER $$
CREATE EVENT plough_token_table ON SCHEDULE EVERY 30 SECOND
STARTS NOW() + interval 1 minute
 DO
BEGIN
	insert into user_token(person, token, issued_date) 
	values('AbdulMalik','XYZ!@##KKLJIKLKJ:L','2020-06-19'); 
END$$
delimiter ;


truncate user_token;
select * from user_token;
drop event plough_token_table;
show events in test;
alter event plough_token_table enable;
DELIMITER $$
ALTER EVENT plough_token_table
	ON SCHEDULE EVERY 30 SECOND
    ENDS NOW() + interval 2 MINUTE$$
DELIMITER ;
DELIMITER $$
ALTER EVENT plough_token_table
	DO
    BEGIN
		insert into user_token(person, token, issued_date) 
	values('AbdulMalik','XYZ!@##KKLJIKLKJ:L','2020-06-19');
    END$$
DELIMITER ;
