show databases;
create database loginSystem;
use loginSystem;
create table UserDetails
(
	FirstName varchar(100) not null,
    LastName varchar(100) not null,
    Email varchar(100) not null primary key,
    Password varchar(100) not null,
    Address varchar(500)
);
select * from UserDetails;
update UserDetails set FirstName ="ABC", LastName = "D", Address = "Address1" where Email = "abcd@gmail.com";
select * from UserDetails where Email = "abcd@gmail.com";