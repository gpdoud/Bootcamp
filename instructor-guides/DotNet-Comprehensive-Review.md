# DotNet Boot Camp - Comprehensive Review

What this is ...

## Git/GitHub
## SQL Server

Some information about SQL Server.

* Case insensitive
* Single quotes for string data
* If data contains a single quote, it must be replaced by two single quotes
* Result set is always rows and columns
* All columns in a table can be NULL; even numbers, booleans, and dates
* Comments
    * // - to the end of the line
    * /*  */ - everything between

### SELECT

The simplest SELECT accessing a table

    SELECT * From Customers

The columns can be listed in any order or the asterisk (*) can be used to to mean all columns in the order defined in the table definition. 

    SELECT *
    SELECT Name, Address, ...

Each column can contain an alias and can be input to a function.

    SELECT SUM(Total) as 'Sales'

Column values can be derived.

    SELECT CONCAT(FirstName, ' ', LastName) as 'Name'

An example of a **Join** view. The **Where** clause can have multiple boolean expressions and use the logical operators **AND**, **OR**, and **NOT**. The **Order by** clause can have multiple columns each with either **asc**, the default, or **desc**.

    SELECT * 
        From Customers c
        Join Orders o
            on o.CustomerId = c.Id
        Where State = 'OH'
        Order by o.Total desc

An example of using **Group by** and **Having** clauses to summarize data

    SELECT c.State, SUM(o.Total)
        From Customers c
        Join Orders o
        Group by c.State
        Having c.Total > 50000

Remember, there is a difference between `Where` clause and `Having` clause.

* **Where** applies to every row in the input
* **Having** applies on every row in the grouped result

Assume that no customer has a Total greater than 10,000. If we add `Where c.Total > 50000`, all customers would be eliminated from the input. But applying the `Having c.Total > 50000`, the check is against the total for the state not the individual customer.

An example of a **Subselect** query.

    SELECT *
        From Customers c
        Where TotalSales > (
            SELECT AVG(TotalSales)
                From Customers
        )

The subquery is executed first then the result set from it is used as data in the outer query. The subquery result should be a single value or a collection of values from one column.

### INSERT

Adds new rows to the table.

    INSERT into Customer
        (Name, Address, City, State, Zip, Total)
    VALUES
        ('ACME MFG', '123 St', 'Mason', 'OH', 10000)

Column names and values are positional. The first value listed represents the data for the first column name.

Required columns are those that cannot be null and do not have a default value specified in the column definition.

The order of the column names and values is not significant. Any order is ok.

### UPDATE

Changes values of rows in the table.

    UPDATE Customer Set
        Name = 'ACME MFG',
        Address = '123 St',
        State = 'OH'
        Where Name = 'ACME Co.'

Should almost **ALWAYS** have a **Where** clause. Otherwise, the **UPDATE** applies to all rows in the table.

The order of **column = 'value'** is not significant.

### DELETE

Removes rows from the table.

    DELETE from Customer
        Where Name = 'ACME MFG'

Should almost **ALWAYS** have a **Where** clause.

### CREATE

Defines new objects like tables.

    CREATE TABLE Customer (
        Id int not null primary key identity(1,1),
        Name nvarchar(30) not null,
        ...
    )

Defines a new table in the database. The column are defined in order given.

### ALTER

    ALTER TABLE Customer
        Add Active bit not null default 1

Changes the definition of an existing table. Adds a new column **Active** to the Customer table.

### DROP

    DROP TABLE Customer

Removes the table and all the data from the database. May fail if the table is used in a foreign key relationship.

### STORED PROCEDURES

Stored procedures are scripts that allow some procedural programming that is not provided using SQL syntax.

Block statements are enclosed within **BEGIN** and **END**.

    DECLARE @Name nvarchar(30) = 'ACME MFG.'

A variable declaration and initialization. Variables must begin with '@'.

    SELECT * From Customer
        Where Name = @Name

Previously declared variable used in a SQL Select.

    IF EXISTS (Select 1 From Customer Where State = 'MT') BEGIN
        ...
    END

Checks if there are any customers in Montana. If so, executes the code block.

    RETURN 0

Returns to the caller and passes the value back so the caller can interpret it.

## C#

* case sensitive
* statements end with semi-colons
* statement blocks with {}
* comments
    * // comment to end of line
    * /* .. */ multiline comments
    * /// XML docs
### Program Statements

    using System;

Using statements define the namespaces to search when using an object name that is not fully qualified. For example, with `using System;`, the Console.WriteLine(..) statement works even though the Console class is in the System namespace. Without the using statment, it would have to be written System.Console.WriteLine(..).

An object name that exists in multiple namespaces must be fully qualified.

    namespace Max { .. }

Namespaces add high level names to objects to reduce the possibility of object name clashes. Everything define within a namespace has that namespace name as a high level qualified.

    class Program { .. }

Defines 'Program' as a class. Classes contain properties (fields) and methods (functions).

    bool Print(string message) { .. }

Defines 'Print' as a method within some class.

Bool indicates the method returns a boolean value. Methods that do not return a value must use void. The value returned is done using the `return` statement;

Parameters used by the method are in the parentheses. Each parameter, separated by a comma, must include a type and name)

    int anInt = 0;
    var aVariable = "a string variable";

Variables are declared by specifying the type or using `var` which will infer the type by the data that initializes the variable.

    integers: int, long
    floating point: float, double, decimal
    boolean: bool
    strings: string

A list of common types.

    var errorNbr = 5;
    var message = $"Error Nbr: {errorNbr}";

Interpolation allows embedding a variable name in a string and having it replaced with the value of the variable. The dollar sign ($) must preceed the string constant.

    // if statement
    if(x == 5) { 
        // true condition 
    } else { 
        // false condition
    }
    // for statement
    for(var i = 0; i < 10; i++) { 
        .. 
    }
    // foreach statement
    foreach(var obj in objCollection) { 
        .. 
    }
    // switch statement
    switch(errorCode) {
        case 1: 
            ..; 
            break;
        case 2: 
            ..; 
            break;
        default: // any other value
            ..; 
            break;
    }
    
A `break` statment terminates a looping statement immediately

A `continue` statement ends the current loop but continues with the remaining loops

### Object-oriented programming
## EntityFramework
## MVC
## HTML
## CSS
## Bootstrap
## jQuery
## Javascript
## Typescript
## Angular