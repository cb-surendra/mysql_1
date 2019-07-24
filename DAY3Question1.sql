show databases;
create database service_station;
use service_station;
use TEST;
drop database TEST;
show tables;
CREATE TABLE employee(  
   emp_id INT NOT NULL,  
   emp_name VARCHAR(100) NOT NULL,  
   emp_age INT NOT NULL,
   emp_contact INT NOT NULL,  
   PRIMARY KEY ( emp_id )  
); 
CREATE TABLE servicestation(  
   servicesta_id INT NOT NULL,  
   servicesta_name VARCHAR(100) NOT NULL,  
   servicesta_add VARCHAR(200) NOT NULL,
   servicesta_contact INT NOT NULL,  
   PRIMARY KEY ( servicesta_id )  
); 
CREATE TABLE customer(  
   cus_id INT NOT NULL PRIMARY KEY,  
   cus_name VARCHAR(100) NOT NULL,  
   cus_age INT NOT NULL,
   cus_contact INT NOT NULL,
   cus_emp_id INT,
   FOREIGN KEY ( cus_emp_id ) REFERENCES employee(emp_id)
); 
CREATE TABLE vehicles(  
   vehicle_id INT NOT NULL PRIMARY KEY,  
   vehicle_type ENUM('Car', 'Bike', 'Bus'),  
   vehicle_brand VARCHAR(100),
   vehicle_color INT NOT NULL,
   vehicle_servicecharge FLOAT
); 
CREATE TABLE invoice(  
   invoice_id INT NOT NULL PRIMARY KEY,
   invoice_ownername VARCHAR(100),
   invoice_vehicle VARCHAR(100),
   invoice_totalamount FLOAT,
   invoice_employeeasigned INT,
   foreign key( invoice_employeeasigned ) references employee( emp_id )
); 
create table TEST(
	name varchar(20),
    age int,
    email varchar(15)
);
drop table TEST;