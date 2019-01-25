# SQL Server Topics

* NULL - absence of value
    * default for all columns
    * test for : is null, is not null

* WHERE operators
    * equal, not equal : =, !=, <>
    * LT, GT : <, >
    * not LT, GT : !<, !>
    * in (..)
    * like : % _ ; like ('%AB_')
    * boolean : and, or, not
    * between : between a and b (inclusive)

* Comments
    * to end of line : //
    * all in between : /* .. */

* DML
    * delete (DML)
        * DELETE From tablename {Where condition}
    * insert (DML)
        * INSERT Into tablename (col1, col2, ...) Values (val1, val2, ...)
        * valN can be a constant
        * INSERT Into Table-A // create table-A first
            SELECT col1, col2, ... From Table-B
    * update (DML)
        * UPDATE tablename Set col1 = val1, col2 = val2, ... {Where condition}
    * transactions
        * BEGIN TRANSACTION {name}
        * ROLLBACK { TRANSACTION { name } }
        * COMMIT { TRANSACTION {name} }

* DDL
    * create table tablename (..)
    * columns
        * columnname
        * types: int, nvarchar, datetime, bit
        * nullable
        * default
        * unique
        * identity(start, increment)
        * primary key
        * foreign key references tablename.column
            on [delete, update] { **no action** | cascade | set null | set default }
        * check ( expression ) // col < val

* PRS
    * Users
        * Username nvarchar(30) not null unique
        * Password nvarchar(30) not null
        * Firstname nvarchar(30) not null
        * Lastname nvarchar(30) not null
        * Phone nvarchar(12)
        * Email nvarchar(255)
        * IsReviewer bit not null default 0
        * IsAdmin bit not null default 0
        * Active bit not null default 1
    * Vendors
        * Code nvarchar(4) not null unique
        * Name nvarchar(50) not null
        * Address nvarchar(30)
        * City nvarchar(30)
        * State nchar(2)
        * Zip nvarchar(10)
        * Phone nvarchar(12)
        * Email nvarchar(255)
        * IsPreferred bit not null default 1
        * Active bit not null default 1
    * Products
        * VendorId int not null
        * PartNumber nvarchar(30) not null
        * Name nvarchar(30) not null
        * Price decimal(9,2) not null default 0
        * Unit nvarchar(10) not null default 'Each'
        * PhotoPath nvarchar(255)
        * Active bit not null default 1
    * Requests
        * UserId int not null
        * Description nvarchar(80)
        * Justification nvarchar(80)
        * RejectionReason nvarchar(80)
        * DeliveryMode nvarchar(30) default 'Pickup'
        * ReviewDate datetime not null default getdate()
        * Status not null default 'NEW' 
            check (Status in ('NEW','REVIEW','APPROVED','REJECTED'))
        * Total decimal(11,2) not null default 0
        * Active bit not null default 1
    * RequestLines
        * ProductId int not null
        * RequestId int not null
        * Quantity int not null default 1
    
* functions
    * aggregate
        * avg
        * count
        * min & max
        * sum
    * conversion
        * convert
        * parse // parse(123.45 as money using 'en-US')
    * cursor
        * @@FETCH_STATUS // 0 success
    * dates
        * DATEADD(d, 1, GETDATE())
        * DATEDIFF(d, date1, date2)
        * DATEFROMPARTS(1957, 8, 27)
        * DATENAME(year, '1957-08-27') // returns string
        * DATEPART(year, '1957-08-27') // returns int
        * YEAR, MONTH, DAY
    * logical
        * IIF(cond, true, false)
    * string
        * CONCAT(str1, str2, ...)
        * FORMAT(value, format, [culture])
            * 'C'/'c' : Currency
            * 'D'/'d' : Decimal
            * 'G'/'g' : General
            * 'N'/'n' : Number
            * 'P'/'p' : Percent
        * LEFT(str, 5), RIGHT(str, 5)
        * LEN(str)
        * LOWER(str), UPPER(str) // case
        * LTRIM(str), TRIM(str), RTRIM(str)
        * REPLACE(str, from, to)
        * SPACE(cnt) // spaces
        * STR(nbr, [ length [, decimals ] ])
        * SUBSTRING(str, start, len)
    * system
        * @@ERROR // returns last error
        * @@IDENTITY // returns last generated identity value
        * @@ROWCOUNT // returns nbr rows affected
        * ISNULL(value, replacementIfNull)
    * user-defined

* procedures (https://docs.microsoft.com/en-us/sql/t-sql/language-elements/use-transact-sql?view=sql-server-2017)
    * @@ROWCOUNT : rows affected by last operation
    * go
    * control flow
    * cursors
    * expressions
    * operators
    * transactions
    * variables

* system tables