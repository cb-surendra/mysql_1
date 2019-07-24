create database spaceportal;
use spaceportal;
create table loginT
(
	Email varchar(300) not null primary key,
    Password varchar(200),
	FirstName varchar(200),
    LastName varchar(200),
    Address1 varchar(200),
    Address2 varchar(200),
    City varchar(100),
    State varchar(100),
    Zip int(11),
    Country varchar(100)
);
show tables;
drop table loginT;
desc loginT;
select * from loginT;

create table PhoneDirectory
(
	FirstName varchar(100) not null,
    LastName varchar(100) not null,
    Add1 varchar(100) not null,
    Add2 varchar(100) not null,
    City varchar(100) not null,
    Country varchar(100) not null,
    PhoneWork int(13) not null,
    PhoneHome int(13) not null,
    PhoneMobile int(13) not null,
    ZipCode int(13) not null,
    State varchar(100) not null
);
insert into PhoneDirectory(FirstName, LastName, Add1, Add2, City, Country, PhoneWork, PhoneHome, PhoneMobile, ZipCode, State) 
value ("Suren", "pal", "Add1", "Add2", "Chennai", "India", 1234, 2345, 5677, 5004, "TamilNadu");
select * from PhoneDirectory;