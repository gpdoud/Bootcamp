USE master;
go
DROP DATABASE IF EXISTS xxx;
go
CREATE DATABASE xxx;
go
USE xxx;
go
CREATE TABLE SalesOffice (
  Id int not null primary key identity(1,1),
  Description varchar(30) not null,
  City varchar(30) not null,
  State varchar(2) not null
);
go
INSERT SalesOffice VALUES
    ('Northeast', 'Boston', 'MA'),
    ('Southeast', 'Atlanta', 'GA'),
    ('Southwest', 'Phoenix', 'AZ'),
    ('Northwest', 'Seattle ', 'WA'),
    ('Northcentral', 'Chicago', 'IL'),
    ('Southcentral', 'Dallas', 'TX');
go
CREATE TABLE SalesPerson (
  Id int not null primary key identity(1,1),
  Code varchar(10) not null unique,
  Name varchar(30) not null,
  Sales float not null default 0,
  IsManager bit not null default 0,
  SalesOfficeId int not null foreign key references SalesOffice(id)
);
go
DECLARE @NE int, @SE int, @SW int, @NW int, @NC int, @SC int;
SELECT @NE = Id From SalesOffice Where Description = 'Northeast';
SELECT @SE = Id From SalesOffice Where Description = 'Southeast';
SELECT @SW = Id From SalesOffice Where Description = 'Southwest';
SELECT @NW = Id From SalesOffice Where Description = 'Northwest';
SELECT @NC = Id From SalesOffice Where Description = 'Northcentral';
SELECT @SC = Id From SalesOffice Where Description = 'Southcentral';
INSERT SalesPerson VALUES
    ('NE01', 'Iqra Cohen'       , 62952, 0, @NE),
    ('NE02', 'Leanne Yates'     , 45108, 1, @NE),
    ('NE03', 'Briana Manning'   , 17585, 0, @NE),
    ('SE01', 'Cecelia Perry'    , 47277, 0, @SE),
    ('SE02', 'Ariyah Doherty'   , 33644, 0, @SE),
    ('SE03', 'Avneet Robles'    , 45727, 1, @SE),
    ('SW01', 'Cain Harris'      , 99687, 1, @SW),
    ('SW02', 'Kristin Hirst'    , 94486, 0, @SW),
    ('SW03', 'Bo Yu'            , 82512, 0, @SW),
    ('NW01', 'Amy-Leigh Plant'  , 45634, 0, @NW),
    ('NW02', 'Chardonnay Rojas' , 19529, 1, @NW),
    ('NW03', 'Karol Clayton'    , 26017, 0, @NW),
    ('NC01', 'Fenton Tucker'    , 64717, 0, @NC),
    ('NC02', 'Siena Derrick'    , 15191, 1, @NC),
    ('NC03', 'Oskar Bradford'   , 30223, 0, @NC),
    ('SC01', 'Ellesha Paul'     , 17272, 0, @SC),
    ('SC02', 'Floyd Rennie'     , 77869, 1, @SC),
    ('SC03', 'Darrel Andersen'  , 12088, 0, @SC);

* Write a query that displays the total of all the sales from all offices

    SELECT SUN(Sales) From SalesPerson;

* Write a join query that displays the SalesPerson's Name and SalesOffice's description

    SELECT p.Name, o.Descriptio
      From SalesPerson p
      Join SalesOffice o on o.Id = p.SalesOfficeId