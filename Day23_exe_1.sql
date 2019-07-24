show databases;
create database reservation_system;
use reservation_system;

create table Trains
(
	trainNo int primary key not null,
    trainName varchar(100) not null
);
insert into Trains(trainNo, trainName) values(1, "abc"), (2, "bcd"), (3, "cde"), (4, "def"), (5, "efg"), (6, "fgh"), (7, "ghi"), (8, "hij");
/*1st question*/
select * from Trains;
create table Coaches
(
	coachCode varchar(100) primary key not null,
    costPerKm int not null
);
insert into Coaches(coachCode, costPerKm) values("GEN",1),("SL",5),("ACIII", 10),("ACII", 15),("ACI", 30);
select * from Coaches;
create table Users
(
	userId int primary key not null,
    loginId varchar(100) not null unique,
    loginPassword varchar(100) not null
);
insert into Users(userId, loginId, loginPassword) values(101,"1a1","pass1"),(102,"1a2","pass2"),(103,"1a3","pass3"),(104,"1a4","pass4"),(105,"1a5","pass5");
select * from Users;
create table Stations
(
	stationId int primary key not null,
    stationCode varchar(100) not null unique
);
insert into Stations(stationId, stationCode) values(501,"BKH"),(502,"BPL"),(503,"ET"),(504,"ALD"),(505,"KTE"),(506,"JBP"),(507,"PPI");
select * from Stations;
create table TrainCoaches
(
	trainNo int not null,
    coachCode varchar(100) not null,
    noOfSeats int not null,
    foreign key (trainNo) references Trains(trainNo),
    foreign key (coachCode) references Coaches(coachCode)
);
insert into TrainCoaches(trainNo, coachCode, noOfSeats) values
		(1, "GEN",20),(1,"SL",50),(1,"ACIII",15),(1,"ACII",10),(1,"ACI",5),
        (2, "GEN",23),(2,"SL",53),(2,"ACIII",15),(2,"ACII",12),(2,"ACI",7),
        (3, "GEN",25),(3,"SL",50),(3,"ACIII",18),(3,"ACII",11),(3,"ACI",3),
        (4, "GEN",20),(4,"SL",52),(4,"ACIII",17),(4,"ACII",10),(4,"ACI",5),
        (5, "GEN",20),(5,"SL",50),(5,"ACIII",15),(5,"ACII",10),(5,"ACI",5),
        (6, "GEN",20),(6,"SL",50),(6,"ACIII",15),(6,"ACII",10),(6,"ACI",5),
        (7, "GEN",20),(7,"SL",50),(7,"ACIII",15),(7,"ACII",10),(7,"ACI",5),
        (8, "GEN",25),(8,"SL",50),(8,"ACIII",18),(8,"ACII",11),(8,"ACI",3);
select * from TrainCoaches;
create table Routes
(
	routeId int not null primary key,
    originStationId int not null,
    destinationStationId int not null,
    foreign key (originStationId) references Stations(stationId),
    foreign key (destinationStationId) references Stations(stationId)
);
alter table Routes add distanceInKm int;
select * from Routes;
insert into Routes(routeId, originStationId, destinationStationId) values
		(51,501,503),(52,501,506),(53,501,507),(54,503,504),(55,505,503),(56,502,504),(57,502,506);
insert into Routes(routeId, originStationId, destinationStationId) values
		(58,501,505);
update Routes set distanceInKm = 100 where Routes.routeId = 51;
update Routes set distanceInKm = 95 where Routes.routeId = 52;
update Routes set distanceInKm = 82 where Routes.routeId = 53;
update Routes set distanceInKm = 600 where Routes.routeId = 54;
update Routes set distanceInKm = 700 where Routes.routeId = 55;
update Routes set distanceInKm = 150 where Routes.routeId = 56;
update Routes set distanceInKm = 120 where Routes.routeId = 57;
update Routes set distanceInKm = 103 where Routes.routeId = 58;


select * from Routes;
create table TrainRouteMaps
(
	routeId int not null,
    trainNo int not null,
    arrivalTime time not null,
    departureTime time not null,
    durationInMinutes int not null,
    foreign key (routeId) references Routes(routeId),
    foreign key (trainNo) references Trains(trainNo)
);
insert into TrainRouteMaps(routeId, trainNo, arrivalTime, departureTime, durationInMinutes) values
	(51,1,"11:10:00","11:20:00",100),
    (52,2,"13:00:00","13:30:00",200),
    (53,3,"14:20:00","14:30:00",400),
    (54,4,"02:10:00","02:30:00",500),
    (55,5,"01:05:00","01:10:00",300),
    (56,6,"15:15:00","15:30:00",150),
    (57,7,"17:30:00","18:20:00",700),
    (58,8,"20:30:00","21:00:00",600);
