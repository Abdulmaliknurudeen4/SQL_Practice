-- prevents any one from inserting any type of cats into the database
create table animal_name(id int primary key auto_increment, name varchar(90) not null);
create table violations(id int primary key auto_increment, animal_name varchar(90) not null, date_inserted timestamp);

drop table animal_name;
drop table violations;
drop trigger before_animalName_insert;
drop trigger before_animalName_update;

select * from animal_name;
select * from violations;

insert into animal_name(name) values('LifePolice');

delimiter $$

create trigger before_animalName_insert before insert on animal_name for each row
begin
	
		if locate('cat', lcase(NEW.name)) != 0 then
            insert into violations(animal_name,date_inserted) values(NEW.name, now());
            set NEW.name = 'XXX';
        end if;
	
end$$

create trigger before_animalName_update before update on animal_name for each row
begin

	if locate('cat', lcase(NEW.name)) != 0 then
            insert into violations(animal_name,date_inserted) values(NEW.name, now());
            set NEW.name = 'XXX';
        end if;

end$$

delimiter ;

select locate('ay', 'Nailah');
