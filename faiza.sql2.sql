create database Faiza;
use Faiza;

CREATE TABLE Movie (
    MovieID INT,
    Title VARCHAR(256),
    Description VARCHAR(256),
    Duration TIME,
    Language VARCHAR(16),
    ReleaseDate DATE,
    Country VARCHAR(64),
    Genre VARCHAR(20),
    PRIMARY KEY (MovieID)
);
INSERT INTO Movie VALUES (101,'A','abc','3:40:12','English','2021-12-13','USA','Romantic');
INSERT INTO Movie VALUES (102,'B','def','4:40:12','Hindi','2021-12-13','india','Romantic');
INSERT INTO Movie VALUES (103,'C','ghi','2:40:12','Tamil','2021-12-07','tamil','sad');
INSERT INTO Movie VALUES (104,'D','jkl','1:40:12','korean','2021-12-03','korea','hungry');
INSERT INTO Movie VALUES (105,'E','mno','2:40:12','german','2021-12-01','germany','Romantic');
INSERT INTO Movie VALUES (106,'F','pqr','1:40:12','English','2021-12-01','USA','drama');
INSERT INTO Movie VALUES (107,'G','jok','2:40:12','hindi','2021-01-13','USA','Romantic');
INSERT INTO Movie VALUES (108,'H','okl','3:40:12','English','2021-12-03','USA','fiction');
INSERT INTO Movie VALUES (109,'I','nbh','4:40:12','korean','2021-12-03','koreao','Romantic');
INSERT INTO Movie VALUES (110,'J','pol','1:40:12','chinese','2021-12-05','china','horror');


CREATE TABLE User (
UserID int,
Name varchar(64),
Password varchar(20),
Email varchar(64),
Phone varchar(16),
PRIMARY KEY(UserID)
);


INSERT INTO User VALUES (120, 'Faiza', 'faiza123', 'faiza123t@gmail.com',9917071877);
INSERT INTO User VALUES (123, 'Bill', 'bill123', 'bill123a@gmail.com',9917071878);
INSERT INTO User VALUES (125, 'Nick' , 'nick123', 'nick123g@gmail.com',9917071845);
INSERT INTO User VALUES (130, 'Emma', 'emma123', 'emma122h@gmail.com',9917071823);
INSERT INTO User VALUES (170, 'Joe', 'joe123', 'joe123i@gmail.com',9917071867);
INSERT INTO User VALUES (135, 'Summer', 'summer123', 'summer123k@gmail.com',9917076877);
INSERT INTO User VALUES (160, 'Emily', 'emily123', 'emily123g@gmail.com',9917071677);
INSERT INTO User VALUES (180, 'Ryan', 'ryan123', 'ryan123a@gmail.com',9917761877);
INSERT INTO User VALUES (110, 'Mike', 'mike123', 'miker123j@gmail.com',9917065877);
INSERT INTO User VALUES (190, 'Fa', 'fa123', 'fa123z@gmail.com',9917121877);


CREATE TABLE City(
CityID int,
Name varchar(64),
State varchar(64),
ZipCode varchar(16),
PRIMARY KEY (CityID)
);
INSERT INTO City VALUES (301,'Khurja','UP','203131');
INSERT INTO City VALUES (302,'Mathura','MP','203132');
INSERT INTO City VALUES (303,'Hokkah','Delhi','203133');
INSERT INTO City VALUES (304,'jokon','Jalandar','203134');
INSERT INTO City VALUES (305,'kolon','Moko','203135');
INSERT INTO City VALUES (306,'nootle','Noko','203136');
INSERT INTO City VALUES (307,'cuttle','loko','203137');
INSERT INTO City VALUES (308,'noton','qwde','203138');
INSERT INTO City VALUES (309,'ookla','gookl','203139');
INSERT INTO City VALUES (310,'oopla','mookl','203140');

