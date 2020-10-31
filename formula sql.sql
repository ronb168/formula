create schema Car_Race;
use Car_Race;


create table Team
(
	ID int NOT NULL PRIMARY KEY, 
	Name varchar(100), 
	Country varchar(100), 
	NumOfCars int,
    Budget float
)
    engine=innodb;
    
create table Car
(
	ID int NOT NULL PRIMARY KEY, 
	Name varchar(100),
	TeamID int,
    FOREIGN KEY (TeamID) REFERENCES Team(ID)
)
	engine=innodb;

create table Driver
(
	ID int NOT NULL PRIMARY KEY, 
	Name varchar(100), 
	Country varchar(100), 
	DoB date,
    ExpYear int,
    TeamID int,
    FOREIGN KEY (TeamID) REFERENCES Team(ID)
)
    engine=innodb;
    

create table Sponser
(
	ID int NOT NULL PRIMARY KEY, 
	Name varchar(100), 
    SponserFeeTeam int,
    SponserFeeRace int 
)
	engine=innodb;
    
create table Race
(
	ID int NOT NULL PRIMARY KEY,
	City varchar (100) ,
    Rdate date ,
    Capacity int
)
	engine=innodb;
    
create table MaintenanceStaff
(
	ID int NOT NULL PRIMARY KEY,
    TeamID int,
    FOREIGN KEY (TeamID) REFERENCES Team(ID),
    numOfTechnician int
)
	engine=innodb;


create table RaceSponser
(
	primary key (RaceID,SponserID),
    RaceID int NOT NULL,
    SponserID int NOT NUll,
	SponserFeeRace int,
    isMain bit not null,
	FOREIGN key (RaceID) REFERENCES Race(ID),
    FOREIGN key (SponserID) REFERENCES Sponser(ID)
)
	engine=innodb;
    
create table TeamSponser
(
	primary key (TeamID , SponserID),
    TeamID int,
    SponserID int,
    SponserFeeTeam int,
	FOREIGN key (TeamID) REFERENCES Team(ID),
    FOREIGN key (SponserID) REFERENCES Sponser(ID),
	isMain bit not null
)
	engine=innodb;
    
create table RaceDriverCar
(
	primary key (RaceID , DriverID, CarID),
	RaceID int ,
    DriverID int ,
    CarID int,
    ranking int,
    points int,
    FOREIGN key (CarID) REFERENCES Car(ID),
	FOREIGN key (RaceID) REFERENCES Race(ID),
    FOREIGN key (DriverID) REFERENCES Driver(ID)
  
)
	engine=innodb;
    
    
    create table MaintenanceInRace
(
	primary key (MaintenanceStaffID , TeamID ,RaceID),
	MaintenanceStaffID int ,
    TeamID int,
    RaceID int,
    numOfFixes int,
    FOREIGN key (TeamID) REFERENCES Team(ID),
	FOREIGN key (MaintenanceStaffID) REFERENCES MaintenanceStaff(ID),
	FOREIGN key (RaceID) REFERENCES Race(ID)
)
	engine=innodb;
    
/* Team */
/* ID , Name, Country, numOfCars,Budget */
INSERT INTO Team VALUES 
(1, 'Ferrari', 'Italy', 3, 10000000),
(2,'Mercedes', 'Germany',5,12000000),
(3,'Renault', 'France', 1, 8000000),
(4,'McLaren', 'Grate Britain',2,9000000),
(5, 'Alfa Romeo', 'Italy', 2,11000000)
;

/* Driver*/
/* ID , Name, Country ,Dob,ExpYear,TeamID */
INSERT INTO Driver VALUES 
(11, 'Luis Hemilton', 'GB','19850607',12,2),
(12,'Kimi Raikkonen', 'Finland','19791017',18,5),
(13,'Antonio Giovinazzi', 'Italy','19931214',02,5),
(14,'Valtteri Bottas', 'Finland','19890828',06,2),
(15,'Sebastian Vettel', 'Germany','19870703',12,1),
(16,'Charles Leclerc', 'Monaco','19971016',01,1),
(17,'Daniel Ricciardo', 'Australia','19890701',08,3),
(18,'Nico Hülkenberg', 'Germany','19870819',09,3),
(19,'Lando Norris', 'GB','19991113',01,4),
(20,'Carlos Sainz Jr', 'Spain','19940901',04,4)
;

