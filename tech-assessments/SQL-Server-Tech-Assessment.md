create table Customers (
    Id int primary key identity(1,1),
    Name varchar(30) not null,
    State char(2) not null default 'OH',
    Sales int not null default 0
);
create table Orders (
    Id int primary key identity(1,1),
    Description varchar(30) not null,
    Total int not null default 0,
    CustomerId int foreign key references Customers(Id)
)

Q. Display all customers in the state of 'WV'
A. SELECT * 
    From Customers 
    Where State = 'WV'

Q. Display all orders with totals < 20,000 and sort by total descending
A. SELECT * 
    From Orders
    Where Total < 20000
    Order by Total desc

Q. Display Customer name, Order Description, and Order Total for 
    orders greater than 10,000 but less than or equal to 35,000
    and display by total in descending sequence
A. SELECT c.Name, o.Description, o.Total
    From Customers c
    Join Orders o
    on c.Id = o.CustomerId
    Where o.Total > 10000 and o.Total <= 35000
    Order by o.Total desc

Q. Display all orders with totals greater than the average
    of all orders in the state of 'IN'
A. SELECT *
    From Orders
    Where Total > (
        SELECT AVG(Total)
            From Orders
            Where State = 'IN'
    )

Q. Display total customer sales by State but only
    for the states of 'OH', 'IN', 'KY'
A. SELECT State, SUM(Sales)
    From Customer
    Group by State
    Having State in ('OH', 'IN', 'KY')