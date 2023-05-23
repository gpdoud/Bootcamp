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
            From Orders o
            Join Customers c
                on c.Id = o.CustomerId
            Where State = 'IN'
    )

Q. Display all customer names and a count of the number of orders
    for each customer and order by the number of orders descending
A. SELECT c.Name as 'Customer', count(*) as 'Orders'
    From Customers c
    Left Join Orders o
        On o.CustomerId = c.Id
    Group by c.name
    Order by Orders desc

Q. Display total customer sales by State but only
    for the states of 'OH', 'IN', 'KY' and only for sales totals greater than 50,000
A. SELECT State, SUM(Sales)
    From Customer c
    Join Order o
        Where c.Id = o.CustomerId
    Where State in ('OH', 'IN', 'KY')
    Group by State
    Having Sum(Sales) > 50,000