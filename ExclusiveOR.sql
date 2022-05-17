select * from users where age > 30 and name = 'Bob';
select * from users where age < 30 and id >= 10 and name like '%o%' and name is not null;

select * from users where age < 20 or age > 50 or name = 'Bob';
select * from users where (age < 20 or age > 30) and name = 'Bob';
select * from users where age < 20 or (age > 30 and name = 'Bob');
select * from users where not (age < 20) or (age>=39);

select * from users where not ((age < 20) or (age>=39));
select * from users where (not (age < 20)) or (age>=39);

select count(*) from users where ((age < 20) or (age>=39));
select count(*) from users where not ((age < 20) or (age>=39));

/** Exclusive Or Videos**/

select * from users where age < 30 xor name = 'Bob';
select * from users where age < 30 xor age < 30;
select * from users where age < 30  Xor age < 30 Xor age < 30;

select * from users where age < 30 xor age > 20;
select count(*) from users where name = 'Bob' or age < 30;
select count(*) from users where name = 'Bob' Xor age < 30;
/** Xor on both sides ignores null **/
select * from users where name = 'Bob' or age < 30;
select * from users where name = 'Bob' Xor age < 30;