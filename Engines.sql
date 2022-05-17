use tutorial1;
show engines;
show table status;
create table test(id int) engine=MyISAM;
drop table test;
set default_storage_engine=InnoDb;
create table test(id int);