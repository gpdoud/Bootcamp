DELETE Orderlines;
DELETE Orders;
DELETE Customers;
DELETE Products;
GO
-- Customers
INSERT Customers (Name, Code, Sales) VALUES
    ('MAX', 'MAX', 10000),
    ('BestBuy', 'BBUY', 100000),
    ('Target', 'TARG', 1000000);
GO
INSERT Products (Name, Price) VALUES
    ('Bootcamp', 25000),
    ('Pencils', 1.25),
    ('Laptop', 1500);
GO
DECLARE @MaxCustId int, @BestBuyCustId int, @TargetCustId int;

SELECT @MaxCustId = Id From Customers Where Code = 'MAX'; 
SELECT @BestBuyCustId = Id From Customers Where Code = 'BBUY'; 
SELECT @TargetCustId = Id From Customers Where Code = 'TARG'; 

INSERT Orders (Description, Total, Status, Date, CustomerId) VALUES
    ('Max Order', 0, 'NEW', GETDATE(), @MaxCustId),
    ('BestBuy Order', 0, 'NEW', GETDATE(), @BestBuyCustId),
    ('Target Order', 0, 'NEW', GETDATE(), @TargetCustId);

DECLARE @MaxOrderId int, @BestBuyOrderId int, @TargetOrderId int;

SELECT @MaxOrderId = Id From Orders Where Description = 'Max Order';
SELECT @BestBuyOrderId = Id From Orders Where Description = 'BestBuy Order';
SELECT @TargetOrderId = Id From Orders Where Description = 'Target Order';

INSERT Orderlines (OrderId, ProductId, Quantity) VALUES 
    (@MaxOrderId, (SELECT Id from Products where Name = 'Bootcamp'), 1),
    (@MaxOrderId, (SELECT Id from Products where Name = 'Pencils'), 100),
    (@MaxOrderId, (SELECT Id from Products where Name = 'Laptop'), 10);
GO
