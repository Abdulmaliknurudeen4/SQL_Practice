delimiter $$
/**
shows you can define cursors for non existing table that you might create down the line of you
stored procedure which i didn't know
**/
create procedure meme()
begin

	declare sumtotal int default 0;
    declare sumtotalcopy int default 0;
    declare finished bool default false;
    
	declare curl cursor for select meme from meme;
    
    
    declare continue handler for not found set finished:=true;
    
    create table meme(id int primary key auto_increment, meme int);
    insert into meme(meme) values(1),(101),(1010);
    
    open curl;
    
        theloop: loop
			fetch curl into sumtotal;
            if finished then
				leave theloop;
			end if;
            set sumtotalcopy:= sumtotalcopy + sumtotal;
        end loop;
        
       select sumtotalcopy;
        
    close curl;
    
    drop table meme;
end$$


delimiter ;
call meme();
drop procedure meme;