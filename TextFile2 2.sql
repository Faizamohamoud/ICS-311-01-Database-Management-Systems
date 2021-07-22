CREATE DATABASE WEATHER

Create table Location (
Station_Name varchar(20) Primary key,
Latitude INT,
Longitude INT
);

Create table Wind (
Station_Name varchar(20) Primary key,
Year Datetime,
Month INT,
Speed INT
);

Create table Temperature (
Station_Name varchar(20) Primary key,
Year Datetime,
Month INT,
Temperature INT
);

load data infile 'c:/wind.csv' 
     into table Wind 
	 load data infile 'c:/temperature.csv' 
     into table Temperature 
	 load data infile 'c:/location.csv' 
     into table Location 

--1-	Produce a list of station name, year, month, wind speed, temperature.--

Select * from Temperature


--2-	For each station, find the total number of valid wind reports and the total number of valid temperature reports. (Note: do not count NULL as a valid report).--
SELECT D.Station_Name,Count(speed) AS WINDSPEED,COUNT(Temperature) AS TEMP
From Wind d,Temperature t
where d.Station_Name=t.Station_Name AND d.Speed is not null
Group By D.Station_Name;

--3-	For each station, find the total number of wind reports and the total number of temperature reports in each year. From the output, identify stations that did not report a valid reading every month.--
SELECT D.Station_Name,d.Year,Count(speed) AS WINDSPEED,COUNT(Temperature) AS TEMP
From Wind d,Temperature t
where d.Station_Name=t.Station_Name AND d.Speed is not null
Group By D.Station_Name,d.Year;

--4-	Find how many wind speed reports are collected in each month? How many temperature reports are collected each month?--
Select Month,Count(speed) AS REPORT
from wind
group by Month;

Select Month,Count(Temperature) AS REPORT
from Temperature
group by Month;

--5-	For each station, find the first year at which the station started to report wind speeds and the first year at which the station started to report temperature readings.--
Select Top 1 d.Station_Name,d.Year AS FirstYear
from wind d,Temperature t 
where d.Station_Name = t.Station_Name
Group by d.Station_Name,d.Year
order by d.Year asc
--6-	Find the coldest and hottest temperatures for each station.--
Select station_name ,Max(temperature) as max,Min(temperature) AS min
from Temperature
group by Station_Name
--7-	What is the maximum and minimum temperatures reported in 2000? What are the stations that reported these maximum and minimum temperatures?--
Select Temperature.station_name ,Max(temperature) as max,Min(temperature) AS min
from Temperature
where Year = '2000'
Group by Station_Name
--8-	What is the average wind speed at 90-degree latitude? (Note: do not look at the data to find what stations are located at 90-degree latitude, however, you have to use 90 in your query)--
Select AVG(d.speed) as average 
from Location v,Wind d 
where v.Station_Name = d.Station_Name
and v.Latitude = 90
--9-	The name of the weather station at the South Pole is called Clean Air, because very little man-made pollution can be found there. Find out what temperatures were recorded at the South Pole such that the output is sorted by temperatures. When is it Summer and when it is winter in South pole?--
Select Temperature
from Temperature
where Station_Name ='Clean Air'
order by Temperature ASC
--having a look at the table we can see that  winter is in august and is summer in december--


--10-	For each station, find the maximum, minimum, and average temperature reported in a certain month of the year. Comment on when do you think it is summer and when it is winter for each station. --
Select station_name,max(temperature),MIN(TEMPERATURE),AVG(TEMPERATURE)
FROM Temperature
group by Month,Station_Name;
--For Faraday is winter in july and summer in february,for Grytviken is winter in august and summer in february ,for Halley is winter in august and summer in january 
-- for Neumayer is winter in august and summer in february,Rothera winter in july ,summer in january
--for Signy is winter in july and summer in february--


 

 