/* Car */
/* ID , Name,TeamID */
INSERT INTO Car VALUES
(21, 'F1 W10 EQ Power+44',2),
(22, 'C387',5),
(23, 'C3899',5),
(24, 'F1 W10 EQ Power+77',2),
(25, 'SF905',1),
(26, 'SF9016',1),
(27,'R.S.193',3),
(28, 'R.S.1927',3),
(29, 'MCL344',4),
(30, 'MCL3455',4)
;
/* Race */
/* ID , City, Date , Capacity */
INSERT INTO Race VALUES 
(31, 'Monte Carlo', '20190525',37000),
(32,'Tokyo', '20191013',155000),
(33,'Budapest', '20190804',70000),
(34,'Abu Dhabi', '20191201',60000),
(35, 'Barcelona', '20190512',140700),
(36, 'Sau Paulo','20191117',60000),
(37, 'Shanghai','20190414',200000),
(38,'Melborn','20190317',80000)
;
/* Sponser */
/* ID , Name ,SponserFeeTeam,SponserFeeRace */
INSERT INTO Sponser VALUES 
(41, 'Rolex',  500000,645000),
(42, 'Red Bull', 250000,123750),
(43, 'Heineken', 700000,547000),
(44, 'Emirates', 400000,1000000),
(45, 'DHL', 1000000,879000),
(46, 'Irelli', null,100000),
(47, 'Amazon',null,600000)
;
 
/* Maintenance Staff */
/* ID , Team ID, numOfTechnician */
INSERT INTO MaintenanceStaff VALUES
(51,1,5),
(52,2,7),
(53,3,3),
(54,4,4),
(55,5,2)
;
/* RaceDriverCar */
/* RaceID,DriverID,CarID,Ranking,Points */
INSERT INTO RaceDriverCar VALUES
(31,15,25,1,25),(31,12,23,2,18),(31,13,22,3,15),(31,14,24,4,12),(31,11,21,5,10),(31,16,26,6,8),(31,17,27,7,6),(31,18,28,8,4),(31,19,29,9,2),(31,20,30,10,1),
(32,15,26,1,25),(32,20,29,2,18),(32,13,22,3,15),(32,14,21,4,12),(32,18,27,5,10),(32,19,30,6,8),(32,16,25,7,6),(32,11,24,8,4),(32,12,23,9,2),(32,17,28,10,1),
(33,11,21,1,25),(33,13,22,2,18),(33,15,25,3,15),(33,17,27,4,12),(33,19,30,5,10),(33,12,23,6,8),(33,14,24,7,6),(33,16,26,8,4),(33,18,28,9,2),(33,20,30,10,1),
(34,12,23,1,25),(34,19,30,2,18),(34,18,27,3,15),(34,17,28,4,12),(34,16,25,5,10),(34,15,26,6,8),(34,14,21,7,6),(34,13,22,8,4),(34,20,29,9,2),(34,11,24,10,1),
(35,11,21,1,25),(35,14,24,2,18),(35,15,25,3,15),(35,20,30,4,12),(35,17,27,5,10),(35,13,22,6,8),(35,12,23,7,6),(35,19,29,8,4),(35,18,28,9,2),(35,16,26,10,1),
(36,15,25,1,25),(36,11,24,2,18),(36,16,25,3,15),(36,14,21,4,12),(36,20,29,5,10),(36,13,22,6,8),(36,17,28,7,6),(36,19,30,8,4),(36,18,27,9,2),(36,12,23,10,1),
(37,17,27,1,25),(37,15,25,2,18),(37,20,30,3,15),(37,12,23,4,12),(37,13,22,5,10),(37,14,24,6,8),(37,11,21,7,6),(37,16,26,8,4),(37,18,28,9,2),(37,19,29,10,1),
(38,15,26,1,25),(38,17,28,2,18),(38,20,29,3,15),(38,12,23,4,12),(38,13,22,5,10),(38,14,21,6,8),(38,11,24,7,6),(38,16,25,8,4),(38,18,27,9,2),(38,19,30,10,1)
;

/* Race & Sponser  */
/* 	RaceID ,SponserID,SponserFeeRace,isMain  */
INSERT INTO RaceSponser VALUES
(31,41,645000,0),
(32,42,1237500,0),
(33,43,547000,1),
(34,44,1000000,0),
(35,45,879000,1),
(36,46,100000,1),
(37,47,600000,0),
(38,44,null,0)
;
/* Team & Sponser */
/* TeamID, SponserID ,SponserFeeTeam,isMain*/
INSERT INTO TeamSponser VALUES 
(1, 41,500000,0),
(2, 42,250000,1),
(3, 43,700000,0),
(4, 44,400000,1),
(5, 45,1000000,0)
;

