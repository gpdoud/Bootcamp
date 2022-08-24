use master;

Drop Database If Exists Prs;

Create Database Prs;
go

use Prs;

Create Table Users (
    Id int not null primary key identity(1,1),
    Username varchar(30) not null unique,
    Password varchar(30) not null,
    Firstname varchar(30) not null,
    Lastname varchar(30) not null,
    Phone varchar(12) null,
    Email varchar(255) null,
    IsReviewer bit not null default 0,
    IsAdmin bit not null default 0
);

Create Table Vendors (
    Id int not null primary key identity(1,1),
    Code varchar(30) not null unique,
    Name varchar(30) not null,
    Address varchar(30) not null,
    City varchar(30) not null,
    State char(2) not null default 'OH',
    Zip char(5) not null,
    Phone varchar(12) null,
    Email varchar(255) null
);

Create Table Products (
    Id int not null primary key identity(1,1),
    PartNbr varchar(30) not null unique,
    Name varchar(30) not null,
    Price decimal(11,2) not null,
    Unit varchar(30) not null default 'Each',
    Photopath varchar(255) null,
    VendorId int not null foreign key references Vendors(Id)
);

Create Table Requests (
    Id int not null primary key identity(1,1),
    Description varchar(80) not null,
    Justification varchar(80) not null,
    RejectionReason varchar(80) null,
    DeliveryMode varchar(20) not null default 'Pickup',
    Status varchar(10) not null default 'NEW',
    Total decimal(11,2) not null default 0,
    UserId int not null foreign key references Users(Id)
);

Create Table Requestlines (
    Id int not null primary key identity(1,1),
    RequestId int not null foreign key references Requests(Id),
    ProductId int not null foreign key references Products(Id),
    Quantity int not null default 1
);

GO

-- Add users
Insert Users (Username, Password, Firstname, Lastname, IsReviewer, IsAdmin) VALUES
    ('sa', 'sa', 'Systems', 'Admin', 1, 1),
    ('rv', 'rv', 'Systems', 'Reviewer', 1, DEFAULT),
    ('us', 'us', 'Systems', 'User', 0, DEFAULT);

-- Add vendors
Insert Vendors (Code, Name, Address, City, State, Zip) VALUES 
    ('AMAZ', 'Amazon', '1 Amazon Way', 'Seattle', 'WA', '98765'),
    ('MSFT', 'Microsoft', '1 Microsoft Drive', 'Redmond', 'WA', '98756'),
    ('BBUY', 'BestBuy', '1 Best Buy St', 'Atlanta', 'GA', '74745');

-- Add product
Insert Products (PartNbr, Name, Price, VendorId) VALUES 
    ('Echo', 'Echo Std', 100, (SELECT Id From Vendors Where Code = 'AMAZ')),
    ('EchoDot', 'Echo Dot', 50, (SELECT Id From Vendors Where Code = 'AMAZ')),
    ('EchoShow5', 'Echo Show 5', 150, (SELECT Id From Vendors Where Code = 'AMAZ')),
    ('EchoShow8', 'Echo Show 8', 200, (SELECT Id From Vendors Where Code = 'AMAZ'));