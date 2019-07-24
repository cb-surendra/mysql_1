show databases;
create database test;
use test;
show tables;

create table userDetails
(
	user_name int(10) primary key not null,
    password varchar(20) not null 
);
desc userDetails;
alter table userDetails add name_of_user varchar(20), add father_name varchar(20);
insert into userDetails(user_name, password, name_of_user, father_name) 
	values 
    (12, "12a", "ram", "abc"), (13, "12b", "syam", "cbd"), (14, "12c", "james", "def");
select * from userDetails;
insert into userDetails(user_name, password) 
	values 
    (15, "12d");
    
SELECT COALESCE(father_name, 0) AS father_name FROM userDetails;
select ifnull(father_name, "xyz") from userDetails;
select * from userDetails;
select 
	case
		when father_name is not null then father_name
        else 'N/A'
	end as father_name
from userDetails;
select if(father_name is not null, father_name, 'N/A') as result from userDetails;
select if(father_name is null, 'N/A', father_name) as result from userDetails;