/* MaintenanceInRace */
/* MaintenanceStaffID , TeamID ,RaceID, numOfFixes */
INSERT INTO MaintenanceInRace VALUES
(51,1,31,2),
(52,2,31,4),
(53,3,31,5),
(54,4,31,3),
(55,5,31,2),
(51,1,32,4),
(52,2,32,1),
(53,3,32,2),
(54,4,32,2),
(55,5,32,3),
(51,1,33,null),
(52,2,33,null),
(53,3,33,null),
(54,4,33,null),
(55,5,33,null),
(51,1,34,1),
(52,2,34,2),
(53,3,34,3),
(54,4,34,4),
(55,5,34,5),
(51,1,35,2),
(52,2,35,2),
(53,3,35,1),
(54,4,35,3),
(55,5,35,2),
(51,1,36,4),
(52,2,36,1),
(53,3,36,1),
(54,4,36,1),
(55,5,36,1),
(51,1,37,null),
(52,2,37,4),
(53,3,37,1),
(54,4,37,3),
(55,5,37,2),
(51,1,38,2),
(52,2,38,4),
(53,3,38,5),
(54,4,38,3),
(55,5,38,null)
;

#1
select d.*,avg(rdc.ranking) as average_rank
from Driver d
join RaceDriverCar rdc
	on d.ID = rdc.DriverID
group by d.ID
order by average_rank;

#2
select r.ID, r.Name ,r.Country , r.DoB,r.ExpYear, r.TeamID, carName, calculated_points
from (
select d.ID, d.Name ,d.Country , d.DoB,d.ExpYear,
 d.TeamID ,c.name as carName,sum(rdc.points) as calculated_points
from Driver d
join RaceDriverCar rdc
	on d.ID = rdc.DriverID
join Car c
	on c.ID = rdc.CarID
group by d.ID
order by calculated_points desc
) as r;

#3
select  r.*
from race r 
where exists (
	select numOfFixes 
    from MaintenanceInRace mir
    where r.ID = mir.RaceID and numOfFixes is null
);

#4
select d.name , rdc.ranking,rdc.RaceID
from driver d
join RaceDriverCar rdc
	on rdc.DriverID = d.ID
where d.name like '% R%' and d.ExpYear = (
	select max(d.ExpYear)
    from Driver d
)
order by rdc.ranking;

#5
select r.*,sum(mir.numOfFixes) as numOfFixes
from race r ,MaintenanceInRace mir
where r.ID = mir.RaceID
group by r.ID 
having numOfFixes >10
order by numOfFixes desc
;

#6
select s.*
from sponser s,RaceSponser rs,TeamSponser ts
where s.ID = rs.SponserID and s.ID = ts.SponserID
group by s.ID,rs.SponserID,ts.SponserID
having rs.isMain = 1 and ts.isMain = 0;
#7
select t.*,count(rdc.ranking) as numOfWins
from team t 
join driver d
	on d.TeamID = t.ID
join RaceDriverCar rdc
	on d.ID = rdc.DriverID
where rdc.ranking = 1
group by t.ID
order by budget desc
limit 3;

#8
select d.Name , r.*
from Driver d 
join RaceDriverCar rdc
	on d.ID = rdc.DriverID
join Race r 
	on r.ID = rdc.RaceID
where rdc.ranking = 1 and r.capacity >= all(
	select r.capacity
    from race r 
);

#9
select t.*, ms.numOfTechnician as numOfTechnician 
from MaintenanceStaff ms
join team t 
	on t.ID = ms.TeamID
join driver d
	on d.TeamID = t.ID
join RaceDriverCar rdc
	on d.ID = rdc.DriverID
where rdc.ranking = 1 and ms.numOfTechnician = (
	select min(ms.numOfTechnician)
    from MaintenanceStaff ms
);

#10
select d.ID,d.Name,d.Country,d.DoB as DateOfBirth,d.ExpYear,d.TeamID,count(rdc.ranking) as TimeOfLastPlace,
round(datediff(CURDATE(),d.DoB)/360)as Age
from Driver d
join RaceDriverCar rdc
	on d.ID = rdc.DriverID
where rdc.ranking = 10 and DoB >= any(
	select DoB
    from Driver 
    where DoB = '1997-10-16'
) 
group by d.ID;


# 11 - update
update Team 
set Budget  = Budget * 1.3
where ID = 1;
 
 
 
# 12 - update
update Sponser
set SponserFeeTeam = 500000 
where ID = 47;

# 13 - update
update Race
set Capacity = 100000 
where ID = 36;


#14 - update
update TeamSponser
set isMain = 0 
where TeamID = 4;