select * from TrainRouteMaps;
create table Bookings
(
	bookingRefNo int not null primary key,
	routeId int not null,
    trainNo int not null,
    coachCode varchar(100) not null,
    dateOfJourney timestamp not null,
    dateOfBooking timestamp not null,
    noOfTickets int,
    foreign key (routeId) references Routes(routeId),
    foreign key (trainNo) references Trains(trainNo)
);
insert into Bookings(bookingRefNo, routeId, trainNo, coachCode, dateOfJourney, dateOfBooking, noOfTickets) values
	(101,51,1,"ACIII",now(), now(),2),
    (102,52,2,"ACII",now(),now(),3),
    (103,53,3,"ACI",now(),now(),1),
    (104,54,4,"SL",now(),now(),2),
    (105,55,5,"SL",now(),now(),1),
    (106,56,6,"ACIII",now(),now(),3),
    (107,51,1,"SL",now(),now(),2),
    (108,52,2,"ACII",now(),now(),1);
select * from Bookings;
show tables;
describe TrainRouteMaps;
drop table TrainCoaches;
/*To get the list of all trains*/
select * from Trains;
/*To get the list of all train routes in the database*/
select trainNo, arrivalTime, departureTime, durationInMinutes from TrainRouteMaps;
/*(Total number of seats in the each train.*/
select trainName, number_of_seats from
(
select trainNo, sum(noOfSeats) as number_of_seats from TrainCoaches group by trainNo
)
as T inner join Trains on Trains.trainNo = T.trainNo;

/*List of all routes goes to Bangalore*/

/*List of all routes starting from bangalore, calcutta and chennai*/
select * from Routes where originStationId = 501 or originStationId = 502 or originStationId = 503;

/*List of all the bookings booked between 1st Jan 2005 and 31st Dec 2005*/
select * from Bookings where dateOfJourney  between date("2019-07-10 00:00:00") and date("2019-07-18 00:00:00");

/*List of all trains whose name begins with B or a*/
select trainName from Trains where trainName like "a%";

/*List of all bookings where DOB is not null*/
select * from Bookings where Bookings.dateOfBooking is not null;

/*List of all bookings for the booked in 2006, DOJ in 2007*/
select bookingRefNo, routeId, trainNo, dateOfJourney, dateOfBooking, noOfTickets from Bookings where year(dateOfJourney) = 2019 and year( dateOfBooking ) = 2019;

/*Total number of coaches in the all the trains*/
select trainNo, count(coachCode) as TotalCoach from TrainCoaches group by trainNo;

/*Total number of bookings in the database for the train no 16198*/
select count(*) as TotalBooking from Bookings where Bookings.trainNo = 1;

/*Total no of tickets column 'total' , booked for train no. 14198*/
select count(*) as total from Bookings where Bookings.trainNo = 1;

/*Minimum distance route*/
select * from Routes;
select * from Routes where Routes.distanceInKm = (select min(distanceInKm) from Routes);

/*Total number of tickets booked for each train in the database*/
select trainNo, sum(noOfTickets) from Bookings group by trainNo;

/*cost for 50 kms for each coach.*/
select * from Coaches;
select coachCode, 50*costPerKm from Coaches;

/*List the train name and departure time for the trains starting from Bangalore.*/
select Trains.trainName, TrainRouteMaps.departureTime from TrainRouteMaps
inner join Trains on Trains.trainNo = TrainRouteMaps.trainNo 
inner join Routes on Routes.routeId = TrainRouteMaps.routeId
where Routes.originStationId = 501;
 
/*List the trains for which the total no of tickets booked is greater than 500*/
select Trains.trainName, sum(Bookings.noOfTickets) from Bookings inner join Trains on Trains.trainNo = Bookings.trainNo group by Trains.trainNo;

/*List the trains for which the total no of tickets booked is lesser than 50*/
select Trains.trainName, sum(Bookings.noOfTickets) from Bookings inner join Trains on Trains.trainNo = Bookings.trainNo group by Trains.trainNo having sum(Bookings.noOfTickets) < 3; 

select * from Bookings;
select * from Coaches;
/*List the bookings along with train name, origin station, destination station and coach code after the date of journey ’25th Feb 2015’*/
select * from Bookings where Bookings.dateOfJourney like '2019-07-16';

/*select Routes.originStationId, Routes.destinationStationId, Bookings.coachCode from Bookings
    inner join Routes on Routes.routeId = Bookings.routeId,
    where Bookings.dateOfJourney = date("2019-07-16 12:50:35");
List the trains via the route Mysore - Chennai*/

/* List the trains for which are booked till now.*/
select Trains.trainName from Trains 
	inner join Bookings on Bookings.trainNo = Trains.trainNo 
    where Bookings.dateOfBooking between date("2015-09-23 00:00:00") and now()
    group by Trains.trainName;

