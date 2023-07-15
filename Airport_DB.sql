create  database airport

	CREATE TABLE Airport
(airport char(4) not null,
aname varchar(20),
checkin varchar(50),
resvtns varchar(12),
flightinfo varchar(12) );

	CREATE TABLE Route
( routeno integer not null,
rdescription varchar(40) );

	CREATE TABLE Fares
(faretype char(3) not null,
fdescription varchar(25),
conditions varchar(40) );

	CREATE TABLE Tariff
(routeno integer not null,
faretype char(3) not null,
price money );

	CREATE TABLE Aircraft
( aircrafttype char(3) not null,
adescription varchar(40),
noseats smallint );

	CREATE TABLE Flight
( flightno varchar(5) not null,
fromairport char(4),
toairport char(4),
deptime char(5),
arrtime char(5),
service varchar(20),
aircrafttype char(3),
routeno integer );

	CREATE TABLE Passenger
(pid integer not null,
name varchar(20),
address varchar(40),
telno varchar(12) );

	CREATE TABLE Ticket
(ticketno integer not null,
ticketdate date,
pid integer );

	CREATE TABLE Itinerary
(ticketno integer not null,
flightno varchar(5) not null,
legno integer not null,
flightdate date,
faretype char(3) ) ;