CREATE TABLE Cinema(
CinemaID int,
Name varchar(64),
TotalCinemaHalls int,
CityID int,
PRIMARY KEY(CinemaID),
FOREIGN KEY (CityID) REFERENCES City(CityID)
);
INSERT INTO Cinema VALUES (101,'A',10,301);
INSERT INTO Cinema VALUES (102,'B',10,301);
INSERT INTO Cinema VALUES (103,'C',10,302);
INSERT INTO Cinema VALUES (104,'D',10,303);
INSERT INTO Cinema VALUES (105,'E',10,301);
INSERT INTO Cinema VALUES (106,'F',10,306);
INSERT INTO Cinema VALUES (107,'G',10,308);
INSERT INTO Cinema VALUES (108,'H',10,309);
INSERT INTO Cinema VALUES (109,'I',10,302);
INSERT INTO Cinema VALUES (110,'J',10,307);



CREATE TABLE Booking (
BookingID int,
NumberOfSeats int,
Timestamp datetime,
Status int,
userID int,
ShowID int,
PRIMARY KEY(BookingID),
FOREIGN KEY (UserID) REFERENCES User(UserID),
FOREIGN KEY (ShowID) REFERENCES Show_Seat(MovieID)
);
INSERT INTO Booking VALUES (101,120,'10-2-2021',1,123,565);
INSERT INTO Booking VALUES (102,123,'10-2-2021',1,125,512);
INSERT INTO Booking VALUES (103,125,'10-2-2021',1,122,655);
INSERT INTO Booking VALUES (104,130,'10-2-2021',1,163,885);
INSERT INTO Booking VALUES (105,170,'10-2-2021',1,163,125);
INSERT INTO Booking VALUES (106,120,'10-2-2021',1,183,995);
INSERT INTO Booking VALUES (107,160,'10-2-2021',1,113,534);
INSERT INTO Booking VALUES (108,180,'10-2-2021',1,923,675);
INSERT INTO Booking VALUES (109,110,'10-2-2021',1,163,523);
INSERT INTO Booking VALUES (110,190,'10-2-2021',1,103,573);



CREATE TABLE Cinema(
CinemaID int,
Name varchar(64),
TotalCinemaHalls int,
CityID int,
PRIMARY KEY(CinemaID),
FOREIGN KEY (CityID) REFERENCES City(CityID)
);
INSERT INTO Cinema VALUES (101,'A',10,123);
INSERT INTO Cinema VALUES (102,'B',10,113);
INSERT INTO Cinema VALUES (103,'C',10,623);
INSERT INTO Cinema VALUES (104,'D',10,173);
INSERT INTO Cinema VALUES (105,'E',10,123);
INSERT INTO Cinema VALUES (106,'F',10,183);
INSERT INTO Cinema VALUES (107,'G',10,113);
INSERT INTO Cinema VALUES (108,'H',10,823);
INSERT INTO Cinema VALUES (109,'I',10,193);
INSERT INTO Cinema VALUES (110,'J',10,123);

CREATE TABLE Cinema_Hall(
CinemaHallID int,
Name varchar(64),
TotalSeats int,
CinemaID int,
PRIMARY KEY(CinemaHallID),
FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID)
);
INSERT INTO Cinema_Hall VALUES (401,'A',200,101);
INSERT INTO Cinema_Hall VALUES (402,'B',300,102);
INSERT INTO Cinema_Hall VALUES (403,'C',400,103);
INSERT INTO Cinema_Hall VALUES (404,'D',500,104);
INSERT INTO Cinema_Hall VALUES (405,'E',600,105);
INSERT INTO Cinema_Hall VALUES (406,'F',700,106);
INSERT INTO Cinema_Hall VALUES (407,'G',800,107);
INSERT INTO Cinema_Hall VALUES (408,'H',900,108);
INSERT INTO Cinema_Hall VALUES (409,'I',100,109);
INSERT INTO Cinema_Hall VALUES (410,'J',230,110);


