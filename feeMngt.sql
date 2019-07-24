show databases;
create database feemngt;
use feemngt;
show tables;

create table AdmitLogin
(
	username varchar(100) not null primary key,
    password varchar(100) not null
);
insert into AdmitLogin(username, password) values("a1b2c3", "admin1");
select * from AdmitLogin;
create table AccountantLogin
(
	username varchar(100) not null primary key,
    password varchar(100) not null
);
insert into AccountantLogin(username, password) values("a2b3c4", "acct1");
insert into AccountantLogin(username, password) values("a3b4c5", "acct2");
select * from AccountantLogin;
create table Students
(
	Name varchar(100) not null,
    Email varchar(100) not null,
    Sex varchar(100) not null,
    Course varchar(100) not null,
    Fee float not null,
    Paid float not null,
    Due float not null,
    Address varchar(500) not null,
    ContactNo int(15),
    AdminId varchar(100),
    foreign key Students(AdminId )references AccountantLogin( username )
);
drop table Students;
show tables;
 