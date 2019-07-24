show databases;

create database login;

use login;

create table loginDetails
(
	user_name int(10) primary key not null,
    password varchar(20) not null 
);
show tables;

insert into loginDetails(user_name, password) values(121, "A1"), (122, "B1"), (123, "C1"), (124, "D1");
select * from loginDetails;