CREATE TABLE Shows (
ShowID int,
Date date,
StartTime time,
EndTime time,
CinemaHallID int,
MovieID int,
PRIMARY KEY (ShowID),
FOREIGN KEY (CinemaHallID) REFERENCES Cinema_Hall(CinemaHallID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

INSERT INTO Shows VALUES (123,'02-08-2021','12:13:23','14:12:23',123,234);
INSERT INTO Shows VALUES (124,'02-08-2021','12:13:23','14:12:23',123,235);
INSERT INTO Shows VALUES (125,'02-08-2021','12:13:23','14:12:23',123,236);
INSERT INTO Shows VALUES (126,'02-08-2021','12:13:23','14:12:23',123,237);
INSERT INTO Shows VALUES (127,'02-08-2021','12:13:23','14:12:23',123,238);
INSERT INTO Shows VALUES (128,'02-08-2021','12:13:23','14:12:23',123,239);
INSERT INTO Shows VALUES (129,'02-08-2021','12:13:23','14:12:23',123,245);
INSERT INTO Shows VALUES (121,'02-08-2021','12:13:23','14:12:23',123,256);
INSERT INTO Shows VALUES (122,'02-08-2021','12:13:23','14:12:23',123,223);
INSERT INTO Shows VALUES (120,'02-08-2021','12:13:23','14:12:23',123,212);


CREATE TABLE Show_Seat(
ShowSeatID int,
Status int,
Price int,
CinemaSeatID int,
ShowID int,
BookingID int,
PRIMARY KEY (ShowSeatID),
FOREIGN KEY (CinemaSeatID) REFERENCES Cinema_Sear(CinemaSeatID),
FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);
INSERT INTO Show_Seat VALUES (401,1,230,3,10);
INSERT INTO Show_Seat VALUES (402,2,230,2,11);
INSERT INTO Show_Seat VALUES (403,3,230,3,12);
INSERT INTO Show_Seat VALUES (404,4,230,3,13);
INSERT INTO Show_Seat VALUES (405,5,230,1,14);
INSERT INTO Show_Seat VALUES (406,6,230,5,15);
INSERT INTO Show_Seat VALUES (407,7,230,3,16);
INSERT INTO Show_Seat VALUES (408,8,230,3,17);
INSERT INTO Show_Seat VALUES (409,9,230,5,18);
INSERT INTO Show_Seat VALUES (410,10,230,1,19);

CREATE TABLE Payment(
PaymentID int,
Amount int,
Timestamp datetime,
DiscountCouponID int,
RemoteTransactionID int,
PaymentMehtod int,
BookingID int,
PRIMARY KEY (PaymentID),
FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);
INSERT INTO Payment VALUES (401,100,'20-4-2021',201,1234,1,301);
INSERT INTO Payment VALUES (402,100,'20-4-2021',202,1244,1,302);
INSERT INTO Payment VALUES (403,100,'20-4-2021',203,1534,1,303);
INSERT INTO Payment VALUES (404,100,'20-4-2021',204,1634,1,304);
INSERT INTO Payment VALUES (405,100,'20-4-2021',205,1734,1,305);
INSERT INTO Payment VALUES (406,100,'20-4-2021',206,1334,1,306);
INSERT INTO Payment VALUES (407,100,'20-4-2021',2071254,1,307);
INSERT INTO Payment VALUES (408,100,'20-4-2021',208,2234,1,308);
INSERT INTO Payment VALUES (409,100,'20-4-2021',209,14434,1,309);
INSERT INTO Payment VALUES (410,100,'20-4-2021',210,1254,1,310);


CREATE TABLE Cinema_Seat(
CinemaSeatID int,
SeatNumber int,
Type int,
CinemaHallID int,
PRIMARY KEY (CinemaSeatID),
FOREIGN KEY (CinemaHallID) REFERENCES Cinema_Hall(CinemaHallID)
);
INSERT INTO Cinema_Seat VALUES (1001,201,1,3);
INSERT INTO Cinema_Seat VALUES (1002,202,2,1);
INSERT INTO Cinema_Seat VALUES (1003,203,1,4);
INSERT INTO Cinema_Seat VALUES (1004,204,2,2);
INSERT INTO Cinema_Seat VALUES (1005,205,3,1);
INSERT INTO Cinema_Seat VALUES (1006,206,1,2);
INSERT INTO Cinema_Seat VALUES (1007,207,3,3);
INSERT INTO Cinema_Seat VALUES (1008,208,2,3);
INSERT INTO Cinema_Seat VALUES (1009,209,2,4);
INSERT INTO Cinema_Seat VALUES (1010,210,3,1);





