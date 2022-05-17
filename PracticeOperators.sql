-- Select all the rows where age is greater than 20 but less than 30
select * from users where age > 20 and age <30;

-- Select all rows where age is between 20 (inclusive) and 30 (inclusive)
select * from users where age between 20 and 30;
select * from users where age >=20 and age<=30;

-- Select all rows where age is between 20 (inclusive) and 30 (inclusive) and the name is not “Vicky”
select * from users where (age between 20 and 30) and name != 'Vicky';
select * from users where (age between 20 and 30) and not name = 'Vicky';

-- Select all rows where either the name is null or the name does not contain the letter “e”
select * from users where (name is null) or (name not like '%e%');




-- Select all rows for users ages between 30 and 40 whether the name contains either “o” or “e”
select * from users where (age between 30 and 40) and (name like '%o%' or name like '%e%');
select * from users where (age > 30 and age < 40) and (name like '%o%' or name like '%e%');

-- Select all rows where either the name contains an “o” or the id is less than 5, but not both

select * from users where name like '%o%' XOR id<5;