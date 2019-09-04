
-- Orders
CREATE TABLE Orders (
	Id int PRIMARY KEY AUTOINCRMENT NOT NULL,
	Description nvarchar(80) NULL,
	Date datetime NOT NULL,
	CustomerId int NULL FOREIGN KEY REFERENCES Customer(Id)
)

-- OrderLines
CREATE TABLE OrderLines (
	Id int PRIMARY KEY AUTOINCREMENT NOT NULL,
	Product nvarchar(30) NOT NULL,
	Description nvarchar(80) NULL,
	Quantity int NOT NULL,
	Price decimal(9, 2) NOT NULL,
	OrdersId int NOT NULL FOREIGN KEY REFERENCES Orders(Id)
)

-- Customers
CREATE TABLE Customers (
	Id int PRIMARY KEY AUTOINCREMENT NOT NULL,
	Name nvarchar(30) NOT NULL,
	City nvarchar(30) NOT NULL,
	State nchar(2) NOT NULL,
	Sales decimal(9, 2) NOT NULL,
	Active bit NOT NULL
)

-- QUERIES

Q. Display all rows & columns from Customers (Simple SELECT)
A. SELECT * 
    from Customers

Q. Display name, city, and sales from Ohio customers and order by sales descending (WHERE & ORDER BY)
A. SELECT Name, City, Sales 
    from Customers 
        where State = 'OH' 
            order by Sales desc

Q. Display average sales for all customers in Columbus (AVERAGE)
A. SELECT AVG(sales) 
    from Customers 
        WHERE City = 'Columbus'

Q. Display order data and customer name as 'Customer' and sales for customer with sales >= 50000 (JOIN)
A. SELECT o.*, c.Name as 'Customer', c.sales
	from orders o
        join customers c
            on o.CustomerId = c.Id
        where c.Sales >= 50000
            order by c.Sales desc

Q. Display all Customers with no orders (OUTER JOIN)
A. SELECT *
	From Customers c
        Left Join Orders o
            on o.CustomerId = c.Id
        Where o.Id is null

Q. Display Customers with sales > average of all customers and order by sales descending (SUBSELECT)
A. SELECT *
	From Customers
	Where Sales > (
		SELECT AVG(Sales)
			From Customers
	)
	Order By Sales Desc

Q. Show total sales by City (GROUP BY)
A. SELECT City, Sum(Sales)
	From Customers
	    Group by City

Q. Show total sales for Cincinnati & Cleveland (GROUP BY, HAVING)
A. SELECT City, Sum(Sales)
	From Customers
	    Group by City
	        Having City in ('Cincinnati', 'Cleveland')