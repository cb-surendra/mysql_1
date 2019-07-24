show databases;
create database phone_directory;
use phone_directory;
show tables;
create table userDetails
(
	userId int(11) not null primary key,
    userName varchar(200),
    userAdd varchar(200)
);
insert into userDetails(userId, userName, userAdd) 
	values
    (1, "ab1", "add1"), (2, "ab2", "add2"), (3, "ab3", "add3"), (4, "ab4", "add4"), (5, "ab5", "add5"), (6, "ab6", "add6"), (7, "ab7", "add7")
;
insert into userDetails(userId, userName, userAdd) 
	values
    (8, "ab1", "add8"), (9, "ab1", "add9"), (10, "ab2", "add10"), (11, "ab4", "add11"), (12, "ab5", "add12"), (13, "ab6", "add13"), (14, "ab7", "add14")
;
select * from userDetails;
create table phoneNumbers
(
	userId int(11) not null,
    phoneNumber int(15),
    tag varchar(20),
    foreign key(userId) references userDetails( userId )
);
insert into phoneNumbers(userId, phoneNumber, tag) 
	values
    (1, 101, "OFFICE"), (1, 102, "HOME"),
    (2, 201, "OFFICE"), (2, 202, "HOME"), (2, 203, "MOBILE"),
    (3, 301, "OFFICE"), (3, 302, "HOME"),
    (4, 401, "OFFICE"), 
    (5, 501, "OFFICE"), (5, 502, "HOME"), (5, 503, "MOBILE"),
    (6, 601, "OFFICE"), (7, 701, "HOME") 
;
insert into phoneNumbers(userId, phoneNumber, tag) 
	values
    (8, 801, "OFFICE"), (8, 802, "HOME"),
    (9, 901, "OFFICE"), (9, 902, "HOME"), (9, 903, "MOBILE"),
    (10, 1001, "OFFICE"), (10, 1002, "HOME"),
    (11, 1101, "OFFICE"), 
    (12, 1201, "OFFICE"), (12, 1202, "HOME"), (12, 1203, "MOBILE"),
    (13, 1301, "OFFICE"), (14, 1401, "HOME") 
;
select * from phoneNumbers;
select userDetails.userId, userDetails.userName, userDetails.userId, phoneNumbers.phoneNumber, phoneNumbers.tag from userDetails
	inner join phoneNumbers on phoneNumbers.userId = userDetails.userId where userDetails.userName like "ab1";
    
select userDetails.userId, userDetails.userName, userDetails.userId, phoneNumbers.phoneNumber, phoneNumbers.tag from userDetails
	inner join phoneNumbers on phoneNumbers.userId = userDetails.userId where phoneNumbers.phoneNumber = 102;
select userDetails.userId, userDetails.userName, userDetails.userId, phoneNumbers.phoneNumber, phoneNumbers.tag from userDetails
	inner join phoneNumbers on phoneNumbers.userId = userDetails.userId where userDetails.userName like "ab%";